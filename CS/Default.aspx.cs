using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
	protected void grid_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e) {
		if(e.ButtonID != "ClearFilter")
			return;

		e.Visible = string.IsNullOrEmpty(grid.FilterExpression)
			? DevExpress.Utils.DefaultBoolean.False : e.Visible = DevExpress.Utils.DefaultBoolean.Default;
	}
	protected void trackBar1_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e) {
		ASPxTrackBar bar = sender as ASPxTrackBar;
		e.Properties["cpMinValue"] = bar.MinValue;
		e.Properties["cpMaxValue"] = bar.MaxValue;
	}
	protected void grid_AutoFilterCellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
		if(e.Column.FieldName != "UnitsInStock")
			(e.Editor as ASPxTextBox).ClientSideEvents.KeyDown = @"function(s,e) {
				if (e.htmlEvent.keyCode == 13) 
					ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); 
				}";
	}
}