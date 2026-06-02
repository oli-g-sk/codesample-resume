using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using Forms = System.Windows.Forms;

namespace EyedropperSandbox;

public sealed class Eyedropper : IDisposable
{
    public const int MinimumZoomLevel = 2;
    public const int MaximumZoomLevel = 20;

    private readonly object sync = new();
    private Bitmap[]? screenshots;
    private bool createPreview;
    private int previewImageSize;
    private int zoomLevel = 4;

    public int ZoomLevel
    {
        get => zoomLevel;
        set
        {
            int clamped = Math.Clamp(value, MinimumZoomLevel, MaximumZoomLevel);
            if (zoomLevel == clamped)
            {
                return;
            }

            zoomLevel = clamped;
            Update();
        }
    }

    public event EventHandler<Color>? ColorChanged;

    public event EventHandler<Bitmap>? PreviewChanged;

    public void EnablePreview(int imageSize)
    {
        createPreview = true;
        previewImageSize = imageSize;
    }

    public void Start()
    {
        RefreshScreenshots();
        Update();
    }

    public void Stop()
    {
        lock (sync)
        {
            DisposeScreenshots();
            screenshots = null;
        }
    }

    public void RefreshScreenshots()
    {
        var screens = Forms.Screen.AllScreens;
        var next = new Bitmap[screens.Length];
        for (int i = 0; i < screens.Length; i++)
        {
            next[i] = CaptureScreen(screens[i]);
        }

        lock (sync)
        {
            DisposeScreenshots();
            screenshots = next;
        }
    }

    public void Update()
    {
        var mousePosition = Forms.Control.MousePosition;
        var screen = Forms.Screen.FromPoint(mousePosition);
        int screenIndex = Array.IndexOf(Forms.Screen.AllScreens, screen);
        if (screenIndex < 0)
        {
            return;
        }

        Bitmap screenshot;
        lock (sync)
        {
            if (screenshots is null || screenIndex >= screenshots.Length)
            {
                return;
            }

            screenshot = (Bitmap)screenshots[screenIndex].Clone();
        }

        using (screenshot)
        {
            int x = mousePosition.X - screen.Bounds.X;
            int y = mousePosition.Y - screen.Bounds.Y;
            if (x < 0 || x >= screenshot.Width || y < 0 || y >= screenshot.Height)
            {
                return;
            }

            ColorChanged?.Invoke(this, screenshot.GetPixel(x, y));

            if (createPreview)
            {
                PreviewChanged?.Invoke(this, GetPreviewImage(screenshot, x, y));
            }
        }
    }

    public void Dispose()
    {
        Stop();
    }

    private Bitmap GetPreviewImage(Image screenshot, int x, int y)
    {
        int sampleSize = previewImageSize / ZoomLevel;
        if (sampleSize % 2 == 1)
        {
            sampleSize++;
        }

        var source = new Rectangle(x - sampleSize / 2, y - sampleSize / 2, sampleSize, sampleSize);
        using var sample = new Bitmap(sampleSize, sampleSize);
        using (Graphics graphics = Graphics.FromImage(sample))
        {
            graphics.DrawImage(screenshot, 0, 0, source, GraphicsUnit.Pixel);
        }

        var preview = new Bitmap(previewImageSize, previewImageSize);
        using Graphics previewGraphics = Graphics.FromImage(preview);
        previewGraphics.InterpolationMode = InterpolationMode.NearestNeighbor;
        previewGraphics.PixelOffsetMode = PixelOffsetMode.Half;
        previewGraphics.DrawImage(sample, 0, 0, previewImageSize, previewImageSize);
        return preview;
    }

    private static Bitmap CaptureScreen(Forms.Screen screen)
    {
        Rectangle bounds = screen.Bounds;
        var bitmap = new Bitmap(bounds.Width, bounds.Height, PixelFormat.Format24bppRgb);
        using Graphics graphics = Graphics.FromImage(bitmap);
        graphics.CopyFromScreen(bounds.X, bounds.Y, 0, 0, bounds.Size, CopyPixelOperation.SourceCopy);
        return bitmap;
    }

    private void DisposeScreenshots()
    {
        if (screenshots is null)
        {
            return;
        }

        foreach (Bitmap screenshot in screenshots)
        {
            screenshot.Dispose();
        }
    }
}
