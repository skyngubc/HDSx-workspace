# AI-Use Note

## What AI helped with

Copilot helped me improve the dashboard presentation and documentation for Assignment 7. It helped clarify the chart caption, center the plot title, subtitle, and caption, bold the title and axis headings, regenerate the preview image, and revise the reproducibility note and this AI-use note. It did not change the analysis, data selection, filtering, or summary calculations; it was used for writing, formatting, and verification support only.

## Prompts used for recorded changes

1. **AI prompt:** “Make the chart caption clearer for a public-health analyst without changing the analysis.”

   **How I checked it:** I reviewed the caption against the code to confirm it describes the unweighted mean, dataset, age cohort, exclusions, and limitations without changing the calculation.

2. **AI prompt:** “For the preview of the dashboard, can you make sure that the captions and titles are centered in the middle? Might also be good to bold the title, x and y axis headings.”

   **How I checked it:** I rendered the dashboard and visually checked that the title, subtitle, and caption are centered, and that the title and both axis headings are bold.

3. **AI prompt:** “Please make sure the dashboard preview.png reflects these changes.”

   **How I checked it:** I regenerated `dashboard-preview.png` from the rendered HTML’s embedded plot and inspected the image to confirm it reflects the updated styling.

4. **AI prompt:** “Read the Assignment 7 instructions and `assignments/assignment07-dashboard/submission/dashboard.qmd`. Summarize the required 1-1-1-1-1 components and identify what I still need to complete. Do not edit the file yet.”

   **How I checked it:** I compared the summary with the assignment checklist and confirmed that it distinguished required deliverables from optional suggestions.


5. **AI prompt:** “Review the setup chunk in `dashboard.qmd`. Are the dataset path and column names consistent with the repository? Keep paths relative and explain any issue without using local-only files or credentials.”

   **How I checked it:** I confirmed the dataset was tracked at the stated repository-relative path and that the dashboard rendered from the repository root.

6. **AI prompt:** “Check whether `selected_income` is a valid, editable control for this static dashboard and whether the file explains how to change it. Suggest clear instructions without converting this assignment into a Shiny app.”

   **How I checked it:** I tested another valid income value, rendered again, and confirmed that the table and plot updated as expected.

7. **AI prompt:** “Explain what the current filter and grouped summary calculate. Check that the summary matches the audience question, and flag anything that would change the analysis before suggesting a change.”

    **How I checked it:** I compared the explanation with the actual filter, grouping, and summary code and independently checked a few output values.

8. **AI prompt:** “Review the chart in `dashboard.qmd` for readability and whether its title and axis labels explain what is plotted. Suggest presentation improvements without changing the data or statistic.”

    **How I checked it:** I rendered the chart and checked legibility, labels, and alignment; I confirmed that only presentation code changed.

9. **AI prompt:** “Draft a concise chart caption for a public-health analyst. It should state the unweighted mean, dataset, age cohort, exclusions, and limitations; do not imply survey-weighted estimates, national prevalence, or causation.”

    **How I checked it:** I checked every claim against the code and data preparation and ensured the caption did not overstate what the descriptive results support.

10. **AI prompt:** “Using only the pattern shown by the table and chart, suggest a plain-language interpretation and one limitation. Avoid causal explanations and do not claim more than these descriptive data support.”

    **How I checked it:** I compared the interpretation with the displayed values and ensured the limitation was reflected in or alongside the dashboard.

11. **AI prompt:** “Review the proposed dashboard output and preview for privacy concerns. Confirm that it shows aggregate summaries rather than row-level records, and flag any small-cell concern without exposing individual data.”

    **How I checked it:** I inspected the rendered page and screenshot to confirm that they contained no row-level records and that small groups were not interpreted as stable findings.

12. **AI prompt:** “Give me the repository-root Quarto command to render `dashboard.qmd` and a short checklist for testing it with another valid `selected_income` value. Tell me what should update and what to record if rendering fails.”

    **How I checked it:** I ran the command from the repository root, tested a second valid value, and recorded the actual result and any error in `testing-log.md`.
