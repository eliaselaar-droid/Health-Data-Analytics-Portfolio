* IBM SPSS Statistics syntax. All data are synthetic.
GET DATA
 /TYPE=TXT
 /FILE='data/healthcare_spss_synthetic_data.csv'
 /DELCASE=LINE /DELIMITERS="," /QUALIFIER='"'
 /ARRANGEMENT=DELIMITED /FIRSTCASE=2
 /VARIABLES=
 PatientID F8.0 Age F3.0 GenderCode F1.0 CountyCode F1.0 DiagnosisCode F1.0
 BMI F4.1 SystolicBP F3.0 DiastolicBP F3.0 FastingGlucose F4.1
 LengthOfStayDays F2.0 Readmission30d F1.0 FollowUpCompleted F1.0 SatisfactionScore F1.0.
EXECUTE.
DATASET NAME HealthcareData.
VARIABLE LABELS
 PatientID 'Synthetic patient identifier'
 Age 'Age in completed years'
 GenderCode 'Gender category code'
 CountyCode 'County category code'
 DiagnosisCode 'Primary diagnosis category code'
 BMI 'Body mass index (kg/m2)'
 SystolicBP 'Systolic blood pressure (mmHg)'
 DiastolicBP 'Diastolic blood pressure (mmHg)'
 FastingGlucose 'Fasting blood glucose (mmol/L)'
 LengthOfStayDays 'Length of stay in days'
 Readmission30d 'Readmission within 30 days'
 FollowUpCompleted 'Follow-up completed'
 SatisfactionScore 'Satisfaction score (1-5)'.
VALUE LABELS
 GenderCode 1 'Male' 2 'Female'
 /CountyCode 1 'Nairobi' 2 'Kiambu' 3 'Kisumu' 4 'Turkana' 5 'Nakuru' 6 'Uasin Gishu'
 /DiagnosisCode 1 'HIV' 2 'Diabetes' 3 'Hypertension' 4 'Malaria' 5 'Other'
 /Readmission30d 0 'No' 1 'Yes'
 /FollowUpCompleted 0 'No' 1 'Yes'
 /SatisfactionScore 1 'Very dissatisfied' 2 'Dissatisfied' 3 'Neutral' 4 'Satisfied' 5 'Very satisfied'.
VARIABLE LEVEL PatientID GenderCode CountyCode DiagnosisCode Readmission30d FollowUpCompleted (NOMINAL)
 /SatisfactionScore (ORDINAL)
 /Age BMI SystolicBP DiastolicBP FastingGlucose LengthOfStayDays (SCALE).
SAVE OUTFILE='data/healthcare_spss_dataset.sav'.
