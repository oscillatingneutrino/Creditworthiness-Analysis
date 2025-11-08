import pandas as pd
from sklearn.linear_model import LinearRegression


df = pd.read_csv('/Users/d404me/Downloads/final_results_rated_creditworthiness - final_results_rated.csv.csv')

predictors = df[["AR", "AP","inventory_days", "CCC"]]

predictors1 = df[["ebit_coverage_ratio", "ebitda_coverage_ratio", "capex_adjusted_coverage_ratio", "operating_cash_flow_coverage",
              ]]

predictors2 = df[["debt_to_equity", "liquidity_ratio"]]

predictors3 = df[["profit_margin"]]

outcome = df["credit_score"]

predictors3 = predictors3.fillna(0)
outcome = outcome.fillna(outcome.mean())

results = LinearRegression()

results.fit(predictors3,outcome)

print("R² Score:", results.score(predictors3, outcome))
print("Coefficients:", results.coef_)



#"tlr", "sdlr", "ebit_coverage_ratio", "ebitda_coverage_ratio", "capex_adjusted_coverage_ratio",
#              "AR", "AP","inventory_days", "CCC", "debt_to_equity", "operating_cash_flow_coverage",
 #             "profit_margin", "liquidity_ratio"
#
