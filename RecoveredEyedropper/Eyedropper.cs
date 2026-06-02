using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Windows.Forms;
using ChyronHego.Enterprise.Infrastructure.UI.Controls.ColorPickerStyled.GlobalHook;

namespace ChyronHego.Framework.Application.UI.UserInterface.Controls;

public class Eyedropper
{
	public const int MinimumZoomLevel = 2;

	public const int MaximumZoomLevel = 20;

	private Point globalMousePosition;

	private bool graphicsInUse;

	private bool createPreview;

	private int previewImageSize;

	private int zoomLevel = 4;

	private Bitmap[] screenshots;

	public int ZoomLevel
	{
		get
		{
			return zoomLevel;
		}
		set
		{
			if (value >= 2 && value <= 20)
			{
				zoomLevel = value;
				Update();
			}
		}
	}

	private Screen CurrentMouseScreen => Screen.FromPoint(globalMousePosition);

	private Point LocalMousePosition => new Point(globalMousePosition.X - CurrentMouseScreen.Bounds.X, globalMousePosition.Y - CurrentMouseScreen.Bounds.Y);

	public event EventHandler<Color> ColorChanged;

	public event EventHandler<Bitmap> PreviewChanged;

	public void EnablePreview(int imageSize)
	{
		createPreview = true;
		previewImageSize = imageSize;
	}

	public void Start()
	{
		screenshots = new Bitmap[Screen.AllScreens.Length];
		for (int i = 0; i < Screen.AllScreens.Length; i++)
		{
			screenshots[i] = CaptureScreen(Screen.AllScreens[i]);
		}
		HookManager.MouseMove += HookManager_MouseMove;
		globalMousePosition = Control.MousePosition;
		Update();
	}

	public void Stop()
	{
		HookManager.MouseMove -= HookManager_MouseMove;
		screenshots = null;
	}

	private void Update()
	{
		if (screenshots == null || graphicsInUse)
		{
			return;
		}
		int x = LocalMousePosition.X;
		int y = LocalMousePosition.Y;
		int num = Array.IndexOf(Screen.AllScreens, CurrentMouseScreen);
		Bitmap bitmap = screenshots[num];
		if (x >= 0 && x < bitmap.Width && y >= 0 && y < bitmap.Height)
		{
			graphicsInUse = true;
			Color pixel = bitmap.GetPixel(x, y);
			this.ColorChanged?.Invoke(this, pixel);
			if (createPreview)
			{
				Bitmap previewImage = GetPreviewImage(bitmap, x, y);
				this.PreviewChanged?.Invoke(this, previewImage);
			}
			graphicsInUse = false;
		}
	}

	private Bitmap GetPreviewImage(Image screenshot, int x, int y)
	{
		int num = previewImageSize / ZoomLevel;
		if (num % 2 == 1)
		{
			num++;
		}
		Point location = new Point(x - num / 2, y - num / 2);
		Size size = new Size(num, num);
		Rectangle rectangle = default(Rectangle);
		rectangle.Location = location;
		rectangle.Size = size;
		Rectangle srcRect = rectangle;
		Bitmap image = new Bitmap(num, num);
		using (Graphics graphics = Graphics.FromImage(image))
		{
			graphics.DrawImage(screenshot, 0, 0, srcRect, GraphicsUnit.Pixel);
		}
		Bitmap bitmap = new Bitmap(previewImageSize, previewImageSize);
		using Graphics graphics2 = Graphics.FromImage(bitmap);
		graphics2.InterpolationMode = InterpolationMode.NearestNeighbor;
		graphics2.DrawImage(image, 0, 0, previewImageSize, previewImageSize);
		return bitmap;
	}

	private static Bitmap CaptureScreen(Screen screen)
	{
		Rectangle bounds = screen.Bounds;
		Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height, PixelFormat.Format24bppRgb);
		Graphics.FromImage(bitmap).CopyFromScreen(bounds.X, bounds.Y, 0, 0, bounds.Size, CopyPixelOperation.SourceCopy);
		return bitmap;
	}

	private void HookManager_MouseMove(object sender, MouseEventArgs e)
	{
		globalMousePosition = e.Location;
		Update();
	}
}
