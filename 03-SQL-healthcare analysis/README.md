# SQL Healthcare Data Analysis Portfolio

## Overview
A practical SQL Server project demonstrating healthcare database design, data-quality assessment, patient demographics, service utilisation and reporting. All records are fictional and intended only for learning and portfolio demonstration.

## Objectives
- Build a relational database using primary and foreign keys.
- Load and validate synthetic patient and visit records.
- Assess completeness, validity, uniqueness and referential integrity.
- Analyse demographics, diagnoses, department activity and visit trends.
- Apply joins, aggregations, CASE, subqueries, CTEs and window functions.
- Create reusable reporting views.

## Folder structure
| Folder | Purpose |
|---|---|
| `database/` | Database creation and sample data |
| `data-quality/` | Data-quality assessment queries |
| `analysis/` | Patient and service-utilisation analysis |
| `reporting/` | Reusable views and summary reports |
| `documentation/` | Data dictionary and methodology |

Each subfolder has its own README.

## Database tables
**Patients:** PatientID, FirstName, LastName, Gender, Age, County, Diagnosis, AdmissionDate.

**Visits:** VisitID, PatientID, VisitDate, Department, VisitType.

One patient can have many visits. `Visits.PatientID` is a foreign key referencing `Patients.PatientID`.

## Requirements
- Microsoft SQL Server (2016 or later recommended)
- SQL Server Management Studio (SSMS)

## Execution order
1. Run `database/01_create_database_and_tables.sql`.
2. Run `database/02_insert_synthetic_data.sql`.
3. Run `data-quality/01_data_quality_assessment.sql`.
4. Run the scripts in `analysis/` in numerical order.
5. Run `reporting/01_create_reporting_views.sql`.
6. Run `reporting/02_reporting_queries.sql`.

The scripts use the database name `HealthcareAnalyticsPortfolio`.

## Questions explored
- How many patients and visits are recorded?
- What is the distribution of patients by gender, county, age group and diagnosis?
- Which departments record the highest visit volumes?
- How do visits change by month?
- Which patients have repeat visits or no recorded visits?
- What are the average ages by diagnosis?

## Data protection and limitations
All names and records are synthetic. Never upload identifiable patient information, real medical records or confidential facility data to a public repository. The sample is small and cannot represent any real facility, county or population. Accuracy cannot be proven without comparison to an authoritative source; timeliness cannot be assessed without data-entry timestamps and reporting deadlines.

## Skills demonstrated
SQL Server, relational database design, constraints, joins, filtering, grouping, aggregate functions, CASE, date functions, subqueries, CTEs, window functions, data-quality checks, views and healthcare reporting.

## Suggested GitHub description
SQL Server portfolio project demonstrating healthcare database design, data-quality assessment, patient and service-utilisation analysis, and reporting using synthetic data.

