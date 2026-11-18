# Data Dictionary

| Field | Description | Units / coding |
|---|---|---|
| PatientID | Synthetic unique patient identifier | Integer |
| Age | Age in completed years | Years |
| Gender | Gender category | Female/Male/Unknown |
| County | County category | County name |
| Diagnosis | Primary diagnosis group | Category |
| BMI | Body mass index | kg/m² |
| SystolicBP | Systolic blood pressure | mmHg |
| DiastolicBP | Diastolic blood pressure | mmHg |
| FastingGlucose | Fasting glucose | mmol/L |
| LengthOfStayDays | Length of stay | Days |
| Readmission30d | Synthetic readmission flag | 0 No; 1 Yes |
| FollowUpCompleted | Follow-up flag | 0 No; 1 Yes |
| VisitDate | Synthetic encounter date | Date |

Raw data deliberately contains missing values and five duplicate PatientID records. All records are synthetic.
