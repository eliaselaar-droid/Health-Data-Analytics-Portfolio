from pathlib import Path
import pandas as pd
from scipy.stats import chi2_contingency,ttest_ind,pearsonr
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder,StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report,confusion_matrix,roc_auc_score
root=Path(__file__).resolve().parents[1]
df=pd.read_csv(root/'data/healthcare_python_cleaned.csv')
chi2,p,dof,expected=chi2_contingency(pd.crosstab(df.Gender,df.Readmission30d))
print('Chi-square gender/readmission:',chi2,p,dof)
print('BMI t-test:',ttest_ind(df.loc[df.Readmission30d==1,'BMI'],df.loc[df.Readmission30d==0,'BMI'],equal_var=False))
print('Age/systolic BP correlation:',pearsonr(df.Age,df.SystolicBP))
num=['Age','BMI','SystolicBP','DiastolicBP','LengthOfStayDays']; cat=['Gender','Diagnosis']
X=df[num+cat]; y=df.Readmission30d
prep=ColumnTransformer([('num',Pipeline([('impute',SimpleImputer(strategy='median')),('scale',StandardScaler())]),num),('cat',Pipeline([('impute',SimpleImputer(strategy='most_frequent')),('onehot',OneHotEncoder(handle_unknown='ignore'))]),cat)])
model=Pipeline([('prep',prep),('logit',LogisticRegression(max_iter=1000,class_weight='balanced'))])
Xtr,Xte,ytr,yte=train_test_split(X,y,test_size=.25,random_state=42,stratify=y)
model.fit(Xtr,ytr); pred=model.predict(Xte); prob=model.predict_proba(Xte)[:,1]
print(confusion_matrix(yte,pred)); print(classification_report(yte,pred,zero_division=0)); print('ROC-AUC:',roc_auc_score(yte,prob))
print('Synthetic demonstration only; no clinical validity.')
