﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Collections;
using System.Data.SqlClient;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadGrid1_PreRender(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack && this.RadGrid1.MasterTableView.Items.Count > 1)
        {
            this.RadGrid1.MasterTableView.Items[1].Edit = true;
            this.RadGrid1.MasterTableView.Rebind();
        }
    }

    private static DataTable GetDataTable(string queryString)
    {
        String ConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection MySqlConnection = new SqlConnection(ConnString);
        SqlDataAdapter MySqlDataAdapter = new SqlDataAdapter();
        MySqlDataAdapter.SelectCommand = new SqlCommand(queryString, MySqlConnection);

        DataTable myDataTable = new DataTable();
        MySqlConnection.Open();
        try
        {
            MySqlDataAdapter.Fill(myDataTable);
        }
        finally
        {
            MySqlConnection.Close();
        }

        return myDataTable;
    }

    private DataTable Employees
    {
        get
        {
            object obj = this.Session["Employees"];
            if ((!(obj == null)))
            {
                return ((DataTable)(obj));
            }
            DataTable myDataTable = new DataTable();
            myDataTable = GetDataTable("SELECT * FROM Employees");
            this.Session["Employees"] = myDataTable;
            return myDataTable;
        }
    }

    protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
        this.RadGrid1.DataSource = this.Employees;
        this.Employees.PrimaryKey = new DataColumn[] { this.Employees.Columns["EmployeeID"] };
    }

    protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
    {
        GridEditableItem editedItem = e.Item as GridEditableItem;
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        //Prepare new row to add it in the DataSource
        DataRow[] changedRows = this.Employees.Select("EmployeeID = " + editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["EmployeeID"]);

        if (changedRows.Length != 1)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to locate the Employee for updating."));
            e.Canceled = true;
            return;
        }

        //Update new values
        Hashtable newValues = new Hashtable();

        newValues["Country"] = (userControl.FindControl("TextBox7") as TextBox).Text;
        newValues["City"] = (userControl.FindControl("TextBox8") as TextBox).Text;
        newValues["Region"] = (userControl.FindControl("TextBox9") as TextBox).Text;
        newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["TitleOfCourtesy"] = (userControl.FindControl("ddlTOC") as DropDownList).SelectedItem.Value;

        newValues["Notes"] = (userControl.FindControl("TextBox1") as TextBox).Text;
        newValues["Address"] = (userControl.FindControl("TextBox6") as TextBox).Text;
        newValues["FirstName"] = (userControl.FindControl("TextBox2") as TextBox).Text;
        newValues["LastName"] = (userControl.FindControl("TextBox3") as TextBox).Text;
        newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["Title"] = (userControl.FindControl("TextBox4") as TextBox).Text;

        changedRows[0].BeginEdit();
        try
        {
            foreach (DictionaryEntry entry in newValues)
            {
                changedRows[0][(string)entry.Key] = entry.Value;
            }
            changedRows[0].EndEdit();
            this.Employees.AcceptChanges();
        }
        catch (Exception ex)
        {
            changedRows[0].CancelEdit();

            Label lblError = new Label();
            lblError.Text = "Unable to update Employees. Reason: " + ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
            RadGrid1.Controls.Add(lblError);

            e.Canceled = true;
        }
    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        //Create new row in the DataSource
        DataRow newRow = this.Employees.NewRow();

        //Insert new values
        Hashtable newValues = new Hashtable();

        newValues["Country"] = (userControl.FindControl("TextBox7") as TextBox).Text;
        newValues["City"] = (userControl.FindControl("TextBox8") as TextBox).Text;
        newValues["Region"] = (userControl.FindControl("TextBox9") as TextBox).Text;
        newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["TitleOfCourtesy"] = (userControl.FindControl("ddlTOC") as DropDownList).SelectedItem.Value;

        newValues["Notes"] = (userControl.FindControl("TextBox1") as TextBox).Text;
        newValues["Address"] = (userControl.FindControl("TextBox6") as TextBox).Text;
        newValues["FirstName"] = (userControl.FindControl("TextBox2") as TextBox).Text;
        newValues["LastName"] = (userControl.FindControl("TextBox3") as TextBox).Text;
        newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["Title"] = (userControl.FindControl("TextBox4") as TextBox).Text;

        //make sure that unique primary key value is generated for the inserted row 
        newValues["EmployeeID"] = (int)this.Employees.Rows[this.Employees.Rows.Count - 1]["EmployeeID"] + 1;
        try
        {
            foreach (DictionaryEntry entry in newValues)
            {
                newRow[(string)entry.Key] = entry.Value;
            }
            this.Employees.Rows.Add(newRow);
            this.Employees.AcceptChanges();
        }
        catch (Exception ex)
        {
            Label lblError = new Label();
            lblError.Text = "Unable to insert Employees. Reason: " + ex.Message;
            lblError.ForeColor = System.Drawing.Color.Red;
            RadGrid1.Controls.Add(lblError);

            e.Canceled = true;
        }
    }
    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {
        string ID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"].ToString();
        DataTable employeeTable = this.Employees;
        if (employeeTable.Rows.Find(ID) != null)
        {
            employeeTable.Rows.Find(ID).Delete();
            employeeTable.AcceptChanges();
        }
    }
}
