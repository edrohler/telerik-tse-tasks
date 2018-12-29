<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server">
        <StyleSheets>
            <telerik:StyleSheetReference Path="~/Styles/main.css" />
        </StyleSheets>
    </telerik:RadStyleSheetManager>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function onPopUpShowing(sender, args) {
                args.get_popUp().className += " popUpEditForm";
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ConfiguratorPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
    <div id="demo">
        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" AllowPaging="True" ShowFooter="True"
            AllowSorting="True" AutoGenerateColumns="False" ShowStatusBar="True" 
            OnPreRender="RadGrid1_PreRender" OnNeedDataSource="RadGrid1_NeedDataSource" OnUpdateCommand="RadGrid1_UpdateCommand"
            OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand">
            <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="EmployeeID" EditMode="PopUp" EditFormSettings-PopUpSettings-KeepInScreenBounds="true">
                <Columns>
                    <telerik:GridButtonColumn UniqueName="DeleteColumn" Text="Delete" CommandName="Delete">
                    </telerik:GridButtonColumn>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn UniqueName="TitleOfCourtesy" HeaderText="TOC" DataField="TitleOfCourtesy">
                        <HeaderStyle Width="60px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FirstName" HeaderText="First Name" DataField="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LastName" HeaderText="Last Name" DataField="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="HireDate" HeaderText="Hire Date" DataField="HireDate"
                        DataFormatString="{0:d}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Title" HeaderText="Title" DataField="Title">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings UserControlName="EmployeeDetail.ascx" EditFormType="WebUserControl">
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>

<PopUpSettings KeepInScreenBounds="True"></PopUpSettings>
                </EditFormSettings>
            </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <ClientSettings>
                <ClientEvents OnRowDblClick="RowDblClick" OnPopUpShowing="onPopUpShowing" />
            </ClientSettings>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
