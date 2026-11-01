# AI-Use Note

## What AI Helped With

Copilot assisted with drafting the R workflow for loading the cached NHANES CSV, defining the age 20–80 cohort, summarizing missingness, creating Table 1, and exporting it to CSV. It also helped organize the planted-error audit and draft the methods and stewardship language. I reviewed, checked, and revised all AI-generated output.

## Prompt and Verification Record

1. ### AI prompt
   **Load the committed NHANES snapshot using a project-relative path.**

   ### Verified
   **The file exists at that path when Quarto is rendered from the project root.**

2. ### AI prompt
   **Define the requested age 20–80 cohort, inclusive.**

   ### Verified
   **The cohort filter includes both age boundaries and drops records with missing age.**

3. ### AI prompt
   **Summarize missingness for the Table 1 variables in the eligible cohort.**

   ### Verified
   **Counts and percentages use the cohort size as the denominator.**

4. ### AI prompt
   **Create Table 1 by IncomeGroup with N and BMI/age mean (SD), then export it.**

   ### Verified
   **Each group uses records complete on Age, BMI, and IncomeGroup; SD is calculated with `sd()`, not variance.**

I rendered `eda-note.qmd` from the repository root and confirmed that it generated both `eda-note.html` and `table1.csv`. I checked the cohort and missingness counts against the data, confirmed that the exported group Ns sum to 50,851 complete records, and compared the group counts and BMI means with the Week 7 course example. The render completed without errors. I also reviewed the prose to ensure it remained descriptive, unweighted, and non-causal.