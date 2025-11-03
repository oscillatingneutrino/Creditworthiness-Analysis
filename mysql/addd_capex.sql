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
