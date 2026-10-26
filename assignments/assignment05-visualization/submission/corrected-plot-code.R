library(readr)
library(dplyr)
library(ggplot2)

candidate_paths <- c(
  "examples/nhanes-equity/data/nhanes_equity_v6.csv",
  "../../examples/nhanes-equity/data/nhanes_equity_v6.csv",
  "../../../examples/nhanes-equity/data/nhanes_equity_v6.csv"
)

data_path <- candidate_paths[file.exists(candidate_paths)][1]
if (is.na(data_path)) {
  stop("Could not find nhanes_equity_v6.csv")
}

output_path <- file.path(dirname(data_path), "../../../assignments/assignment05-visualization/submission")
if (!dir.exists(output_path)) {
  output_path <- "."
}

nhanes <- read_csv(data_path, show_col_types = FALSE)

income_levels <- c(
  "Low Income (<1.3)",
  "Middle Income",
  "High Income (>3.5)"
)
income_labels <- c(
  "Low Income (<1.3)",
  "Middle Income (1.3-3.5)",
  "High Income (>3.5)"
)
cycle_levels <- unique(nhanes$Cycle)

corrected_summary <- nhanes |>
  filter(
    !is.na(Age),
    Age >= 20,
    Age <= 80,
    !is.na(BMI),
    !is.na(IncomeGroup)
  ) |>
  mutate(
    Cycle = factor(Cycle, levels = cycle_levels),
    IncomeGroup = factor(IncomeGroup, levels = income_levels, labels = income_labels)
  ) |>
  group_by(Cycle, IncomeGroup, .drop = TRUE) |>
  summarise(
    mean_bmi = mean(BMI),
    n = n(),
    .groups = "drop"
  )

corrected_plot <- ggplot(
  corrected_summary,
  aes(x = Cycle, y = mean_bmi, color = IncomeGroup, group = IncomeGroup)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  scale_color_manual(
    values = c(
      "Low Income (<1.3)" = "#0072B2",
      "Middle Income (1.3-3.5)" = "#D55E00",
      "High Income (>3.5)" = "#009E73"
    ),
    drop = FALSE
  ) +
  scale_y_continuous(
    limits = c(20, NA),
    breaks = seq(20, 35, by = 5),
    expand = expansion(mult = c(0, 0.04))
  ) +
  labs(
    title = "Mean BMI by income group among adults aged 20-80",
    subtitle = "Unweighted group means across NHANES cycles",
    x = "NHANES cycle",
    y = "Mean BMI (kg/m²)",
    color = "Income group",
    caption = paste(
      "Source: prepared NHANES Health Equity classroom dataset.",
      "Includes ages 20-80; excludes records missing age, BMI, or income group.",
      "Y-axis begins at 20 kg/m²; this truncated scale can visually emphasize differences.",
      "Descriptive and unweighted; not causal or a population estimate.",
      sep = "\n"
    )
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "#4D5358"),
    axis.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.caption = element_text(hjust = 0, margin = margin(t = 8)),
    legend.position = "bottom"
  )

print(corrected_plot)

ggsave(
  file.path(output_path, "corrected-plot.png"),
  corrected_plot,
  width = 10,
  height = 6.5,
  dpi = 300
)
