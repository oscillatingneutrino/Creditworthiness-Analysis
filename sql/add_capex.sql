WITH rcte AS(
	SELECT
		borrower_id,
        h_capex_r = AVG(capex/revenue)
	FROM finances
    WHERE capex IS NOT NULL
    GROUP BY borrower_id
)
    
UPDATE finances f
SET
	f.capex = h_capex_r * revenue
WHERE f.capex IS NULL
