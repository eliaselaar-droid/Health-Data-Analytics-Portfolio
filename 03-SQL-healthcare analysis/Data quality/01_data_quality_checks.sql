USE HospitalPortfolio ;

/* Table row counts */
SELECT 'Patients' AS TableName, 
COUNT(*) AS RecordCount 
FROM dbo.Patients
UNION ALL
SELECT 'Visits', COUNT(*) 
FROM dbo.Visits ;

/* Missing values in important patient 
fields */
SELECT
SUM(CASE WHEN Gender IS NULL OR
LTRIM(RTRIM(Gender)) 
= '' THEN 1 ELSE 0 END) AS MissingGender,
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END)
AS MissingAge,
SUM(CASE WHEN County IS NULL OR 
LTRIM(RTRIM(County)) = '' THEN 1 ELSE 0 END) 
AS MissingCounty,
SUM(CASE WHEN Diagnosis IS NULL OR 
LTRIM(RTRIM(Diagnosis)) = '' THEN 1 ELSE 0 END) 
AS MissingDiagnosis,
SUM(CASE WHEN AdmissionDate IS NULL 
THEN 1 ELSE 0 END) AS MissingAdmissionDate
FROM dbo.Patients ;

/* Duplicate patient identifiers */
SELECT PatientID,
COUNT(*) AS Occurrences
FROM dbo.Patients
GROUP BY PatientID
HAVING COUNT(*) > 1 ;

/* Invalid or out-of-range ages */
SELECT PatientID, Age
FROM dbo.Patients
WHERE Age IS NOT NULL
AND (Age < 0 OR Age > 120) ;

/* Unexpected gender values */
SELECT PatientID, Gender
FROM dbo.Patients
WHERE Gender IS NOT NULL
AND Gender NOT IN ('Male', 'Female', 'Other') ;

/* Leading or trailing spaces in text fields */
SELECT PatientID, FirstName, LastName, County, 
Diagnosis
FROM dbo.Patients
WHERE FirstName <> LTRIM(RTRIM(FirstName))
   OR LastName <> LTRIM(RTRIM(LastName))
   OR (County IS NOT NULL AND County <> 
   LTRIM(RTRIM(County)))
   OR (Diagnosis IS NOT NULL AND 
   Diagnosis <> LTRIM(RTRIM(Diagnosis))) ;

/* Visits without a matching patient 
(orphan records) */
SELECT v.VisitID, v.PatientID
FROM dbo.Visits AS v
LEFT JOIN dbo.Patients AS p
    ON v.PatientID = p.PatientID
WHERE p.PatientID IS NULL ;

/* Missing visit information */
SELECT
    SUM(CASE WHEN VisitDate IS NULL 
    THEN 1 ELSE 0 END) AS MissingVisitDate,
    SUM(CASE WHEN Department IS NULL OR 
    LTRIM(RTRIM(Department)) = '' THEN
    1 ELSE 0 END) AS MissingDepartment,
    SUM(CASE WHEN VisitType IS NULL OR
    LTRIM(RTRIM(VisitType)) = '' THEN
    1 ELSE 0 END) AS MissingVisitType
FROM dbo.Visits ;

/* Visits dated before the patient's 
admission date */
SELECT v.VisitID, v.PatientID, p.AdmissionDate,
v.VisitDate
FROM dbo.Visits AS v
INNER JOIN dbo.Patients AS p
    ON v.PatientID = p.PatientID
WHERE v.VisitDate < p.AdmissionDate ;
