using System;
using System.Web.UI;

public partial class EmployeeDetail : UserControl
{
    private object _dataItem = null;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public object DataItem
    {
        get
        {
            return _dataItem;
        }
        set
        {
            _dataItem = value;
        }
    }
}