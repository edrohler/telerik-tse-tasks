# Task 2
[Source Document](./TSE-Task2.docx)
- Started 12/28/2019

- Params:
    * PupUp Mode as Default editor mode
    * Move DeleteColumn as first index
    * Enable Filtering on First and Last Name columns
    * Use only Telerik Controls in EmployeeDetail Control
    * Export HTML output to DOCX

## Notes

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
        - Followed [upgrade mdf files](https://docs.microsoft.com/en-us/visualstudio/data-tools/upgrade-dot-mdf-files?view=vs-2017) tutorial.
    2. Open Default.aspx in Design View in Visual Studio
    3. Select RadGrid and Click the Configuration Button
    4. Choose Data Source
        - This was not used as it would eventually use the DataTable binding in the code behind. But needed to create the initial data source
6. Bind Grid to DataTable 
    - Reviewed [tutorial](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-binding/understanding-data-binding/server-side-binding/various-data-sources/binding-to-datatable-or-dataset) for reference
    - This wasn't actually needed can just use the exisiting code but is good to have for reference.
7. Add a MasterPage 
    - This wasn't needed. Only used to organize the large demo project. We can isolate the Demo Default.aspx/cs pages and use it as the master page by combining the DOCTYPE, html, Head and Body tags from teh MastPage.master file in the live demos folder.
    1. Copy items from master page to sample default.aspx:
        1. DOCTYPE
        2. Head tag
            1. Title tag
            2. Favicon tag
            4. Meta tag
        3. Body tag
8. Copy Code from demo DefaultCS.aspx to sample Default.aspx
    1.  RadScriptManager tag
    2.  RadStyleSheetManager tag
    3.  RadCodeBlock tag with inline JS scripts
    4.  RadAjaxManager tag
        1. Remove configurator panel because defaulting to popup form edit mode
    5. RadAjaxLoadingPanel tag
    6. RadFormDecortator tag
    7. Add appsettings key/value pairs for script and stylesheet managers
    8. Copy radgrid control markup
    9. Copy radgrid code behind
        1. Remove the method refernce to the radio button in the Page_Load
        2. Remove the RadioButtonList1_SelectedIndexChanged method
9. Add EmployeeDetail Web User control file in VS
    1. EmployeeDetail.ascx
    2. EmployeeDetail.ascs.cs
    - Ensure reference to EmployeeDetail in Default.aspx is correct
10. Copy the EmployeeDetailsCS.ascx and code behind to new EmployeeDetail web user control file
* NOTE: At this point, I was able to isolate the demo into a separate project where it was functional and could run without error. However, this included some additional steps not found in the live demo.
    - I needed to add the datasource and update the northwind db to meet my environment req's
    - I deleted the initial grid that I created when adding the datasource.
        - Essentially, I had to try something and then back it out which makes version control so awesome. :)    
    - I reviewed the demo code and compared it to the new project created and merged everything that was needed.
    - I added a global.asax file and edited the web.config file.
        - I ran into an error when referencing the stylesheet folders after copying the code over
        - I researched on StackOverflow for the answer to this quick issues.
            -   IIS 403.14 error [reference](https://stackoverflow.com/questions/7880852/http-error-403-14-forbidden-error-when-accessing-website)
            -   Reviewed live demo web config and matched the add key node in the appsetting of the web.config
* Now I can research the requirements for the customer and implement them so that they are able to make a purchasing decision.
12. Set edit mode to default to popup
    - Seems to just be a setting in the markup [here](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/edit-mode/popup-edit-form)
13. Configure Filtering on FirstName and LastName Columns
    - Can set this for all columns pretty easily but appears only needs to be done on FN and LN columns
    - I feel like since the data is string based it would be better to have filtering by letter of the alphabet
        - I could use a static list of A, B, C, D, E, etc.
    - [Possible Sample](https://demos.telerik.com/aspnet-ajax/grid/examples/functionality/filtering/filter-templates/defaultcs.aspx) to follow
    - I think I would have asked for more information here to understand their req's but I will just try to implement the excel like filtering since it is text and the filtering on names seems very excel like. Although, the filtering by letter would be an interesting exercise.
    - Followed the [excel-like sample](https://demos.telerik.com/aspnet-ajax/grid/examples/functionality/filtering/excel-like-filtering/defaultcs.aspx)
        1. In Default.aspx
            1. Add AllowFilteringByColumn=true to RadGrid1
            2. Add FilterType=checklist to RadGrid1
            3. Add OnFilterListItemsRequested=RadGrid1_FilterCheckListItemsRequested to RadGrid1
            4. Add AllowFiltering=false to All Columns except FirstName and LastName
            5. Add AutoPostbackOnFilter=true and CurrentFilterFunction=EqualTo for FirstName and LastName Columns
        2. In Default.aspx.cs
            1. Implemented RadGrid1_FilterCheckListItemsRequested function with filter sql query
14. Change all ASP controls to Telerik controls in Employee Detail user control file.
    - Just drag Telerik controls from the vs toolbox and copied code from original asp controls.
    1. Changed All of the Controls
        1. ASP:TextBox -> Telerik:RadTextBox
        2. ASP:DropDownList -> Telerik:RadDropDownList
            - Had a bug with this one. Once I changed it. It seems the inserts and updates aren't appearing in the radgrid after clicking the button. Which is weird. 
            - The TOC changes weren't appearing because the datatable was updating based on value of the array and not the text value.
                - I changed this to read the text instead of value and worked fine
        3. ASP:Button -> Telerik:RadButton
    - After testing these changes I noticed nothing has propagated to the database. Which may or may not be expected. Not sure. I think this is because of the db refresh in the demo's. Where they are not actually saving to the database just editing the datatable and reading from thea actual database at refresh intervals.
    2. Had to change the refernce in the Default.aspx.cs code to match the new Telerik Controls.
        - There might be a better way to refactor this so that there are less hard-coded references to the controls.
    3. I also refactored some of the other code using vs productivity tools like, usings and simplifying instantiations.
15. Add Export to html to DOCX
    - Reviewed [reference Doc](https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/functionality/exporting/overview.html)
    - Reviewed [sample code](https://demos.telerik.com/aspnet-ajax/grid/examples/functionality/exporting/export-word-csv/defaultcs.aspx)
    - Was all declarative which is nice.
    1. Add CommandItemSettings tag in RadGrid
        1. Set ShowExportToWord=true
    2. Add ExportSettings in RadGrid
        1. HideStructureColumns=true
        2. ExportOnlyData=true
    - Would follow up with more information on this to see exactly where the customer was experiencing issues 
        - Could be formatting or filenaming. Not sure. Seemed easier than expected.
* At this point, I have all of the requirements for the customer and can draft reply.

* After doing these exercises, it would be really awesome to blog and stream (twitch/youtube) about tips and tricks for using Telerik tools. This may help with marketing too.

* Ran into an issue where the zipped folder was too large to email. Not sure if this would be an issue but have shared a GitHub repository to download and can be easily

## Reply

---

Dear John, 

Thank you for contacting Telerik Support Services. My goal is ensure that your request is resolved in an accurate and effecient manner. After reviewing the request, I understand that you have a use case for our RadGrid with specific requirment's derived from the demo located [here](https://demos.telerik.com/aspnet-ajax/grid/examples/data-editing/edit-form-types/defaultcs.aspx).

Per your request, the attached zip file contains a Visual Studio solution using our RadGrid and has the following features:

1. The edit mode is defaulted to PopUp.
2. The first column is the Delete Column.
3. The filtering functionality is enabled on the first and last name.
4. All ASP WebForm controls have been replaced with Telerik's controls.
5. The export to Word functionality is implemented on the RadGrid.

- A couple of notes:
    1. The solution is VS 2017 Community edition which is free and can be found [here](https://visualstudio.microsoft.com/vs/community/). Furthermore, VS 2017 can be ran side-by-side with other versions.
    2. Please ensure that you have the latest ASP.NET AJAX UI tools installed from the Progress Control Panel. In addition, please also ensure that the live demos are installed.

- In order to get the project to run. You have a few options.
    1. Clone the [GitHub Repository](https://github.com/edrohler/telerik-tse-tasks/tree/master/2/SampleSiteCS).
    2. Create a new Blank Telerik Website Project in VS and copy the code over
    3. Extract the zip and copy the Telerik Binaries from the live demos folder located at ```C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX R3 2018\Live Demos\Bin```.

Additionally, thank you for the feedback on the demo description being difficult to follow. Your feedback is important to us and as a result, we have begun the process of updating the documentation. Please continue to let us know how we are doing by using our forums, contact forms or other means of communication.

Lastly, I hope that I have provided you with all of the necessary information to make your decision and look forward to supporting you as a Telerik customer.

Thank you again for contacting Telerik Support Services. Please let me know if you have any additional questions and if you request has been resolved. 


Sincerely, 

Eric D. Rohler |
Technical Support Engineer |
Telerik a Progress Company |
Modern UI Made Easy |
[Telerik](https://www.telerik.com)

[Attachment](./SampleSiteCS.zip)