using System.Windows;
using System.Windows.Media;

namespace EyedropperSandbox;

public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    private void PickColor_OnClick(object sender, RoutedEventArgs e)
    {
        var picker = new EyedropperWindow { Owner = this };
        picker.ShowDialog();

        if (picker.Cancelled)
        {
            return;
        }

        System.Windows.Media.Color color = picker.SelectedColor;
        ColorSwatch.Background = new SolidColorBrush(color);
        HexText.Text = $"#{color.A:X2}{color.R:X2}{color.G:X2}{color.B:X2}";
    }
}
