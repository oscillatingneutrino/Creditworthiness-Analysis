
-- NOTE: THE CODE BELOW ONLY WORKS IN POSTGRE AND SQL SERVER
WITH rcte AS(
	SELECT
		borrower_id,
        h_capex_r = AVG(capex/revenue)
	FROM finances
    WHERE capex IS NOT NULL
    GROUP BY borrower_id
)
    
UPDATE finances f
INNER JOIN rcte r
	ON r.borrower_id = f.borrower_id
SET
	f.capex = r.h_capex_r * f.revenue
WHERE f.capex IS NULL
