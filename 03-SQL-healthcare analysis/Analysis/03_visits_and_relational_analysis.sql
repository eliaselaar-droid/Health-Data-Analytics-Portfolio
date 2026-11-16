USE HospitalPortfolio ;

/* INNER JOIN: patients with matching visit
records */
SELECT 
p.PatientID, 
p.FirstName,
p.LastName,
v.VisitDate,
v.Department,
v.VisitType
FROM dbo.Patients AS p
INNER JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID
ORDER BY v.VisitDate ;

-- Follow-up visits
SELECT
p.PatientID,
p.FirstName,
p.LastName,
v.VisitDate,
v.Department
FROM dbo.Patients AS p
INNER JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID
WHERE v.VisitType = 'Follow-up' ;

/* LEFT JOIN: all patients, including those 
without visits */
SELECT 
p.PatientID,
p.FirstName,
p.LastName,
v.VisitID,
v.VisitDate,
v.Department
FROM dbo.Patients AS p
LEFT JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID ;

-- Patients without a recorded visit
SELECT
p.PatientID,
p.FirstName,
p.LastName
FROM dbo.Patients AS p
LEFT JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID
WHERE v.VisitID IS NULL ;

-- RIGHT JOIN example: retain all visits
SELECT
p.PatientID,
p.FirstName,
v.VisitID,
v.VisitDate,
v.Department
FROM dbo.Patients AS p
RIGHT JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID ;

-- FULL OUTER JOIN: all patients and all visits
SELECT
p.PatientID,
p.FirstName,
v.VisitID,
v.PatientID AS VisitPatientID,
v.VisitDate
FROM dbo.Patients AS p
FULL OUTER JOIN dbo.Visits AS v
    ON p.PatientID = v.PatientID ;

-- Visit counts by department
SELECT 
Department,
COUNT(*) AS VisitCount
FROM dbo.Visits
GROUP BY Department
ORDER BY VisitCount DESC ;

-- Visit counts by visit type
SELECT
VisitType,
COUNT(*) AS VisitCount
FROM dbo.Visits
GROUP BY VisitType
ORDER BY VisitCount DESC ;

-- Monthly visit volume
SELECT 
YEAR(VisitDate) AS VisitYear,
MONTH(VisitDate) AS VisitMonth,
COUNT(*) AS TotalVisits
FROM dbo.Visits
GROUP BY YEAR(VisitDate),
MONTH(VisitDate)
ORDER BY VisitYear, VisitMonth ;
