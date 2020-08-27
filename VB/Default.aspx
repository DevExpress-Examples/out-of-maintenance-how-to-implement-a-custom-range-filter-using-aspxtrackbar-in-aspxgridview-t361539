<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to make custom range filter using the ASPxTrackBar</title>
    <script type="text/javascript">
        function OnCustomButtonClick(s, e) {
            if (e.buttonID == 'ApplyFilter')
                ApplyFilter();
            if (e.buttonID == 'ClearFilter')
                ClearFilter();
        }
        function ClearFilter() {
            trackBar.SetPositionStart(trackBar.cpMinValue);
            trackBar.SetPositionEnd(trackBar.cpMaxValue);
            grid.ClearFilter();
        }
        function ApplyFilter() {
            var filterExpression = '';
            var andOperator = '';

            for (var i = 0; i < grid.GetColumnsCount() ; i++) {
                if (grid.GetColumn(i).fieldName == null)
                    continue;

                if (filterExpression != '')
                    andOperator = ' And ';

                if (grid.GetColumn(i).fieldName == "UnitsInStock") {
                    filterExpression += andOperator + '([UnitsInStock] >= ' + trackBar.GetPositionStart() + ') And ([UnitsInStock] <= ' + trackBar.GetPositionEnd() + ")";
                    continue;
                }

                var filterValue = grid.GetAutoFilterEditor(i).GetValue();
                if (filterValue != null)
                    filterExpression += andOperator + "Contains([" + grid.GetColumn(i).fieldName + "]," + "'" + filterValue + "')";
            }
            grid.ApplyFilter(filterExpression);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                DataSourceID="ads" KeyFieldName="EmployeeID" OnAutoFilterCellEditorInitialize="grid_AutoFilterCellEditorInitialize"
                OnCustomButtonInitialize="grid_CustomButtonInitialize" Width="1400">
                <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton Visibility="FilterRow" ID="ApplyFilter" Text="Apply">
                            </dx:GridViewCommandColumnCustomButton>
                            <dx:GridViewCommandColumnCustomButton Visibility="FilterRow" ID="ClearFilter" Text="Clear">
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="UnitsInStock" VisibleIndex="4">
                        <FilterTemplate>
                            <dx:ASPxTrackBar runat="server" ID="trackBar1" MinValue="0" MaxValue="130" Step="1" LargeTickInterval="10" SmallTickFrequency="1" Width="330"
                                AllowRangeSelection="true" PositionStart="0" PositionEnd="130" ScalePosition="LeftOrTop" ClientInstanceName="trackBar" OnCustomJSProperties="trackBar1_CustomJSProperties">
                            </dx:ASPxTrackBar>
                        </FilterTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
                <SettingsBehavior FilterRowMode="OnClick" />
                <Settings ShowFilterRow="True" />
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM Products">
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>