# Task 2
[Source Document](./TSE-Task2.docx)
- Started 12/28/2019

- Params:
    * PupUp Mode as Default editor mode
    * Move DeleteColumn as first index
    * Enable Filtering on First and Last Name columns
    * Use only Telerik Controls in EmployeeDetail Control
    * Export HTML output to DOCX

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
    - [Followed Getting Started](https://docs.telerik.com/devtools/aspnet-ajax/getting-started/first-steps)
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
    - [Followed RadGrid Getting Started](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/getting-started/getting-started-with-radgrid-for-asp.net-ajax)
    1. Copy Northwind db file to new project App_Data Folder
        - Source: ```C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX R3 2018\Live Demos\App_Data```
        - Destination: Your Project Folder App_Data folder
    2. Upgrade the Database file
        - [Followed Upgrade mdf files](https://docs.microsoft.com/en-us/visualstudio/data-tools/upgrade-dot-mdf-files?view=vs-2017)
    2. Open Default.aspx in Design View in Visual Studio
    3. Select RadGrid and Click the Configuration Button
    4. Choose Data Source
        - This was not used as it would eventually use the DataTable binding in the code behind.
6. Bind Grid to DataTable [Reviewed Tutorial for reference](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-binding/understanding-data-binding/server-side-binding/various-data-sources/binding-to-datatable-or-dataset)
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
* At this point, I was able to isolate the demo into a separate project where it was functional and could run without error. However, this included some additional steps not found in the live demo.
    - I needed to add the datasource and update the northwind db to meet my environment req's
    - I deleted the initial grid that I created when adding the datasource.
        - Essentially, I had to try something and then back it out which makes version control so awesome. :)    
    - I reviewed the demo code and compared it to the new project created and merged everything that was needed.
    - I added a global.asax file and edited the webconfig file.
        - I ran into an error when referencing the stylesheet folders after copying the code over
        - I researched on StackOverflow for the answer to this quick issues.
            -   ASP.NET WebForms 403.14 error [reference](https://stackoverflow.com/questions/7880852/http-error-403-14-forbidden-error-when-accessing-website)
            -   Reviewed live demo web config and matched the add key node in the appsetting of the web.config
* Now I can research the requirements for the customer and implement them so that they are able to make a purchasing decision.
11. Set edit mode to default to popup
    - https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/edit-mode/popup-edit-form
12. Configuring FIltering on FirstName and LastName Columns
    - 
11. Change all ASP controls to Telerik controls in Employee Detail user control file.
    - 
