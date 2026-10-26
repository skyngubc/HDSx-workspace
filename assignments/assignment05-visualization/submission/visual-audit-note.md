# Visual Audit Note

## Flawed Starter: Claim and Actual Comparison

**Flawed starter:** Its title claims, “Low income drives rising obesity in
American adults.” The code actually summarizes mean BMI by income group for
only the first and last NHANES cycles, without filtering to ages 20-80. The
causal title and all-cycle subtitle do not match that analysis.

## Issues Checked

**Issue:** The y-axis is restricted to 24–28.  
**Category:** Design / Interpretation  
**Why it matters:** A narrow y-axis can make small differences between group means appear larger than they are. It can also hide values outside the displayed range.  
**Correction:** The corrected plot starts the y-axis at 20 kg/m² to focus on the range containing the group means. This is a truncated scale, so the differences may look larger than they would with a zero baseline; the caption discloses the lower limit and readers should interpret the differences cautiously.

**Issue:** The title implies that low income causes obesity to rise.  
**Category:** Interpretation  
**Why it matters:** The title says low income “drives” rising obesity, which suggests a causal relationship. But the plot is descriptive, shows mean BMI rather than obesity rates, and does not establish that income caused any difference.  
**Correction:** Use a descriptive title that names the measure and comparison without implying causation—for example, “Mean BMI by income group in the first and last NHANES cycles.”

**Issue:** The legend gives numerical boundaries for high- and low-income groups but not for the middle-income group.  
**Category:** Design  
**Why it matters:** Readers may not know which income values belong to the middle group.  
**Correction:** Add the middle-income boundaries to the legend, using the dataset’s exact definition—for example, “Middle Income (1.3–3.5)” if those are the correct boundaries.

**Issue:** The subtitle says the plot is about adults ages 20–80, but the code does not filter by age.  
**Category:** Correctness  
**Why it matters:** The plot includes records outside the stated age range, so readers could misunderstand which population the results describe.  
**Correction:** Filter the data to ages 20–80 before summarizing, and exclude records with missing age if appropriate. Alternatively, remove the age claim.

**Issue:** The y-axis says “BMI” but does not give the units or say that the plotted values are means.  
**Category:** Design / Interpretation  
**Why it matters:** Without the units and statistic, readers may be unsure how to interpret the values or may mistake group means for individual BMI values.  
**Correction:** Label the y-axis “Mean BMI (kg/m²)” and clarify in the caption what records were included and how the means were calculated.

**Issue:** The subtitle says BMI climbed across every NHANES cycle, but the plot includes only the first and last cycles.  
**Category:** Correctness / Interpretation  
**Why it matters:** Readers may think intermediate cycles were included and that BMI rose steadily across them, which the plotted data do not show.  
**Correction:** Either summarize and plot all cycles before making an all-cycle claim, or revise the subtitle to say the plot compares only the first and last cycles.

