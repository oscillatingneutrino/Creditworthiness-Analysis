import numpy as np
import pandas as pd

df = pd.read_csv('clean_financials.csv')

df["interest_expense"].replace(0, np.nan, inplace=True)

ratio = df["ebit"]/df["interest_expense"]

conditions = [
    (ratio >=10) & (ratio<100),
    (ratio >=100) & (ratio<1000),
    (ratio >=1000)
    ]

multiply = [10,100,1000]

df["modify_interest_expense"] = np.select(
    conditions,
    [df["interest_expense"] * m for m in multiply],
    default = df["interest_expense"]
    )

df["modify_interest_expense"].fillna(0, inplace=True)

df.to_csv('/Users/d404me/Downloads/clean_financials_updated.csv', index=False)
