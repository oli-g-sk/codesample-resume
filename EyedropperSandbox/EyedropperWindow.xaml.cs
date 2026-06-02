using System.ComponentModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Threading;
using DrawingBitmap = System.Drawing.Bitmap;
using DrawingColor = System.Drawing.Color;
using Forms = System.Windows.Forms;

namespace EyedropperSandbox;

public partial class EyedropperWindow : Window
{
    private readonly DispatcherTimer mouseTimer;
    private readonly DispatcherTimer screenshotTimer;
    private readonly Eyedropper eyedropper;

    public System.Windows.Media.Color SelectedColor { get; private set; }

    public bool Cancelled { get; private set; } = true;

    public EyedropperWindow()
    {
        InitializeComponent();

        eyedropper = new Eyedropper();
        eyedropper.EnablePreview((int)(double)Resources["SizeFull"]);
        eyedropper.ColorChanged += Eyedropper_ColorChanged;
        eyedropper.PreviewChanged += Eyedropper_PreviewChanged;

        mouseTimer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(16) };
        mouseTimer.Tick += (_, _) =>
        {
            UpdateWindowPosition();
            eyedropper.Update();
        };

        screenshotTimer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(200) };
        screenshotTimer.Tick += (_, _) =>
        {
            eyedropper.RefreshScreenshots();
            eyedropper.Update();
        };

        Loaded += Window_Loaded;
        Closing += Window_Closing;
    }

    private void Window_Loaded(object sender, RoutedEventArgs e)
    {
        Mouse.OverrideCursor = System.Windows.Input.Cursors.None;
        eyedropper.Start();
        UpdateWindowPosition();
        mouseTimer.Start();
        screenshotTimer.Start();
        Focus();
    }

    private void Window_Closing(object? sender, CancelEventArgs e)
    {
        mouseTimer.Stop();
        screenshotTimer.Stop();
        Mouse.OverrideCursor = null;
        eyedropper.ColorChanged -= Eyedropper_ColorChanged;
        eyedropper.PreviewChanged -= Eyedropper_PreviewChanged;
        eyedropper.Dispose();
    }

    private void UpdateWindowPosition()
    {
        System.Windows.Point cursor = Forms.Control.MousePosition.ToDeviceIndependentPixel(this);
        Left = cursor.X - (int)(ActualWidth / 2.0);
        Top = cursor.Y - (int)(ActualHeight / 2.0);
    }

    private void Window_MouseDown(object sender, MouseButtonEventArgs e)
    {
        Cancelled = false;
        e.Handled = true;
        Close();
    }

    private void Window_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
    {
        if (e.Key == Key.Escape)
        {
            Cancelled = true;
            Close();
        }
    }

    private void Window_MouseWheel(object sender, MouseWheelEventArgs e)
    {
        eyedropper.ZoomLevel += e.Delta > 0 ? 1 : -1;
        e.Handled = true;
    }

    private void Eyedropper_ColorChanged(object? sender, DrawingColor color)
    {
        SelectedColor = System.Windows.Media.Color.FromArgb(color.A, color.R, color.G, color.B);
        RingColor.Stroke = new SolidColorBrush(SelectedColor);
    }

    private void Eyedropper_PreviewChanged(object? sender, DrawingBitmap bitmap)
    {
        using (bitmap)
        {
            ImgPreview.Source = bitmap.ToBitmapImage();
        }
    }
}
