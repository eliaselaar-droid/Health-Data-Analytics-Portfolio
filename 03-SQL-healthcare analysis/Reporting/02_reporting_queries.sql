USE HospitalPortfolio;
/* Patient demographic summary by gender and 
countyb */
SELECT *
FROM dbo.Patients
ORDER BY County, Gender ;

-- Service utilisation by department
SELECT *
FROM dbo.Visits
ORDER BY Department DESC ;

-- Monthly visit trend
SELECT *
FROM dbo.Visits
ORDER BY VisitDate ;

-- Overall summary indicators
SELECT
(SELECT COUNT(*) FROM dbo.Patients) AS TotalPatients,
(SELECT COUNT(*) FROM dbo.Visits) AS TotalVisits,
(SELECT COUNT(DISTINCT PatientID) FROM dbo.Visits) AS PatientsWithVisits,
(SELECT COUNT(*) FROM dbo.Patients AS p
WHERE NOT EXISTS
(SELECT 1 FROM dbo.Visits AS v 
WHERE v.PatientID = p.PatientID)
    ) AS PatientsWithoutVisits ;
