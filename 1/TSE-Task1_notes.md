# Task 1
[Source Document](./TSE-Task1.docx)
- Started: 12/26/2018

- Params:
    * Needs sample report containing Inline CSV
    * No duplicates
    * Items with less than 7 letters. (Q: Does this include spaces, i.e char?)

## Notes

- I initially had an issue with getting the data to load correctly. I was able to import the list as an inline csv without any problems. However, after tinkering with the several item bindings I then realized that it would be similar to xaml bindings and found the data source binding for the report and could see the data and fields after I linked them up.

- Once I was able to bind the data source to the report, I could then use expressions for the text box however I ran into an issue where the textbox would repeat if it was placed in the detail section of the report. Once I moved the text box into the header it didn't repeat. I thought this might be expected behavior.

- I could not reproduce the problem exactly as I imagined from the description but was able to create the desired result with the solution expression v2 function below. I believe the issue was with the scope of the text box. I needed to scope up to the report data source using the built-in exec function on it in order to get it to concatenate the strings into a comma-separated string using an advanced function. Although, this initially created a line item in the detail for each item in the data source. However, once I moved this to the header it only appeared once. Which I believe was the intended result. My only final issue is the null value located after the second column which is probably because of my use of the empty ```""``` in functions from my excel experience. Below is my result.

- Repro'd Expression v1:
```=Join(',', AllDistinctValues(Fields.ProductName))```
    * This created a paginated report of each item in the inline csv which I didn't think was described in the problem.
- Repro'd Expression v2:
```=Exec('Task1_Report',Join(',', AllDistinctValues(Fields.ProductName)))```
    * This created a comma-separated value for each distinct item in the inline csv as I thought was described in the problem.
- Solution Expression v1:
```=Exec('Task1_Report',Join(',', AllDistinctValues(IIf(Len(Fields.ProductName) < 7, Fields.ProductName, ""), False)))```
    * This created a comma-separated value for each distinct item in the inline csv with a length less than 7 but had an empty value
- Solution Expression v2:
```=Exec('Task1_Report',Join(',', AllDistinctValues(IIf(Len(Fields.ProductName) < 7, Fields.ProductName, Null), False)))```
    * This created created a comma-separated value for each distinct item in the inline csv with a length less than 7 but didn't have an empty value and is the intended result given in the problem.

- I would have gathered a working file from the customer before moving forward with a solution on this. I would do this to ensure that I am repro'ing the exact problem. I am certain it is a scoping issue with the paging but given the problem parameters I am unsure I was able to fully resolve the scenario.

[Source Report](./Task1_Report.trdp)

### Side note: use Git for version control next time.

### _Reply_
---
Dear Valued Customer, 

Thank you for contacting Telerik Support Services. My goal is ensure that your request is resolved in an accurate and effecient manner. After reviewing the request, I can see that you would like to display a text box containing a comma-separated string of distinct values with less than 7 letters from an inline csv data source. What follows is my understanding of the issue and a potential solution. 

During my initial investigation, I found that the scope of the text box needed to be isolated in order to obtain a comma-separated value of the whole data source. Since the data is sourced at the report level, I needed to scope the text box up to the data source using the ```Exec``` Data Scope Function. This enabled me to execute the aggregate function over the whole data. Please see the below link on data scope for more information.

[Data Scope Functions](https://docs.telerik.com/reporting/expressions-data-functions)

After isolating the scope and from the data and aggregate function you initially provided I was able to reproduced the issue so that each value displayed within the textbox. I was able to further refine your solution by expanding the function using an ```IIf``` conditional so that only the data with with less than 7 letters is displayed. 

Please note, the aggregate function used initially defaulted to allowing for Null values. By setting the second parameter to false it will omit these. Furthermore, the conditional's false path returns Null and these values will be omitted as desired. Please see below links for more details on the functions.

[Aggregate Functions](https://docs.telerik.com/reporting/expressions-aggregate-functions)

[Conditional Functions](https://docs.telerik.com/reporting/expressions-evaluation-flow-functions)

The Telerik Reporting expressions can be nested each time an expression is noted in the documentation. For example, the Join, AllDistinctValues and IIf expressions all accept an expression parameter allowing for powerful computation. Please find attached the sample report and the below solution function.

Solution function: ```=Exec('Task1_Report',Join(',', AllDistinctValues(IIf(Len(Fields.ProductName) < 7, Fields.ProductName, Null), False)))```

Thank you again for contacting Telerik Support Services and please let me know if you need any additional information and if I was able to resolve your issue.



Sincerely, 

Eric D. Rohler |
Technical Support Engineer |
Telerik a Progress Company |
Modern UI Made Easy |
[Telerik](https://www.telerik.com)

[Attachment](./Task1_Report.trdp)