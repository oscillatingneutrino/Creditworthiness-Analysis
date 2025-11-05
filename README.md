# Creditworthiness-Analysis

## Table of Contents
- [Executive Summary](#Executive-Summary)
- [Key Creditworthiness Indicators](#Key-Creditworthiness-Indicators)
- [Defining Creditworthiness](#Defining-Creditworthiness)
- [Determining Creditworthiness](#Determining-Creditworthiness)
- [Credit Forecasting](#Credit-Forecasting)
- [Forecasting Cashflow](#Forecasting-Cashflow)
- [Clarifications](#Clarifications)
- [References](#References)

### Executive Summary
Determining whether business is credit-worthy is dependent on the character, capacity, capital, collateral, and conditions. To quantify these constituents and test their ability to satisfy set conditions requires an in-depth look into financial statements containing the operational history of the business, financial practices, its ability to pay back loans, and external economic factors. Using simulated data with missing values, this project used Excel, Python, and SQL to obtain useful metrics such as total debt to EBITDA, Interest Coverage Ratio, and Operating Cash Flow Coverage to ascertain the creditworthiness of a company. Furthermore, the simulated data was used to forecast the credit of a company to determine its financial stability.

### Key Creditworthiness Indicators
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
| Debt Service Ratio | Determines the sustainability of paying off debts |
| Loan Status | Shows whether a company has paid off a loan |
| Credit Score | A prediction of your credit behavior |



### Defining Creditworthiness
Although individually useful, the above metrics can only determine an individual's credit worthiness when assessed as components of a larger sum. Doing justice to each of these metrics, the following conditions were used in order to determine whether or not an individual is creditworthy:

| Metric | Purpose | Condition | Condition | Condition | Condition |
|---|---|---|---|---|---|
| Collateral Coverage Ratio | <1 Bad | 1-2 Good | >2 Overcollaterized | --- | --- |
| TLR | >5 Problematic | 3-5 Moderate | <3 Good | --- | --- |
| SDLR | >4 Concerning | 3-4 Elevated | 2-3 Good | <2 Excellent | --- |
| EBIT Coverage Ratio | <1 Bad | 1-2 Moderate | >2 Good | >3 Very Good | --- |
| EBITDA Coverage Ratio | <1.5 Bad | 1.5-3 Satisfactory | >3 Healthy | --- | --- |
| CAPEX Adjusted Coverage Ratio | <1 Bad | 1 Ok | 1.25-2 Healthy | >2 Strong | --- |
| AP | 0-30 Good | >30 Bad | --- | --- | --- |
| AR | 0-60 Good | >60 Bad | --- | --- | --- |
| Inventory Days | 0-60 Good | --- | --- | --- | --- |
| CCC | 0-45 Good | --- | --- | --- | --- |
| Debt to Equity | >2 Bad | 1.0-1.5 Balanced | <1 Good | --- | --- |
| Operating Cash Flow Coverage | <1 Bad | 1-2 Healthy | >2 Strong | --- | --- | 
| Operating Margin | <0.005 Bad | 0.1 Average | 0.1-0.2 Healthy | >0.2 High | --- |
| Liquidity Ratio | 1.5-2.0 Good | Else Bad | --- | --- | --- |
| Debt to Service Ratio | <1 Risky | 1.0-1.24 Less Healthy | 1.25-1.49 Acceptable | >1.50 strong | --- |
| Credit Score | 300-579 Poor | 580 - 669 Fair | 670 - 739 Good | 740 - 799 Very Good | 800 - 850 Exceptional |

### Credit Forecasting

### Clarifications

### References
