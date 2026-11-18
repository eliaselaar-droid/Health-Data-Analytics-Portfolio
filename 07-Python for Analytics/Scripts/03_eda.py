from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
root=Path(__file__).resolve().parents[1]
df=pd.read_csv(root/'data/healthcare_python_cleaned.csv',parse_dates=['VisitDate'])
out=root/'visualizations'; out.mkdir(exist_ok=True)
df.describe(include='all').to_csv(root/'reports/descriptive_summary.csv')
df.groupby('County').agg(patients=('PatientID','nunique'),mean_age=('Age','mean'),mean_bmi=('BMI','mean')).round(2).to_csv(root/'reports/county_summary.csv')
sns.histplot(data=df,x='Age',kde=True); plt.title('Age distribution'); plt.tight_layout(); plt.savefig(out/'age_distribution.png'); plt.close()
sns.boxplot(data=df,x='Diagnosis',y='BMI'); plt.xticks(rotation=25); plt.title('BMI by diagnosis'); plt.tight_layout(); plt.savefig(out/'bmi_by_diagnosis.png'); plt.close()
df.set_index('VisitDate').resample('MS')['PatientID'].count().plot(marker='o'); plt.title('Monthly encounter records'); plt.tight_layout(); plt.savefig(out/'monthly_encounters.png'); plt.close()
sns.heatmap(df[['Age','BMI','SystolicBP','DiastolicBP','FastingGlucose','LengthOfStayDays']].corr(),annot=True); plt.title('Correlation matrix'); plt.tight_layout(); plt.savefig(out/'correlation_matrix.png'); plt.close()
print('EDA outputs saved.')
