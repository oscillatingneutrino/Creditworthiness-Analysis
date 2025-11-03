--SET SQL_SAFE_UPDATES = 0;

CREATE TEMPORARY TABLE tte AS
	SELECT
		borrower_id,
        SUM(loan_amount * interest_rate)/SUM(loan_amount) AS w_avg_rate
	FROM clean_loan
		GROUP BY borrower_id;

UPDATE finances f
INNER JOIN tte t
	ON f.borrower_id = t.borrower_id
SET 
	f.interest_expense = f.total_debt * t.w_avg_rate
WHERE f.interest_expense IS NULL
