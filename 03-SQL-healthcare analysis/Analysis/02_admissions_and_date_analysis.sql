USE HospitalPortfolio ;

-- Admissions after 20 July 2026
SELECT
PatientID,
FirstName,
LastName,
AdmissionDate
FROM dbo.Patients
WHERE AdmissionDate > '2026-07-20' ;

-- Admission year, month number and day
SELECT 
PatientID, 
AdmissionDate,
YEAR(AdmissionDate) AS AdmissionYear,
MONTH(AdmissionDate) AS AdmissionMonth,
DAY(AdmissionDate) AS AdmissionDay
FROM dbo.Patients ;

-- Admission month name
SELECT 
PatientID,
AdmissionDate,
DATENAME(MONTH, AdmissionDate) 
AS AdmissionMonthName
FROM dbo.Patients ;

-- End of the admission month
SELECT 
PatientID,
AdmissionDate,
EOMONTH(AdmissionDate) AS MonthEnd
FROM dbo.Patients ;

-- Illustrative date 30 days after admission
SELECT
PatientID,
AdmissionDate,
DATEADD(DAY, 30, AdmissionDate)
AS IllustrativeFollowUpDate
FROM dbo.Patients ;

/* Filter a complete date interval using 
inclusive start and exclusive end */
SELECT 
PatientID,
FirstName, 
AdmissionDate
FROM dbo.Patients
WHERE AdmissionDate >= '2026-07-01'
  AND AdmissionDate <  '2026-09-01' ;

/* Number of days between admission and the 
current SQL Server date */
/* This value changes depending on when the 
query is executed. */
SELECT 
PatientID,
AdmissionDate,
DATEDIFF(DAY, AdmissionDate, 
CAST(GETDATE() AS DATE)) AS DaysSinceAdmission
FROM dbo.Patients ;
