	WITH cte AS (
	SELECT
			borrower_id,
			macro.industry,
			macro.region,
			cloan.interest_rate - macro.avg_interest_rate AS loan_pricing_sensitivity
	FROM clean_loan cloan
		JOIN borrowers b
			ON cloan.borrower_id = b.borrower_id
		JOIN macro
			ON b.industry = macro.industry
			AND b.region = macro.region
),

colcovr AS (
	SELECT
		col.borrower_id,
		SUM(col.appraised_value)/SUM(cloan.loan_amount) AS collateral_coverage_ratio
	FROM collateral col
		JOIN clean_loan cloan
			ON col.borrower_id = cloan.borrower_id
	GROUP BY col.borrower_id
)
	
SELECT
	CASE WHEN ebitda IS NOT NULL THEN total_debt/ebitda
		ELSE total_debt/ebit END AS tlr,
	
	CASE WHEN ebitda IS NOT NULL THEN senior_debt/ebitda
		ELSE senior_debt/ebit END AS sdlr,
	
	CASE WHEN interest_expense IS NOT NULL AND interest_expense <> 0 THEN ebit/interest_expense
		ELSE 0 END AS ebit_coverage_ratio,
	
	CASE WHEN ebitda IS NOT NULL AND interest_expense <> 0 THEN ebitda/interest_expense
		ELSE 0 END AS ebitda_coverage_ratio,
	
	CASE WHEN ebitda IS NOT NULL AND interest_expense <> 0 THEN (ebitda - capex)/interest_expense
		ELSE (ebit - capex)/interest_expense END AS capex_adjusted_coverage_ratio, 
	
	(accounts_receivable/revenue) * 90 AS AR,
    
	(accounts_payable/cogs) * 90 AS AP,
    
	(inventory/cogs) * 90 AS inventory_days,
    
	(accounts_receivable/revenue) * 90 + (inventory/cogs) * 90 - (accounts_payable/cogs) * 90 AS CCC,
	
	total_debt/equity AS debt_to_equity,

	operating_cash_flow/total_debt AS operating_cash_flow_coverage,

	ebit/revenue AS profit_margin,

	b.credit_score,

	cash/total_debt AS liquidity_ratio,

	ROUND(STDDEV_SAMP(operating_cash_flow) OVER (PARTITION BY c.borrower_id),0) AS stdev_op_cash_flow,

	cloan.loan_amount/operating_cash_flow AS debt_service_ratio,

	cloan.loan_status AS loan_status,

	cte.loan_pricing_sensitivity
	
FROM clean_financials c
	LEFT JOIN borrowers b
		ON c.borrower_id = b.borrower_id
JOIN collateral col
	ON c.borrower_id = col.borrower_id
JOIN clean_loan cloan
	ON c.borrower_id = cloan.borrower_id
JOIN cte
	ON cte.borrower_id = c.borrower_id
	
