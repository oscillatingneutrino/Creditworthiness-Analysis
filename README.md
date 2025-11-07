# Creditworthiness-Analysis

## Table of Contents
- [Executive Summary](#Executive-Summary)
- [Key Creditworthiness Indicators](#Key-Creditworthiness-Indicators)
- [Defining and Determining Creditworthiness](#Defining-Creditworthiness)
- [Clarifications](#Clarifications)
  
## Executive Summary
Determining whether business is credit-worthy is dependent on the character, capacity, capital, collateral, and conditions. To quantify these constituents and test their ability to satisfy set conditions requires an in-depth look into financial statements containing the operational history of the business, financial practices, its ability to pay back loans, and external economic factors. Using simulated data with missing values, this project used Excel, Python, and SQL to obtain useful metrics such as total debt to EBITDA, Interest Coverage Ratio, and Operating Cash Flow Coverage to ascertain the creditworthiness of a company. Furthermore, the simulated data was used to forecast the credit of a company to determine its financial stability.

## Key Creditworthiness Indicators
The following metrics were used to assess the financial stability of the simulated companies:

| Metric | Purpose |
|---|---|
| Loan Pricing Sensitivity | Measures the perceived borrower risk relative to other borrowers |
| Collateral Coverage Ratio | Evaluates the security level available to lenders |
| TLR (Total Debt to EBITDA)| Indicates the leverage and the borrower's ability to repay the dept from the earnings |
| SLDR (Senior Debt to EBITDA)| Evalutes the burden of priority debt relative to operating performance |
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
Although individually useful, the above metrics can only determine an individual's credit worthiness when assessed as components of a larger sum. Doing justice to each of these metrics, the following conditions were used to assess the quality of each business:

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

This system was used to create a grading scale, where each of the metrics was assigned a point value. A number was assigned to each category based on the rating and the level of characterization possible; e.g. someone with a good AP value would be given a score of 1, and a value of 0 if they had a bad score, or someone with an excellent CAPEX Adjusted Coverage Ratio was given a 4, and someone with an ok score was given 1 point.

The points were then added to give a total score. In order to be defined as credit worthy, a ratio of total score to the maximum possible score would have to reach a minimum value of 0.79 (this number is the same number used as the minimum value of credit score still determined to be good out of the maximum possible value). In this study, the maximum possible value was 31.

## Clarifications
The data that was used for this project contained missing information pertinent to the calculation of several variables; as such, the sample results provided displays multiple NULL values. For this example, whenever a NULL value is encountered, it is treated as 0. The metrics used to determine the creditworthiness were taken to be applied in the most general sense; in reality, some values and their indication of a business's health is sensitive to the industry it's a part of.


### References
