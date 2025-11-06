CREATE TABLE `collateral` (
  `collateral_id` text,
  `loan_id` text,
  `borrower_id` text,
  `asset_type` text,
  `appraised_value` int DEFAULT NULL,
  `collateral_quality` text
)
