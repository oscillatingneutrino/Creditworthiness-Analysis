CREATE TABLE `clean_loan` (
  `loan_id` text,
  `borrower_id` text,
  `loan_amount` int DEFAULT NULL,
  `interest_rate` double DEFAULT NULL,
  `term_years` int DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `purpose` text,
  `loan_status` text,
  `has_collateral` text
)
