import numpy as np
import pandas as pd


df = pd.read_csv('/Users/d404me/Downloads/please.csv')

values2 = [0,1]
values3 = [0, 1, 2]
values3odd = [0,1,0]
values4 = [0,1,2,3]
values5 = [0,1,2,3,4]

conditions = [ (df["collateral_coverage_ratio"]<1), 
             
              (df["collateral_coverage_ratio"]>=1) & (df["collateral_coverage_ratio"]<2),
              
              (df["collateral_coverage_ratio"]>=2)
              
              ]

df["ccr_rating"] = np.select(conditions,values3)

#

conditions1 = [ (df["tlr"]>5), 
             
              (df["tlr"]>=3) & (df["tlr"]<5),
              
              (df["tlr"]<3)
              
              ]

df["tlr_rating"] = np.select(conditions1, values3)

#

conditions2 = [ (df["sdlr"]>4), 
             
              (df["sdlr"]>3) & (df["sdlr"]<4),
              
              (df["sdlr"]>=2) & (df["sdlr"]<3),
              
              (df["sdlr"]<2)
              
              ]


df["sdlr_rating"] = np.select(conditions2, values4)

#

conditions3 = [ (df["ebit_coverage_ratio"]<1), 
             
              (df["ebit_coverage_ratio"]>1) & (df["ebit_coverage_ratio"]<2),
              
              (df["ebit_coverage_ratio"]>=2) & (df["ebit_coverage_ratio"]<3),
              
              (df["ebit_coverage_ratio"]>=3)
              
              ]

df["ebit_coverage_ratio_rating"] =np.select(conditions3,values4)

#

conditions4 = [ (df["ebitda_coverage_ratio"]<1.5), 
             
              (df["ebitda_coverage_ratio"]>=1.5) & (df["ebitda_coverage_ratio"]<3),
              
              (df["ebitda_coverage_ratio"]>3)
              
              ]

df["ebitda_coverage_ratio_rating"] =np.select(conditions4,values3)

#

conditions5 = [ (df["capex_adjusted_coverage_ratio"]<1), 
             
              (df["capex_adjusted_coverage_ratio"]>1) & (df["capex_adjusted_coverage_ratio"]<1.24),
              
              (df["capex_adjusted_coverage_ratio"]>=1.25) & (df["capex_adjusted_coverage_ratio"]<2),
              
              (df["capex_adjusted_coverage_ratio"]>2)
              
              ]

df["capex_adjusted_coverage_ratio_rating"] = np.select(conditions5,values4)

#

conditions6 = [ (df["AP"]>30), 
             
              (df["AP"]>0) & (df["AP"]<30)
              
              
              ]

df["AP_rating"] = np.select(conditions6,values2)

#

conditions7 = [ (df["AR"]>60), 
             
              (df["AR"]>0) & (df["AR"]<60)
              
              
              ]

df["AR_rating"] = np.select(conditions7,values2)

#

conditions8 = [ (df["inventory_days"]>60), 
             
              (df["inventory_days"]>0) & (df["inventory_days"]<60)
              
              
              ]

df["inventory_days_rating"] = np.select(conditions8,values2)

#

conditions9 = [ (df["CCC"]>45), 
             
              (df["CCC"]>0) & (df["CCC"]<45)
              
              
              ]

df["CCC_rating"] = np.select(conditions9,values2)

#

conditions10 = [ (df["debt_to_equity"]>2), 
             
              (df["debt_to_equity"]>1) & (df["debt_to_equity"]<2),
              
              (df["debt_to_equity"]<1)
              
              ]

df["debt_to_equity_rating"] = np.select(conditions10,values3)

#

conditions11 = [ (df["operating_cash_flow_coverage"]<1), 
             
              (df["operating_cash_flow_coverage"]>1) & (df["operating_cash_flow_coverage"]<2),
              
              (df["operating_cash_flow_coverage"]>2)
              
              ]

df["operating_cash_flow_coverage_rating"] = np.select(conditions11,values3)

#


conditions12 = [ (df["profit_margin"]<0.05), 
             
              (df["profit_margin"]>=0.005) & (df["profit_margin"]<0.1),
              
              (df["profit_margin"]>0.1) & (df["profit_margin"]<0.2),
              
              (df["profit_margin"]>0.2)
              
              ]

df["profit_margin_rating"] = np.select(conditions12,values4)

#

conditions13 = [ (df["liquidity_ratio"]<1.5), 
             
              (df["liquidity_ratio"]>1.5) & (df["liquidity_ratio"]<2),
              
              (df["liquidity_ratio"]>2)
              
              ]

df["liquidity_ratio_rating"] = np.select(conditions13,values3odd)

#

conditions14 = [ (df["credit_score"]>=300) & (df["credit_score"]<=579), 
             
              (df["credit_score"]>=580) & (df["credit_score"]<=669),
              
              (df["credit_score"]>=670) & (df["credit_score"]<=739),
              
              (df["credit_score"]>=740) & (df["credit_score"]<=799),
              
              (df["credit_score"]>=800) & (df["credit_score"]<=850)
              
              ]

df["credit_score_rating"] = np.select(conditions14,values5)

df.to_csv("results2_rated.csv", index=False)
