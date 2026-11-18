# Methodology and Limitations

Workflow: load raw data; inspect shape, types, missingness and duplicates; clean a working copy; conduct descriptive and grouped analysis; visualise distributions and trends; perform selected statistical tests; demonstrate logistic regression.

Missing categorical values are labelled Unknown; selected numeric missing values are median-imputed for teaching. Duplicate identifiers are reduced to one row by retaining the first occurrence. In real healthcare work, verify duplicate records against source systems and choose imputation rules based on clinical and operational context.

All records and outcomes are synthetic. The readmission flag is not a validated patient-level outcome. A model trained on this data has no clinical validity or generalisability. Correlation does not establish causation.
