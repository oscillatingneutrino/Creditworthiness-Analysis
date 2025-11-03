WITH cte AS(
	SELECT
		borrower_id,
		w_avg_rate = SUM(c.loan_amount * c.interest_rate)/SUM(c.loan_amount)
		FROM clean_loan
        GROUP BY borrower_id
)

UPDATE finances f	
SET 
	f.interest_expense = f.total_debt * w_avg_rate
WHERE f.interest_expense IS NULL
