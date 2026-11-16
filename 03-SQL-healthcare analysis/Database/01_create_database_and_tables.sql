CREATE DATABASE HospitalPortfolio ;
CREATE TABLE dbo.Patients
(
    PatientID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) NULL,
    Age INT NULL,
    County VARCHAR(50) NULL,
    Diagnosis VARCHAR(100) NULL,
    AdmissionDate DATE NULL,
    CONSTRAINT CK_Patients_Age CHECK (Age IS NULL OR Age BETWEEN 0 AND 120),
    CONSTRAINT CK_Patients_Gender CHECK (Gender IS NULL OR Gender IN ('Male', 'Female', 'Other'))
) ;

CREATE TABLE dbo.Visits
(
    VisitID INT NOT NULL PRIMARY KEY,
    PatientID INT NOT NULL,
    VisitDate DATE NULL,
    Department VARCHAR(50) NULL,
    VisitType VARCHAR(50) NULL,
    CONSTRAINT FK_Visits_Patients
        FOREIGN KEY (PatientID) REFERENCES dbo.Patients(PatientID)
) ;

