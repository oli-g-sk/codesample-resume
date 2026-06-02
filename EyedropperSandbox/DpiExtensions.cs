using System.Windows;
using System.Windows.Media;

namespace EyedropperSandbox;

public static class DpiExtensions
{
    public static System.Windows.Point ToDeviceIndependentPixel(this System.Drawing.Point point, Visual relativeTo)
    {
        var source = PresentationSource.FromVisual(relativeTo);
        if (source?.CompositionTarget is null)
        {
            return new System.Windows.Point(point.X, point.Y);
        }

        return source.CompositionTarget.TransformFromDevice.Transform(new System.Windows.Point(point.X, point.Y));
    }
}
