import pandas as pd

df = pd.read_csv("Sample_Superstore.csv", encoding='latin1')

df = df.drop(columns=['Row ID'])

df.columns = df.columns.str.lower().str.strip().str.replace(' ', '_').str.replace('-', '_')

df['order_date'] = pd.to_datetime(df['order_date'])
df['ship_date'] = pd.to_datetime(df['ship_date'])

df = df.drop_duplicates()
print(df.info())
print(df.isna().sum())

df.to_csv("cleaned_sample_superstore.csv", index=False)

from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://root:amaan@localhost/superstore_analysis')

df.to_sql(name='superstore_sales', con=engine, if_exists='replace', index=False)

