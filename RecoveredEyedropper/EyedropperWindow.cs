using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Threading;
using ChyronHego.Enterprise.Infrastructure.UI.Controls.ColorPickerStyled.GlobalHook;
using ChyronHego.Enterprise.Presentation.Extensions;

namespace ChyronHego.Framework.Application.UI.UserInterface.Controls;

public class EyedropperWindow : Window, IComponentConnector
{
	private readonly Eyedropper eyedropper;

	internal System.Windows.Controls.Image ImgPreview;

	internal Ellipse RingColor;

	private bool _contentLoaded;

	public System.Windows.Media.Color SelectedColor { get; private set; }

	public bool Cancelled { get; private set; }

	public EyedropperWindow()
	{
		InitializeComponent();
		eyedropper = new Eyedropper();
		double num = (double)base.Resources["SizeFull"];
		eyedropper.EnablePreview((int)num);
		base.Loaded += Window_Loaded;
		base.Closing += Window_Closing;
	}

	private void UpdateWindowPosition()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		Point val = System.Windows.Forms.Control.MousePosition.ToWindowsPoint().ToDeviceIndependentPixel(this);
		double left = ((Point)(ref val)).X - (double)(int)(base.ActualWidth / 2.0);
		double top = ((Point)(ref val)).Y - (double)(int)(base.ActualHeight / 2.0);
		((DispatcherObject)this).Dispatcher.BeginInvoke((Delegate)(Action)delegate
		{
			base.Left = left;
			base.Top = top;
		}, Array.Empty<object>());
	}

	private void Window_Loaded(object sender, RoutedEventArgs e)
	{
		Mouse.OverrideCursor = System.Windows.Input.Cursors.None;
		HookManager.MouseMove += HookManager_MouseMove;
		HookManager.MouseWheel += HookManager_MouseWheel;
		eyedropper.ColorChanged += Eyedropper_ColorChanged;
		eyedropper.PreviewChanged += Eyedropper_PreviewChanged;
		eyedropper.Start();
		UpdateWindowPosition();
	}

	private void Window_Closing(object sender, CancelEventArgs e)
	{
		HookManager.MouseMove -= HookManager_MouseMove;
		HookManager.MouseWheel -= HookManager_MouseWheel;
		Mouse.OverrideCursor = null;
		eyedropper.ColorChanged -= Eyedropper_ColorChanged;
		eyedropper.PreviewChanged -= Eyedropper_PreviewChanged;
		eyedropper.Stop();
	}

	private void Window_MouseDown(object sender, MouseButtonEventArgs e)
	{
		Cancelled = false;
		e.Handled = true;
		Close();
	}

	private void Window_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Invalid comparison between Unknown and I4
		if ((int)e.Key == 13)
		{
			Cancelled = true;
			Close();
		}
	}

	private void HookManager_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
	{
		UpdateWindowPosition();
	}

	private void HookManager_MouseWheel(object sender, System.Windows.Forms.MouseEventArgs e)
	{
		if (e.Delta > 0 && eyedropper.ZoomLevel < 20)
		{
			eyedropper.ZoomLevel++;
		}
		else if (e.Delta < 0 && eyedropper.ZoomLevel > 2)
		{
			eyedropper.ZoomLevel--;
		}
	}

	private void Eyedropper_ColorChanged(object sender, System.Drawing.Color e)
	{
		SelectedColor = System.Windows.Media.Color.FromArgb(e.A, e.R, e.G, e.B);
		((DispatcherObject)this).Dispatcher.BeginInvoke((Delegate)(Action)delegate
		{
			RingColor.Stroke = new SolidColorBrush(SelectedColor);
		}, Array.Empty<object>());
	}

	private void Eyedropper_PreviewChanged(object sender, Bitmap e)
	{
		((DispatcherObject)this).Dispatcher.BeginInvoke((Delegate)(Action)delegate
		{
			ImgPreview.Source = e.ToImageSource(ImageFormat.Png);
		}, Array.Empty<object>());
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "9.0.0.0")]
	public void InitializeComponent()
	{
		if (!_contentLoaded)
		{
			_contentLoaded = true;
			Uri resourceLocator = new Uri("/ChyronHego.Framework.Application.UI;component/userinterface/controls/eyedropperwindow.xaml", UriKind.Relative);
			System.Windows.Application.LoadComponent(this, resourceLocator);
		}
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "9.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	void IComponentConnector.Connect(int connectionId, object target)
	{
		switch (connectionId)
		{
		case 1:
			((EyedropperWindow)target).MouseDown += Window_MouseDown;
			((EyedropperWindow)target).KeyDown += Window_KeyDown;
			break;
		case 2:
			ImgPreview = (System.Windows.Controls.Image)target;
			break;
		case 3:
			RingColor = (Ellipse)target;
			break;
		default:
			_contentLoaded = true;
			break;
		}
	}
}
