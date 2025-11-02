import pandas as pd

df = pd.read_csv('loans.csv')

df['issue_date'] = pd.to_datetime(df['issue_date'], format = 'mixed')

#print(df.to_string())
