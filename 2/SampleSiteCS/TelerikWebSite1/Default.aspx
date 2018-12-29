<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
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
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" PageSize="30" Skin="Metro" Width="720px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridEditCommandColumn>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridClientDeleteColumn FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridClientDeleteColumn>
                    <telerik:GridBoundColumn DataField="TitleOfCourtesy" FilterControlAltText="Filter TitleOfCourtesy column" HeaderText="TOC" SortExpression="TitleOfCourtesy" UniqueName="TitleOfCourtesy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HireDate" DataType="System.DateTime" FilterControlAltText="Filter HireDate column" HeaderText="HireDate" SortExpression="HireDate" UniqueName="HireDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
