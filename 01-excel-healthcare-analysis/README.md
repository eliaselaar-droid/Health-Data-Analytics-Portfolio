# Healthcare Data Analysis Using Excel

## Project Overview
This project focuses on assessing healthcare data quality and analyzing hospital patient records using MS Excel.

## Objectives
- Assess completeness and missing-value patterns.
- Identify duplicate patient identifiers.
- Flag invalid or implausible age, weight and height values for review.
- Standardise gender, county, diagnosis and department categories.
- Summarise patient demographics and service information.
- Present key findings in an Excel dashboard.

## Key findings
- 200 records and 13 original variables.
- 47 missing cells out of 2,600 possible cells; overall completeness is 98.19%.
- Six fields contain missing values: Gender (8), County (10), Diagnosis (7), Weight_kg (9), Height_cm (8), Visit_Date (5).
- Five distinct Patient_ID values are duplicated; 10 records belong to duplicate groups, representing five excess records if one row per patient is the intended rule.
- Four age values are flagged by the training rule (below 0 or above 120).
- Four non-missing weight values are flagged by the training screening rule (zero/negative or above 300 kg).
- Three non-missing height values are flagged by the training screening rule (zero/negative, below 50 cm or above 250 cm).
- Known category variants are standardised in helper columns while original fields are retained.

## Data ethics and limitations
All records are synthetic and contain no real patient information.

## Tools used
- Microsoft Excel 2021
- PivotTables
- Excel Formulas
- Charts and Dashboards

## Project status
Completed analytical excel portfolio project.
