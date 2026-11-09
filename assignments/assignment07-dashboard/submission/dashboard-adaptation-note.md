# Dashboard Adaptation Note

## Audience

A public-health analyst preparing a short briefing on descriptive BMI patterns in the classroom NHANES Health Equity dataset.

## Dashboard Question

Among adults age 20-80, how does mean BMI vary across NHANES cycles for one
selected income group?

## Control And Visualization

- **Control:** Edit `selected_income` to choose an income group, then re-render.
- **Visualization:** A line plot of mean BMI by NHANES cycle, alongside a
  summary table.
- **What changes:** The table, chart title, and plotted values update for the selected group.

## Element Changed

The chart caption was revised to explain the plotted statistic, dataset and
cohort, exclusions, and limits of interpretation. The chart presentation was
also adjusted: the title, subtitle, and caption are centered, and the plot title and axis headings are bold. The selected-income default is set to "Middle Income." The audience question and summary calculations are unchanged.

## Knowledge-Translation (KT) Rationale

For a public-health analyst preparing a briefing, the revised caption and clearer visual hierarchy make the chart easier to communicate and interpret. Naming the unweighted mean, population, exclusions, and limits helps the audience understand it as a descriptive classroom summary, not a national estimate or evidence of causation. The changes affect the displayed group and chart presentation, not the filtering, grouping, or summary calculations.

## Test Result

See `testing-log.md` for the two rendered control values and results.

## Limitation

The dashboard is unweighted and descriptive; it does not account for NHANES
survey design, estimate national prevalence, or support causal claims about
income and BMI.

## Privacy Check

The dashboard uses aggregate summaries, and the submitted preview shows only the aggregate chart; no small cells are interpreted and no causal or
population-level claims are made. No row-level records were included in the
preview or shared with an external AI tool.
