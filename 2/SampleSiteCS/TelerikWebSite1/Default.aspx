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
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="EmployeeID" DataType="System.Int32" FilterControlAltText="Filter EmployeeID column" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" UniqueName="EmployeeID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TitleOfCourtesy" FilterControlAltText="Filter TitleOfCourtesy column" HeaderText="TitleOfCourtesy" SortExpression="TitleOfCourtesy" UniqueName="TitleOfCourtesy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BirthDate" DataType="System.DateTime" FilterControlAltText="Filter BirthDate column" HeaderText="BirthDate" SortExpression="BirthDate" UniqueName="BirthDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HireDate" DataType="System.DateTime" FilterControlAltText="Filter HireDate column" HeaderText="HireDate" SortExpression="HireDate" UniqueName="HireDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" SortExpression="City" UniqueName="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Region" FilterControlAltText="Filter Region column" HeaderText="Region" SortExpression="Region" UniqueName="Region">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PostalCode" FilterControlAltText="Filter PostalCode column" HeaderText="PostalCode" SortExpression="PostalCode" UniqueName="PostalCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Country" FilterControlAltText="Filter Country column" HeaderText="Country" SortExpression="Country" UniqueName="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HomePhone" FilterControlAltText="Filter HomePhone column" HeaderText="HomePhone" SortExpression="HomePhone" UniqueName="HomePhone">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Extension" FilterControlAltText="Filter Extension column" HeaderText="Extension" SortExpression="Extension" UniqueName="Extension">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Notes" FilterControlAltText="Filter Notes column" HeaderText="Notes" SortExpression="Notes" UniqueName="Notes">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReportsTo" DataType="System.Int32" FilterControlAltText="Filter ReportsTo column" HeaderText="ReportsTo" SortExpression="ReportsTo" UniqueName="ReportsTo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PhotoPath" FilterControlAltText="Filter PhotoPath column" HeaderText="PhotoPath" SortExpression="PhotoPath" UniqueName="PhotoPath">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
