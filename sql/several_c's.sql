	WITH cte AS (
	SELECT
			cloan.borrower_id,
			macro.industry,
			macro.region,
			cloan.interest_rate - macro.avg_interest_rate AS loan_pricing_sensitivity
	FROM clean_loan cloan
		JOIN borrowers b
			ON cloan.borrower_id = b.borrower_id
		JOIN macro
			ON b.industry = macro.industry
			AND b.region = macro.region
	GROUP BY cloan.borrower_id, macro.industry, macro.region, cloan.interest_rate, macro.avg_interest_rate
		
),

colcovr AS (
	SELECT
		col.borrower_id,
		SUM(col.appraised_value)/SUM(cloan.loan_amount) AS collateral_coverage_ratio
	FROM collateral col
		JOIN clean_loan cloan
			ON col.borrower_id = cloan.borrower_id
	GROUP BY col.borrower_id
),
	
quantities AS (

	SELECT
	
	borrower_id,
    
	AVG(CASE WHEN ebitda IS NOT NULL THEN total_debt/ebitda
		ELSE total_debt/ebit END) AS tlr,
	
	AVG(CASE WHEN ebitda IS NOT NULL THEN senior_debt/ebitda
		ELSE senior_debt/ebit END) AS sdlr,
	
	AVG(CASE WHEN interest_expense IS NOT NULL AND interest_expense <> 0 THEN ebit/interest_expense
		ELSE 0 END) AS ebit_coverage_ratio,
	
	AVG(CASE WHEN ebitda IS NOT NULL AND interest_expense <> 0 THEN ebitda/interest_expense
		ELSE 0 END) AS ebitda_coverage_ratio,
	
	AVG(CASE WHEN ebitda IS NOT NULL AND interest_expense <> 0 THEN (ebitda - capex)/interest_expense
		ELSE (ebit - capex)/interest_expense END) AS capex_adjusted_coverage_ratio, 
	
	AVG((accounts_receivable/revenue) * 90) AS AR,
    
	AVG((accounts_payable/cogs) * 90) AS AP,
    
	AVG((inventory/cogs) * 90) AS inventory_days,
    
	AVG((accounts_receivable/revenue) * 90 + (inventory/cogs) * 90 - (accounts_payable/cogs) * 90) AS CCC,
	
	AVG(total_debt/equity) AS debt_to_equity,

	AVG(operating_cash_flow/total_debt) AS operating_cash_flow_coverage,

	AVG(ebit/revenue) AS profit_margin,

	-- b.credit_score,

	AVG(cash/total_debt) AS liquidity_ratio

	FROM clean_financials c

	GROUP BY borrower_id

),

standard_dev AS ( 
	SELECT
		borrower_id,
		
		STDDEV_SAMP(operating_cash_flow) AS stdev_op_cash_flow

	FROM clean_financials

	GROUP BY borrower_id
),
		
loan_quantities AS (
	
    SELECT
    
	borrower_id,
		
	AVG(loan_amount/operating_cash_flow) AS debt_service_ratio,

	MAX(loan_status) AS loan_status

	FROM clean_loan

		JOIN clean_financials
			USING (borrower_id)

	GROUP BY borrower_id

)

SELECT
	q.borrower_id,
	cte.loan_pricing_sensitivity,
	col.collateral_coverage_ratio,
	q.tlr,
	q.sdlr,
	q.ebit_coverage_ratio,
	q.ebitda_coverage_ratio,
	q.capex_adjusted_coverage_ratio,
	q.AR,
	q.AP,
	q.inventory_days,
	q.CCC,
	q.debt_to_equity,
	q.operating_cash_flow_coverage,
	q.profit_margin,
	q.liquidity_ratio,
	st.stdev_op_cash_flow,
	l.debt_service_ratio,
	l.loan_status
FROM quantities q
	LEFT JOIN cte
		ON q.borrower_id = cte.borrower_id
			LEFT JOIN colcovr col
				ON q.borrower_id = col.borrower_id
					LEFT JOIN loan_quantities l
						ON q.borrower_id = l.borrower_id
							LEFT JOIN standard_dev st
								ON q.borrower_id = st.borrower_id
