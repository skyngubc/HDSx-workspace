# Planted-Error Audit

## Cohort

The intended cohort is records with age from 20 through 80 years, inclusive. The corrected analysis filters on `Age >= 20` and `Age <= 80`. The resulting cohort has 57,137 records; missing or out-of-range ages are excluded before summaries.

## Missingness

Missingness was checked in the age-eligible cohort for `Age`, `BMI`, and `IncomeGroup`, before computing Table 1. The cohort has 0 missing ages, 1,009 missing BMI values, and 5,395 missing income-group values. Table 1 uses the 50,851 records complete on all three variables. No imputation is performed, and missing values in unrelated columns do not cause exclusions.

## Planted Issues

### Issue 1: Age filter does not match the cohort definition

**Category:** Correctness, because the code does not do what the prose says.

**Why it matters:** The analysis cohort is described as adults aged 20-80 *inclusive*, but the code filters with `Age > 20` and `Age < 80`, which excludes people aged exactly 20 and 80. This makes the cohort, and therefore the Table 1 numbers, incorrect.

**Corrected approach:** Edit the filter so it keeps ages 20 and 80: `filter(Age >= 20, Age <= 80)`. Then report the corrected cohort count.

### Issue 2: `na.omit()` drops rows based on unrelated variables

**Category:** Correctness

**Why it matters:** `na.omit()` removes any row with a missing value in any column. This silently excludes records with missing values in variables unrelated to the summary, changing the analysis sample unnecessarily. As long as the key variables (age, BMI, and income group) are present, a record should be kept even if other variables are missing.

**Corrected approach:** Report the cohort N and per-variable missing counts for BMI, Age, and IncomeGroup first. Then filter only on those variables with `filter(!is.na(BMI), !is.na(Age), !is.na(IncomeGroup))`, and report the final N.

### Issue 3: Table labels the variance as an SD

**Category:** Correctness, because the label and the code disagree.

**Why it matters:** The table labels the second number "SD", but the code computes `var()`, which is the variance. Variance is in squared units, so readers will misread it as the spread.

**Corrected approach:** Use `sd()` and label the result mean (SD):
`sprintf("%.1f (%.1f)", mean(BMI, na.rm = TRUE), sd(BMI, na.rm = TRUE))`, and do the same for Age.

### Issue 4: Machine-specific absolute path in `candidate_paths`

**Category:** Reproducibility, because the data source depends on the local machine layout.

**Why it matters:** The first entry in `candidate_paths` is a machine-specific absolute path (`C:/Users/analyst/Documents/...`). This makes the input less transparent and the rendering harder to reproduce.

**Corrected approach:** Use the committed, project-relative CSV path and render from the repository root.

### Issue 5: Inaccurate provenance comment

**Category:** Stewardship

**Why it matters:** The comment claims the file was downloaded from NHANES last week. The input is actually the repository's cached classroom snapshot, not a fresh download, and inaccurate provenance obscures which version was analyzed.

**Corrected approach:** Remove the comment and state the true source: "Prepared NHANES Health Equity classroom CSV snapshot (v6), derived from public-use NHANES files at the CDC and cached in the course repository."

### Issue 6: Interpretation claims significance and causation

**Category:** Interpretation

**Why it matters:** The interpretation claims statistical significance and that income determines BMI, without a test or a causal design. Descriptive group summaries alone do not establish statistical significance, causation, or population-level results.

**Corrected approach:** Describe the observed mean differences only, and state that the analysis is unweighted and non-causal. Avoid significance or causal claims unless an appropriate analysis supports them.


## AI-Use Check

AI-assisted suggestions were checked against the code, rendered output, dataset counts, and the course example. The exact prompt and verification comments used in the EDA note are recorded in `ai-use-note.md`.