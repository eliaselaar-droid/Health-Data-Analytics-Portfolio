SELECT
    Gender,
    County,
    COUNT(*) AS PatientCount,
    AVG(CAST(Age AS DECIMAL(5,2))) AS 
    AverageAge
FROM dbo.Patients
GROUP BY Gender, County ;

/* Count distinct patients */
SELECT
    Department,
    COUNT(*) AS TotalVisits,
    COUNT(DISTINCT PatientID) AS UniquePatients
FROM dbo.Visits
GROUP BY Department ;

SELECT
 DATEFROMPARTS(YEAR(VisitDate), 
 MONTH(VisitDate), 1) AS VisitMonth,
 COUNT(*) AS TotalVisits,
 COUNT(DISTINCT PatientID) AS UniquePatients
FROM dbo.Visits
WHERE VisitDate IS NOT NULL
GROUP BY DATEFROMPARTS(YEAR(VisitDate),
MONTH(VisitDate), 1) ;
