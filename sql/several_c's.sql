-- SELECT * FROM try1

SELECT
	CASE WHEN ebitda IS NOT NULL THEN total_debt/ebitda
		ELSE total_debt/ebit END AS tlr,
	CASE WHEN ebitda IS NOT NULL THEN senior_debt/ebitda
		ELSE senior_debt/ebit END AS sdlr,
	CASE WHEN interest_expense IS NOT NULL THEN ebit/interest_expense
		ELSE 0 END AS ebit_coverage_ratio, -- fix later
	CASE WHEN ebitda IS NOT NULL THEN ebitda/interest_expense
		ELSE 0 END AS sdlr, -- fix later
	CASE WHEN ebitda IS NOT NULL THEN (ebitda - capex)/interest_expense
		ELSE (ebit - capex)/interest_expense END AS capex_adjusted_coverage_ratio, -- fix later
	(accounts_receivable/revenue) * 90 AS AR,
    (accounts_payable/cogs) * 90 AS AP,
    (invenstory/cogs) * 90 AS inventory_days,
    (accounts_receivable/revenue) * 90 + (invenstory/cogs) * 90 - (accounts_payable/cogs) * 90 AS CCC
FROM try1
