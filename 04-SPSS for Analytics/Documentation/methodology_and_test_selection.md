# Methodology and Test Selection

The dataset is a generated sample of 300 synthetic records and is intended for software demonstration, not population inference.

- Frequencies and descriptive statistics summarise categorical and continuous variables.
- Pearson chi-square assesses association between categorical variables. Inspect expected cell counts.
- Independent-samples t-test compares mean BMI between the two gender-coded groups. Check distribution and variance assumptions.
- One-way ANOVA compares mean BMI across diagnosis categories. Check homogeneity and use post-hoc tests only when justified.
- Pearson correlation assesses linear association between continuous variables. Inspect scatterplots and outliers.
- Multiple linear regression models fasting glucose using selected predictors. Check residuals, linearity and multicollinearity.
- Binary logistic regression models the synthetic readmission flag. Check event counts, model fit, influential cases and predictor assumptions.

Report test statistics, degrees of freedom, p-values, confidence intervals and effect sizes where relevant. A p-value alone does not establish clinical importance. No results represent a real hospital.
