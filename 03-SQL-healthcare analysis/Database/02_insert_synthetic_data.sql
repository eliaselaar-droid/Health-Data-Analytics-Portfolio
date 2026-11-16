USE HospitalPortfolio ;

INSERT INTO dbo.Patients
(PatientID, FirstName, LastName, Gender, Age, County, Diagnosis, AdmissionDate)
VALUES
(1,'Sample','Patient001','Male',35,'Kiambu','HIV','2026-07-15'),
(2,'Sample','Patient002','Female',28,'Kisumu','Malaria','2026-07-16'),
(3,'Sample','Patient003','Male',42,'Siaya','Diabetes','2026-07-18'),
(4,'Sample','Patient004','Female',31,'Nairobi','Hypertension','2026-07-19'),
(5,'Sample','Patient005','Male',55,'Nakuru','HIV','2026-07-20'),
(6,'Sample','Patient006','Female',24,'Kisumu','Typhoid','2026-07-21'),
(7,'Sample','Patient007','Male',17,'Uasin Gishu','Asthma','2026-07-22'),
(8,'Sample','Patient008','Female',46,'Kericho','Diabetes','2026-07-23'),
(9,'Sample','Patient009','Male',63,'Machakos','Hypertension','2026-07-24'),
(10,'Sample','Patient010','Female',29,'Kiambu','Pregnancy','2026-07-25'),
(11,'Sample','Patient011','Male',38,'Siaya','HIV','2026-07-26'),
(12,'Sample','Patient012','Female',50,'Homa Bay','Tuberculosis','2026-07-27'),
(13,'Sample','Patient013','Male',27,'Nyeri','Malaria','2026-07-28'),
(14,'Sample','Patient014','Female',19,'Kisii','Pneumonia','2026-07-29'),
(15,'Sample','Patient015','Male',44,'Murang’a','Diabetes','2026-07-30'),
(16,'Sample','Patient016','Female',60,'Bomet','Hypertension','2026-08-01'),
(17,'Sample','Patient017','Male',33,'Nandi','HIV','2026-08-02'),
(18,'Sample','Patient018','Female',40,'Bungoma','Ulcer','2026-08-03'),
(19,'Sample','Patient019','Male',22,'Turkana','Malaria','2026-08-04'),
(20,'Sample','Patient020','Female',36,'Nairobi','Diabetes','2026-08-05')
;

INSERT INTO dbo.Visits
(VisitID, PatientID, VisitDate, Department, VisitType)
VALUES
(1,1,'2026-07-20','Outpatient','Routine'),
(2,1,'2026-07-28','HIV Clinic','Follow-up'),
(3,2,'2026-07-22','Outpatient','Routine'),
(4,3,'2026-07-25','HIV Clinic','Follow-up'),
(5,3,'2026-08-01','Laboratory','Lab Test'),
(6,4,'2026-07-27','Outpatient','Emergency'),
(7,5,'2026-07-30','HIV Clinic','Routine'),
(8,5,'2026-08-05','HIV Clinic','Follow-up'),
(9,7,'2026-08-02','Laboratory','Lab Test'),
(10,10,'2026-08-08','Outpatient','Routine') ;
