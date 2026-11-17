# SPSS Healthcare Statistical Analysis

A complete IBM SPSS Statistics portfolio project using 300 synthetic patient records. It examines demographics, diagnosis categories, BMI, blood pressure, fasting glucose, length of stay, follow-up completion, satisfaction and 30-day readmission.

## Research questions
1. What are the sample demographic and diagnosis characteristics?
2. What are the distributions of selected clinical indicators?
3. Is gender associated with 30-day readmission?
4. Is diagnosis category associated with follow-up completion?
5. Does mean BMI differ across diagnosis categories?
6. Are age, BMI and blood pressure associated with fasting glucose?
7. Which selected variables are associated with the synthetic readmission flag?

## Structure
- `data/`: synthetic CSV; SPSS `.sav` is created by the import syntax.
- `syntax/`: import, descriptive and inferential SPSS scripts.
- `reports/`: report template and sample data profile.
- `documentation/`: data dictionary and methodology.

## Software and execution
Use IBM SPSS Statistics (version 25+ recommended). Set the working directory to this project folder, then run scripts in order: 01, 02, 03. Save your actual SPSS Output Viewer file (`.spv`) in `reports/`.

## Statistical methods
Frequencies, descriptive statistics, histograms, chi-square, independent-samples t-test, one-way ANOVA, Pearson correlation, multiple linear regression and binary logistic regression.

All records are synthetic. Check assumptions, outliers, expected cell counts, model diagnostics and effect sizes before interpreting tests. Statistical association does not establish causation. Do not upload identifiable patient information.

