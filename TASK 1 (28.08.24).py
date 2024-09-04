#amita C (28-08-24)
import pandas as pd

#  dataset
data = {
    "Employee_ID": [101, 102, 103, 104, 105, 106],
    "Name": ["Rajesh", "Meena", "Suresh", "Anita", "Vijay", "Neeta"],
    "Department": ["HR", "IT", "Finance", "IT", "Finance", "HR"],
    "Age": [29, 35, 45, 32, 50, 28],
    "Salary": [70000, 85000, 95000, 64000, 120000, 72000],
    "City": ["Delhi", "Mumbai", "Bangalore", "Chennai", "Delhi", "Mumbai"]
}

df = pd.DataFrame(data)
print(df)

#  1. Rename Columns
df = df.rename(columns={"Salary": "Annual Salary", "City": "Location"})
print(df)

#  2. Drop Columns
df = df.drop(columns=["Location"])
print(df)

#  3. Drop Rows
df = df[df["Name"] != "Suresh"]
print(df)

#  4. Handle Missing Data
df.loc[df["Name"] == "Meena", "Salary"] = None
pd.set_option('future.no_silent_downcasting', True)
df["Salary"] = df["Salary"].fillna(df["Salary"].mean())
print(df)

#  5. Create Conditional Columns
df["Seniority"] = df["Age"].apply(lambda x: "Senior" if x >= 40 else "Junior")
print(df)

#  6. Grouping and Aggregation
grouped_df = df.groupby("Department")["Annual Salary"].mean()
print(grouped_df)