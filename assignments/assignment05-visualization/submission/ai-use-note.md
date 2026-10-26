# AI-Use Note


## Audit Trail

### Prompt 1: Data summary

**AI prompt:** Draft a `ggplot2` comparison of mean BMI by gender for adults ages 20-80, excluding rows missing age, BMI, or gender, using the classroom CSV.

**How I checked it:** I confirmed that the CSV contains `Age`, `BMI`, and `Gender`, and that the observed gender values are Female and Male. I checked the filtered group counts and mean BMI with a separate R summary, then compared them with the rendered Quarto report: Female, n = 29,303 and mean BMI = 29.6; Male, n = 26,825 and mean BMI = 28.6.

### Prompt 2: Plot design and refinements

**AI prompt:** Make a clear descriptive bar chart of summarized mean BMI by gender, with an explanatory title, concise takeaway subtitle, labeled axes, group counts, source and exclusion context, limitations, and a zero baseline.

**Additional refinement requests:** Center and bold the explanatory title; bold both axis titles; use muted pink and blue for the gender groups; and add a concise takeaway subtitle with clear spacing.

**How I checked it:** I rendered `visualization-audit.qmd` and visually
inspected the plot. The plotted means and counts match the checked summary; the title, takeaway, axis labels, zero baseline, and caption are visible and readable. 

### Prompt 3: Visual audit of the flawed starter

**AI prompt:** Render the supplied flawed plot code so I can inspect the
visualization, then help identify issues in the plot and its claims.

**How I checked it:** I viewed the rendered plot and compared its title,
subtitle, axes, legend, and displayed NHANES cycles with the starter code. This
helped identify that the plot shows only the first and last cycles, does not
filter to the age range stated in the subtitle, uses a restricted y-axis, and
makes causal and trend claims that are not supported by the displayed
descriptive mean-BMI summaries. I reviewed and refined the audit issues and
corrections before adding them to the visual audit note.

### Prompt 4: Corrected plot code and image

**AI prompt:** Use the audit findings to create corrected R code that compares
mean BMI by income group across NHANES cycles for adults ages 20-80, with
appropriate filtering, a y-axis starting at 20, clear labels, and descriptive
context that discloses the truncated scale, then save the plot as a PNG.

**How I checked it:** I reviewed
`corrected-plot-code.R` to confirm that it filters to ages 20-80, excludes
records missing the variables used in the comparison, summarizes mean BMI by
cycle and income group, and saves `corrected-plot.png`. I inspected the
exported PNG to confirm that it displays the cycles and income-group labels,
the y-axis starting at 20, and the source and limitation caption, including a
warning that the truncated scale can visually emphasize differences.