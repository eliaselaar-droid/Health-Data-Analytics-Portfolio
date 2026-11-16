USE HospitalPortfolio ;

-- Display all patient records
SELECT * 
FROM dbo.Patients ;

-- Select specific columns
SELECT 
PatientID, 
FirstName, 
LastName, 
Diagnosis
FROM dbo.Patients ;

-- Filter female patients
SELECT *
FROM dbo.Patients
WHERE Gender = 'Female' ;

-- Patients older than 50
SELECT *
FROM dbo.Patients
WHERE Age > 50 ;

-- Patients with HIV diagnosis
SELECT *
FROM dbo.Patients
WHERE Diagnosis = 'HIV' ;

-- Patients aged between 20 and 40 (inclusive)
SELECT *
FROM dbo.Patients
WHERE Age BETWEEN 20 AND 40 ;

-- First names beginning with S
SELECT *
FROM dbo.Patients
WHERE FirstName LIKE 'S%' ;

-- Patients from Kisumu or Siaya
SELECT *
FROM dbo.Patients
WHERE County IN ('Kisumu', 'Siaya') ;

-- Unique counties
SELECT DISTINCT County
FROM dbo.Patients
ORDER BY County;

-- Count patients by gender
SELECT 
Gender, 
COUNT(*) AS PatientCount
FROM dbo.Patients
GROUP BY Gender ;

-- Count patients by county
SELECT 
County, 
COUNT(*) AS PatientCount
FROM dbo.Patients
GROUP BY County
ORDER BY PatientCount DESC ;

-- Count patients by diagnosis
SELECT 
Diagnosis,
COUNT(*) AS PatientCount
FROM dbo.Patients
GROUP BY Diagnosis
ORDER BY PatientCount DESC ;

-- Diagnoses with at least two records
SELECT 
Diagnosis,
COUNT(*) AS PatientCount
FROM dbo.Patients
GROUP BY Diagnosis
HAVING COUNT(*) >= 2 ;

-- Summary statistics for age
SELECT COUNT(Age) AS PatientsWithAge,
       AVG(CAST(Age AS DECIMAL(5,2)))
       AS AverageAge,
       MIN(Age) AS YoungestAge,
       MAX(Age) AS OldestAge
FROM dbo.Patients ;
