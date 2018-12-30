<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeDetail.ascx.cs" Inherits="EmployeeDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
    style="border-collapse: collapse;">
    <tr class="EditFormHeader">
        <td colspan="2">
            <b>Employee Details</b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table3" width="450px" border="0" class="module">
                <tr>
                    <td class="title" style="font-weight: bold;" colspan="2">Company Info:</td>
                </tr>
                <tr>
                    <td>Country:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="CountryTextBox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Country") %>' TabIndex="1"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>City:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="CityTextBox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.City") %>' TabIndex="2"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Region:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RegionTextBox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Region") %>' TabIndex="3"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <b>Personal Info:</b>
                    </td>
                </tr>
                <tr>
                    <td>Title Of Courtesy
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="TOCDropDownList" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.TitleOfCourtesy") %>'
                            DataSource='<%# (new string[] { "Dr.", "Mr.", "Mrs.", "Ms." }) %>'
                            AppendDataBoundItems="True"
                            TabIndex="4"
                            DefaultMessage="Select..">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td>First Name:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="FirstNameTextBox" Text='<%# Bind( "FirstName") %>' runat="server" TabIndex="5"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="LastNameTextBox" Text='<%# Bind( "LastName") %>' runat="server" TabIndex="6"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Birth Date:
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="BirthDatePicker" runat="server" MinDate="1/1/1900" DbSelectedDate='<%# DataBinder.Eval(Container, "DataItem.BirthDate") %>'
                            TabIndex="7">
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>Hire Date:
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="HireDatePicker" DbSelectedDate='<%# DataBinder.Eval(Container, "DataItem.HireDate") %>'
                            runat="server" TabIndex="8">
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>Title:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="TitleTextBox" Text='<%# DataBinder.Eval(Container, "DataItem.Title") %>' runat="server" TabIndex="9"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Home Phone:
                    </td>
                    <td>
                        <telerik:RadMaskedTextBox ID="HomePhoneBox" runat="server" SelectionOnFocus="SelectAll"
                            Text='<%# DataBinder.Eval(Container, "DataItem.HomePhone") %>' PromptChar="_" Mask="(###) ###-####"
                            TabIndex="10">
                        </telerik:RadMaskedTextBox>
                    </td>
                </tr>
            </table>
        </td>
        <td style="vertical-align: top">
            <table id="Table1" cellspacing="1" cellpadding="1" width="250" border="0" class="module">
                <tr>
                    <td>Notes:
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadTextBox ID="NotesTextBox" Text='<%# DataBinder.Eval(Container, "DataItem.Notes") %>' runat="server" TextMode="MultiLine"
                            Rows="5" Columns="40" TabIndex="11">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address:
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadTextBox ID="AddressTextBox" Text='<%# DataBinder.Eval(Container, "DataItem.Address") %>' runat="server" TextMode="MultiLine"
                            Rows="2" Columns="40" TabIndex="12">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <telerik:RadButton ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
            </telerik:RadButton>
            &nbsp;
            <telerik:RadButton ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                CommandName="Cancel">
            </telerik:RadButton>
        </td>
    </tr>
</table>
