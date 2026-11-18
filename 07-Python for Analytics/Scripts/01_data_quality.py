from pathlib import Path
import pandas as pd
root=Path(__file__).resolve().parents[1]
df=pd.read_csv(root/'data/healthcare_python_raw.csv',parse_dates=['VisitDate'])
print('Shape:',df.shape)
print(df.dtypes)
print('Missing values:\n',df.isna().sum())
print('Duplicate PatientIDs:',df.duplicated('PatientID').sum())
profile=pd.DataFrame({'missing_count':df.isna().sum(),'missing_percent':(df.isna().mean()*100).round(2),'dtype':df.dtypes.astype(str)})
profile.to_csv(root/'reports/data_quality_profile.csv')
