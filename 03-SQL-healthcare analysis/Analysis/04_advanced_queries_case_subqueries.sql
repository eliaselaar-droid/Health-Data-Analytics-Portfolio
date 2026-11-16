USE HospitalPortfolio ;

-- Patients older than the overall average age
SELECT
PatientID,
FirstName,
LastName,
Age
FROM dbo.Patients
WHERE Age > 
(SELECT AVG(CAST(Age AS DECIMAL(5,2)))
FROM dbo.Patients) ;

/* Patients whose diagnosis occurs among
patients aged 40 or older */
SELECT PatientID, FirstName, LastName, Diagnosis
FROM dbo.Patients
WHERE Diagnosis IN
(
    SELECT Diagnosis
    FROM dbo.Patients
    WHERE Age >= 40
) ;

-- Patients with at least one HIV Clinic visit
SELECT p.PatientID, p.FirstName, p.LastName
FROM dbo.Patients AS p
WHERE EXISTS
(
    SELECT 1
    FROM dbo.Visits AS v
    WHERE v.PatientID = p.PatientID
      AND v.Department = 'HIV Clinic'
) ;

--Patients who have never had a follow-up visit
SELECT p.PatientID, p.FirstName, p.LastName
FROM dbo.Patients AS p
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Visits AS v
    WHERE v.PatientID = p.PatientID
      AND v.VisitType = 'Follow-up'
) ;

-- CASE: group patients by age band
SELECT PatientID, FirstName, Age,
CASE
WHEN Age < 18 THEN 'Child'
WHEN Age BETWEEN 18 AND 59 THEN 'Adult'
WHEN Age >= 60 THEN 'Older adult'
ELSE 'Unknown'
END AS AgeGroup
FROM dbo.Patients ;

/* CASE: broad diagnosis grouping for
demonstration only */
SELECT PatientID, Diagnosis,
CASE
WHEN Diagnosis IN ('Diabetes', 'Hypertension') 
           THEN 'Non-communicable condition'
WHEN Diagnosis IN
('Malaria', 'Pneumonia', 'Tuberculosis',
'Typhoid') THEN 'Potentially infectious condition'
           ELSE 'Other / review'
       END AS DiagnosisGroup
FROM dbo.Patients ;
