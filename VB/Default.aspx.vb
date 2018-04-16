Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub grid_CustomButtonInitialize(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonEventArgs)
        If e.ButtonID <> "ClearFilter" Then
            Return
        End If

        If String.IsNullOrEmpty(grid.FilterExpression) Then
            e.Visible = DevExpress.Utils.DefaultBoolean.False
        Else
            e.Visible = DevExpress.Utils.DefaultBoolean.Default
        End If
    End Sub
    Protected Sub trackBar1_CustomJSProperties(ByVal sender As Object, ByVal e As CustomJSPropertiesEventArgs)
        Dim bar As ASPxTrackBar = TryCast(sender, ASPxTrackBar)
        e.Properties("cpMinValue") = bar.MinValue
        e.Properties("cpMaxValue") = bar.MaxValue
    End Sub
    Protected Sub grid_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As ASPxGridViewEditorEventArgs)
        If e.Column.FieldName <> "UnitsInStock" Then
            TryCast(e.Editor, ASPxTextBox).ClientSideEvents.KeyDown = "function(s,e) {" & ControlChars.CrLf & _
"				if (e.htmlEvent.keyCode == 13) " & ControlChars.CrLf & _
"					ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); " & ControlChars.CrLf & _
"				}"
        End If
    End Sub
End Class