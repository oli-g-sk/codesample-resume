using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Markup;
using System.Windows.Media;

namespace ChyronHego.Framework.Application.UI.UserInterface.Controls;

public class EyedropperButton : UserControl, IComponentConnector
{
	public static readonly DependencyProperty SelectedColorProperty = DependencyProperty.Register("SelectedColor", typeof(Color), typeof(EyedropperButton), (PropertyMetadata)(object)new FrameworkPropertyMetadata
	{
		BindsTwoWayByDefault = true,
		DefaultUpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged
	});

	private bool _contentLoaded;

	public Color SelectedColor
	{
		get
		{
			return (Color)((DependencyObject)this).GetValue(SelectedColorProperty);
		}
		set
		{
			((DependencyObject)this).SetValue(SelectedColorProperty, (object)value);
		}
	}

	public EyedropperButton()
	{
		InitializeComponent();
	}

	private void Button_OnClick(object sender, RoutedEventArgs e)
	{
		EyedropperWindow eyedropperWindow = new EyedropperWindow();
		eyedropperWindow.Closed += EyedropperWindow_Closed;
		eyedropperWindow.Show();
	}

	private void EyedropperWindow_Closed(object sender, EventArgs e)
	{
		EyedropperWindow eyedropperWindow = sender as EyedropperWindow;
		eyedropperWindow.Closed -= EyedropperWindow_Closed;
		if (!eyedropperWindow.Cancelled)
		{
			SelectedColor = eyedropperWindow.SelectedColor;
		}
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "9.0.0.0")]
	public void InitializeComponent()
	{
		if (!_contentLoaded)
		{
			_contentLoaded = true;
			Uri resourceLocator = new Uri("/ChyronHego.Framework.Application.UI;component/userinterface/controls/eyedropperbutton.xaml", UriKind.Relative);
			System.Windows.Application.LoadComponent(this, resourceLocator);
		}
	}

	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "9.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	void IComponentConnector.Connect(int connectionId, object target)
	{
		if (connectionId == 1)
		{
			((Button)target).Click += Button_OnClick;
		}
		else
		{
			_contentLoaded = true;
		}
	}
}
