CREATE TABLE `borrowers` (
  `borrower_id` text,
  `company_name` text,
  `industry` text,
  `region` text,
  `credit_score` int DEFAULT NULL,
  `relationship_length_yrs` int DEFAULT NULL,
  `years_in_business` int DEFAULT NULL,
  `customer_type` text
)
