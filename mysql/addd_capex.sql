-- SET SQL_SAFE_UPDATES = 0; USE THIS ONLY IF MYSQL SAYS YOU NEED A KEY. THIS DISABLES SAFE MODE

CREATE TEMPORARY TABLE rtte AS
	SELECT
		borrower_id,
        SUM(capex)/SUM(revenue) AS h_capex_r
	FROM finances
		WHERE capex IS NOT NULL
        GROUP BY borrower_id;

UPDATE finances f
JOIN rtte r
	ON r.borrower_id = f.borrower_id
SET
	f.capex = r.h_capex_r * f.revenue
WHERE f.capex IS NULL
	AND f.borrower_id IS NOT NULL;


-- SET SQL_SAFE_UPDATES = 1; THIS REACTIVATES SAFE MODE
