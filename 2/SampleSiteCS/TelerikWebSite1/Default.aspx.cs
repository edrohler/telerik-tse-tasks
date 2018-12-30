using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadGrid1_PreRender(object sender, System.EventArgs e)
    {
        if (!IsPostBack && RadGrid1.MasterTableView.Items.Count > 1)
        {
            RadGrid1.MasterTableView.Items[1].Edit = true;
            RadGrid1.MasterTableView.Rebind();
        }
    }

    private static DataTable GetDataTable(string queryString)
    {
        string ConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection MySqlConnection = new SqlConnection(ConnString);
        SqlDataAdapter MySqlDataAdapter = new SqlDataAdapter
        {
            SelectCommand = new SqlCommand(queryString, MySqlConnection)
        };

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
            object obj = Session["Employees"];
            if ((!(obj == null)))
            {
                return ((DataTable)(obj));
            }
            DataTable myDataTable = new DataTable();
            myDataTable = GetDataTable("SELECT * FROM Employees");
            Session["Employees"] = myDataTable;
            return myDataTable;
        }
    }

    protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = Employees;
        Employees.PrimaryKey = new DataColumn[] { Employees.Columns["EmployeeID"] };
    }

    protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
    {
        GridEditableItem editedItem = e.Item as GridEditableItem;
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        //Prepare new row to add it in the DataSource
        DataRow[] changedRows = Employees.Select("EmployeeID = " + editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["EmployeeID"]);

        if (changedRows.Length != 1)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to locate the Employee for updating."));
            e.Canceled = true;
            return;
        }

        //Update new values
        Hashtable newValues = new Hashtable();

        newValues["Country"] = (userControl.FindControl("CountryTextBox") as RadTextBox).Text;
        newValues["City"] = (userControl.FindControl("CityTextBox") as RadTextBox).Text;
        newValues["Region"] = (userControl.FindControl("RegionTextBox") as RadTextBox).Text;
        newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["TitleOfCourtesy"] = (userControl.FindControl("TOCDropDownList") as RadDropDownList).SelectedItem.Text;

        newValues["Notes"] = (userControl.FindControl("NotesTextBox") as RadTextBox).Text;
        newValues["Address"] = (userControl.FindControl("AddressTextBox") as RadTextBox).Text;
        newValues["FirstName"] = (userControl.FindControl("FirstNameTextBox") as RadTextBox).Text;
        newValues["LastName"] = (userControl.FindControl("LastNameTextBox") as RadTextBox).Text;
        newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["Title"] = (userControl.FindControl("TitleTextBox") as RadTextBox).Text;

        changedRows[0].BeginEdit();
        try
        {
            foreach (DictionaryEntry entry in newValues)
            {
                changedRows[0][(string)entry.Key] = entry.Value;
            }
            changedRows[0].EndEdit();
            Employees.AcceptChanges();
        }
        catch (Exception ex)
        {
            changedRows[0].CancelEdit();

            Label lblError = new Label
            {
                Text = "Unable to update Employees. Reason: " + ex.Message,
                ForeColor = System.Drawing.Color.Red
            };
            RadGrid1.Controls.Add(lblError);

            e.Canceled = true;
        }
    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        //Create new row in the DataSource
        DataRow newRow = Employees.NewRow();

        //Insert new values
        Hashtable newValues = new Hashtable();

        newValues["Country"] = (userControl.FindControl("CountryTextBox") as RadTextBox).Text;
        newValues["City"] = (userControl.FindControl("CityTextBox") as RadTextBox).Text;
        newValues["Region"] = (userControl.FindControl("RegionTextBox") as RadTextBox).Text;
        newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["TitleOfCourtesy"] = (userControl.FindControl("TOCDropDownList") as RadDropDownList).SelectedItem.Text;

        newValues["Notes"] = (userControl.FindControl("NotesTextBox") as RadTextBox).Text;
        newValues["Address"] = (userControl.FindControl("AddressTextBox") as RadTextBox).Text;
        newValues["FirstName"] = (userControl.FindControl("FirstNameTextBox") as RadTextBox).Text;
        newValues["LastName"] = (userControl.FindControl("LastNameTextBox") as RadTextBox).Text;
        newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        newValues["Title"] = (userControl.FindControl("TitleTextBox") as RadTextBox).Text;

        //make sure that unique primary key value is generated for the inserted row 
        newValues["EmployeeID"] = (int)Employees.Rows[Employees.Rows.Count - 1]["EmployeeID"] + 1;
        try
        {
            foreach (DictionaryEntry entry in newValues)
            {
                newRow[(string)entry.Key] = entry.Value;
            }
            Employees.Rows.Add(newRow);
            Employees.AcceptChanges();
        }
        catch (Exception ex)
        {
            Label lblError = new Label
            {
                Text = "Unable to insert Employees. Reason: " + ex.Message,
                ForeColor = System.Drawing.Color.Red
            };
            RadGrid1.Controls.Add(lblError);

            e.Canceled = true;
        }
    }
    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {
        string ID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"].ToString();
        DataTable employeeTable = Employees;
        if (employeeTable.Rows.Find(ID) != null)
        {
            employeeTable.Rows.Find(ID).Delete();
            employeeTable.AcceptChanges();
        }
    }

    protected void RadGrid1_FilterCheckListItemsRequested(object sender, GridFilterCheckListItemsRequestedEventArgs e)
    {
        string DataField = (e.Column as IGridDataColumn).GetActiveDataField();
        string query = string.Format("SELECT DISTINCT {0} FROM Employees", DataField);
        e.ListBox.DataSource = GetDataTable(query);
        e.ListBox.DataKeyField = DataField;
        e.ListBox.DataTextField = DataField;
        e.ListBox.DataValueField = DataField;
        e.ListBox.DataBind();
    }
}
