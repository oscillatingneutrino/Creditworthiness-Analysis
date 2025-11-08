import pandas as pd
from sklearn.linear_model import LinearRegression


df = pd.read_csv('final_results.csv')

predictors = df[["tlr", "sdlr", "ebit_coverage_ratio", "ebitda_coverage_ratio", "capex_adjusted_coverage_ratio",
              "AR", "AP","inventory_days", "CCC", "debt_to_equity", "operating_cash_flow_coverage",
              "profit_margin", "liquidity_ratio"]]

outcome = df["credit_score"]

predictors = predictors.fillna(0)
outcome = outcome.fillna(outcome.mean())

results = LinearRegression()

results.fit(predictors,outcome)

print("R² Score:", results.score(predictors, outcome))
print("Coefficients:", results.coef_)
