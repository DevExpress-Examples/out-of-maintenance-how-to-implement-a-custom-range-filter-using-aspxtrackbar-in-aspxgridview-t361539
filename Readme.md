<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128540742/15.2.7%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T361539)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# How to implement a custom range filter using ASPxTrackBar in ASPxGridView
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t361539/)**
<!-- run online end -->


<p>To create a custom range filter with the <strong>ASPxTrackBar,</strong> follow these steps:<br>1) Put <strong>ASPxTrackBar</strong> inside the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebGridViewColumn_FilterTemplatetopic">GridViewColumn.FilterTemplate</a>. <br>2) Create a <a href="https://documentation.devexpress.com/#AspNet/clsDevExpressWebGridViewCommandColumntopic">GridViewCommandColumn</a> with two custom buttons to apply and clear filter conditions. <br>3) Handle the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_CustomButtonClicktopic">ASPxClientGridView.CustomButtonClick</a> event. In the event handler, set the filter expression. <br>4) Handle the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridView_CustomButtonInitializetopic">ASPxGridView.CustomButtonInitialize</a> event to show and hide the <strong>ClearFilter</strong> button.<br>5) Handle the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridView_AutoFilterCellEditorInitializetopic">ASPxGridView.AutoFilterCellEditorInitialize</a> event to prevent filtering after the "Enter" key is pressed in filter editors.<br>6) Use the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditBase_JSPropertiestopic">ASPxTrackBar.JSProperties</a> property to get the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxTrackBar_MinValuetopic">Min</a> and <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxTrackBar_MaxValuetopic">Max</a> values on the client side. <br>7) Set the start and end positions of the track bar using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientTrackBar_SetPositionStarttopic">ASPxClientTrackBar.SetPositionStart</a> and <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientTrackBar_SetPositionEndtopic">ASPxClientTrackBar.SetPositionEnd</a> methods when the <strong>ClearFilter</strong> button is clicked.</p>

<br/>


