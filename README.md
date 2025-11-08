# Creditworthiness-Analysis

## Table of Contents
- [Executive Summary](#Executive-Summary)
- [Key Creditworthiness Indicators](#Key-Creditworthiness-Indicators)
- [Defining and Determining Creditworthiness](#Defining-Creditworthiness)
- [Results](#Results)
- [Linear Regression](#Linear-Regression)
- [Applicability and Limitations](#Applicability-and-Limitations)
  
## Executive Summary
Determining whether a business is credit-worthy is dependent on the character, capacity, capital, collateral, and conditions. To quantify these constituents and test their ability to satisfy set conditions, an in-depth look into financial statements containing the operational history of the business, financial practices, its ability to pay back loans, and external economic factors is necessary. Using simulated data, this project used Google Sheets, Python, and SQL to obtain useful metrics to ascertain the creditworthiness of multiple companies. The analysis highlights the applicability and limitations of this method of credit analysis.

## Key Creditworthiness Indicators
The following metrics were used to assess the financial stability of the simulated companies:

| Metric | Purpose |
|---|---|
| Loan Pricing Sensitivity | Measures the perceived borrower risk relative to other borrowers |
| Collateral Coverage Ratio | Evaluates the security level available to lenders |
| TLR (Total Debt to EBITDA)| Indicates the leverage and the borrower's ability to repay the debt from the earnings |
| SLDR (Senior Debt to EBITDA)| Evaluates the burden of priority debt relative to operating performance |
| EBIT Coverage Ratio | Examines how easily operating income covers interest payments |
| EBITDA Coverage Ratio | Measures the businesses' cash-based capacity to meet interest payments  |
| CAPEX Adjusted Coverage Ratio | Assesses the ability to service debt after accounting for reinvestment needs |
| AR | Measures the length of time it takes to collect money from customers |
| AP | Measures how long it takes for the company to pay back its suppliers |
| Inventory Days | Displays the average amount of days inventory is held before being sold |
| CCC (Cash Conversion Cycle) | Encapsulates the total efficiency of converting investments into cash flow |
| Debt to Equity | Shows financial leverage and long-term solvency |
| Operating Cash Flow Coverage | Determines the ability to service debt through generated cash |
| Profit Margin | Displays the profitability |
| Liquidity Ratio | Shows the ability to cover debts and short-term liquidity |
| Operating Cash Flow Standard Deviation  | Covers cash flow volatility |
| Loan Status | Shows whether a company has paid off a loan |
| Credit Score | A prediction of your credit behavior |



## Defining and Determining Creditworthiness
Although individually useful, the above metrics can only determine an individual's credit worthiness when assessed as components of a larger sum. The following conditions were used to assess the quality of each business:

| Metric | Condition | Condition | Condition | Condition | Condition |
|---|---|---|---|---|---|
| Collateral Coverage Ratio | <1 Bad | 1-2 Good | >2 Excellent | --- | --- |
| TLR | >5 Bad | 3-5 Moderate | <3 Good | --- | --- |
| SDLR | >4 Concerning | 3-4 Bad | 2-3 Good | <2 Excellent | --- |
| EBIT Coverage Ratio | <1 Bad | 1-2 Moderate | >2 Good | >3 Excellent | --- |
| EBITDA Coverage Ratio | <1.5 Bad | 1.5-3 Satisfactory | >3 Good | --- | --- |
| CAPEX Adjusted Coverage Ratio | <1 Bad | 1-1.24 Ok | 1.25-2 Good | >2 Excellent | --- |
| AP | 0-30 Good | >30 Bad | --- | --- | --- |
| AR | 0-60 Good | >60 Bad | --- | --- | --- |
| Inventory Days | 0-60 Good | >60 Bad | --- | --- | --- |
| CCC | 0-45 Good | >45 Bad | --- | --- | --- |
| Debt to Equity | >2 Bad | 1.0-1.5 Satisfactory | <1 Good | --- | --- |
| Operating Cash Flow Coverage | <1 Bad | 1-2 Good | >2 Excellent | --- | --- | 
| Profit Margin | <0.05 Bad | 0.1 Average | 0.1-0.2 Good | >0.2 Excellent | --- |
| Liquidity Ratio | 1.5-2.0 Good | Else Bad | --- | --- | --- |
| Credit Score | 300-579 Poor | 580 - 669 Fair | 670 - 739 Good | 740 - 799 Very Good | 800 - 850 Exceptional |

This system was used to create a grading scale, where each of the metrics was assigned a point value. The point value assigned to each category was based on the level of characterization possible; e.g. someone with an excellent CAPEX Adjusted Coverage Ratio was given a 4, and a firm with an average score was given 1 point.

The points were then added to give a total score and assessed as a ratio to the maximum number of points possible (31). In order to be defined as credit worthy, a minimum ratio of total score to the maximum possible score of 0.79 was required (this number is the same number used as the minimum value of credit score still determined to be good out of the maximum possible value).

## Results
A total of 37.53% of businesses measured were found to be credit-worthy. In this study, the collateral coverage ratio rating, the operating cash flow coverage rating, liquidity ratio rating, and the credit card rating all had more than 50% of individual cases where the rating was less than or equal to 50% of the maximum possible rating (96.22%,87.21%,99.64%, and 78.65%, respectively). The quantities in which the score achieved was greater than 50% of the maximum possible rating were the Senior Debt to EBITDA rating, AP rating, AR rating, inventory days rating, and the profit margin rating (0% for all).

| Metric | Percent Value |
|---|---|
| Collateral Coverage Ratio | 96.22 | 
| TLR | 2.52 | 
| SDLR | 0 |  
| EBIT Coverage Ratio | 11.80 |  
| EBITDA Coverage Ratio | 25.77 | 
| CAPEX Adjusted Coverage Ratio | 2.52 |   
| AP | 0 |  
| AR | 0 |  
| Inventory Days | 0|   
| CCC | 6.31 |   
| Debt to Equity | 17.30 |   
| Operating Cash Flow Coverage | 87.21 | 
| Profit Margin | 0 | 
| Liquidity Ratio | 99.64 |    
| Credit Score | 78.65 |  



## Linear Regression

## Applicability and Limitations
Overall, the presented process of assessing creditworthiness provides a convenient framework by which the characteristics of a business/client can be examined through an objective grading method. The strength of this analysis comes from the presentation and calculation of useful metrics and their orderly presentation for a csv file. The sum of the metrics provides a non-technical assessment of the creditworthiness of the business that is easily understandable and completely dependent on the current health of the business.

That being said, although the idea of a grading scale system is convenient, it relies on the idea that all of the metrics used carry an equivalent point weight and that all aspects relevant to a healthy business are taken into account. In the case of the former point, assigning the same point value to each metric is likely to skew the evaluation of a client/business to whatever metric holds the most weight. For instance, suppose a private clinic in California is having multiple issues regarding insurance claims disputes at a time when the SEIU Nurse Alliance of California successfully attains higher wages for nurses. If one were to assess the financial health of the hospital during this financial quarter, one may find that the value given to the Accounts Receivable is 0, the Operating Cash Flow Coverage to be 0, and the profit margin to be 1. If however the profit margin, EBIT, and Credit Score all present healthy or excellent conditions, then the weight of other metrics may not be felt. Thus, this system ignores the possiblity that the financial health of the private clinic could be deteriorating, and is only being covered by other positive measuring metrics. Although this example doesn't discount the fact that the grading system provides an objective method of determining creditworthiness, it shows that all of the mentioned qualities are intertwined in ways that are far more complex than can be assessed through a non-normalized point system. Likewise, as previously mentioned, this method doesn't provide a way of seeing the financial history of a business, which can provide useful insights as to whether or not a business is reliable, nor does it assess the quality of the character of the people running the business; such metrics could only be evaluted through a conversation with the individuals running the business.


The data that was used for this project contained missing information pertinent to the calculation of several variables; as such, the sample results provided displays multiple NULL values. For this example, whenever a NULL value is encountered, it is treated as 0. The metrics used to determine the creditworthiness were taken to be applied in the most general sense; in reality, some values and their indication of a business's health is sensitive to the industry it's a part of. This resulted in the exclusion of loan pricing sensitivity in the calculation of creditworthiness. When the data was simulated, the numbers produced were randomized, meaning that the value of a certain quantity is independent to other variables.


### References


