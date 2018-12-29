# Task 2
[Source Document](./TSE-Task2.docx)

1. Install the demo's locally using Progress Control Panel
    1. Select item in control panel and click turn features on or off
    2. Select live demos checkbox
        * Ensure VS Version Support is selected
            - Will install the VS Extension
    3. Select Close
    4. A new popup will appear 
    5. Click Proceed
2. Live demos install folder at: ```C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX QX 20YY\Live Demos```
3. Open Visual Studio 
    - [Follow Getting Started](https://docs.telerik.com/devtools/aspnet-ajax/getting-started/first-steps)
    1. Create new Blank Solution
    2. Right-Click Solution -> Hover Add -> Select New Project
    3. In New Project Pop-Up, Select Telerik Node
    4. Select Web
    5. Select Telerik Web Forms VB/C# Project
    6. Select Ok
4. In Telerik Project Configuration Window
    1. Select Blank
    2. Select Ok
5. Add Database
    - [Follow RadGrid Getting Started](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/getting-started/getting-started-with-radgrid-for-asp.net-ajax)
    1. Copy Northwind db file to new project App_Data Folder
        - Source: ```C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX R3 2018\Live Demos\App_Data```
        - Destination: Your Project Folder App_Data folder
    2. Upgrade the Database file
        - [Follow Upgrade mdf files](https://docs.microsoft.com/en-us/visualstudio/data-tools/upgrade-dot-mdf-files?view=vs-2017)
    2. Open Default.aspx in Design View in Visual Studio
    3. Select RadGrid and Click the Configuration Button
    4. Choose Data Source
6. Bind Grid to DataTable [Follow Tutorial](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-binding/understanding-data-binding/server-side-binding/various-data-sources/binding-to-datatable-or-dataset)
    - This wasn't actually needed can just use the exisiting code but is good to have for reference.
7. Add a MasterPage 
    - This wasn't needed. Only used to organize the large demo project. We can isolate the Demo Default.aspx/cs pages and use it as the master page by combining the DOCTYPE, html, Head and Body tags from teh MastPage.master file in teh live demos folder.
    - Items to bring over:
        - DOCTYPE
        - Head tag
            - Title tag
            - Favicon tag
            - Meta tag
        - Body tag
8. Copy Code from demo DefaultCS.aspx to sample Default.aspx
    1.  RadScriptManager tag
    2.  RadStyleSheetManager tag
    3.  RadCodeBlock tag with inline JS scripts
    4.  RadAjaxManager tag
        - Remove configurator panel because defaulting to popup form edit mode
    5. RadAjaxLoadingPanel tag
    6. RadFormDecortator tag
    7. Add appsettings for script and stylesheet maangers
    8. Copy radgrid control markup
    9. Copy radgrid code behind
        - Remove the method refernce to the radio button in the Page_Load
        - Remove the RadioButtonList1_SelectedIndexChanged method
9. Add EmployeeDetail Web User control file in VS
    - EmployeeDetail.ascx
    - EmployeeDetail.ascs.cs
    - Ensure reference to EmployeeDetail in Default.aspx is correct
10. Copy the EmployeeDetailsCS.ascx and code behind to new file
11. Change All ASP controls to Telerik controls in Employee Detail Control
    - 
