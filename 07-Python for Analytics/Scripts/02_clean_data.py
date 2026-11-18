from pathlib import Path
import pandas as pd
root=Path(__file__).resolve().parents[1]
df=pd.read_csv(root/'data/healthcare_python_raw.csv',parse_dates=['VisitDate'])
before=len(df); df=df.drop_duplicates('PatientID',keep='first').copy()
for c in ['Gender','County','Diagnosis']: df[c]=df[c].fillna('Unknown')
for c in ['BMI','FastingGlucose']: df[c]=df[c].fillna(df[c].median())
df.to_csv(root/'data/healthcare_python_cleaned.csv',index=False)
pd.DataFrame([{'step':'Remove duplicate PatientID','records_before':before,'records_after':len(df)},
{'step':'Fill categorical missing values','records_before':len(df),'records_after':len(df)},
{'step':'Median imputation for BMI and glucose','records_before':len(df),'records_after':len(df)}]).to_csv(root/'reports/cleaning_log.csv',index=False)
print('Cleaned records:',len(df))
