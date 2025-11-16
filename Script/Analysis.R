# # Install libraries
# install.packages("here")
# install.packages("tidyverse")
# install.packages("svglite")

# Import libraries
library(here)
library(tidyverse)
library(svglite)

# Import data
df <- read.csv(here("Data", "butterflies.csv"))

# Convert to tibble
data <- as_tibble(df)

# Select relevant data
data <- data %>% select(LarvalHost, MaternalHost, AdultWeight, GrowthRate)

# Fit linear models and perform ANOVA
m_gr <- lm(data$GrowthRate ~ data$LarvalHost * data$MaternalHost - 1)
m_aw <- lm(data$AdultWeight ~ data$LarvalHost * data$MaternalHost - 1)
anova_gr <- anova(m_gr)
anova_aw <- anova(m_aw)

# Save ANOVA output to csv
write.csv(anova_aw, here("Output", "anova_aw.csv"))
write.csv(anova_gr, here("Output", "anova_gr.csv"))

# Pivot data along responses to help with plotting facets
data_p <- data %>%
  pivot_longer(
    cols = GrowthRate:AdultWeight, names_to = "Response", values_to = "Value"
  )

# Create dataframe data_summary to contain means of boxes in plot and save
data_summary <- data_p %>%
  group_by(LarvalHost, MaternalHost, Response) %>%
  summarize(mean_response_value = mean(Value))
write.csv(data_summary, here("Output", "data_summary.csv"))

# Create custom labels for the plot facets
response.labs <- c("Growth Rate (mg/day)", "Adult Weight (mg)")
names(response.labs) <- c("GrowthRate", "AdultWeight")

# Plot and save
data_p %>%
  ggplot(aes(
    x = factor(MaternalHost, level = c("Barbarea", "Berteroa")), y = Value,
    fill = LarvalHost
  )) +
  geom_boxplot() +
  labs(x = "Maternal Host", y = NULL, fill = "Larval Host") +
  facet_wrap(
    facets = vars(Response), nrow = 2,
    strip.position = "left",  # Move facet labels left to act as y-axis labels
    scales = "free_y", labeller = labeller(Response = response.labs)
  ) +
  theme(
    strip.background = element_blank(),  # Clear background behind facet labels
    strip.placement = "outside"  # Place labels outside of axis ticks
  )
ggsave(here("Output", "Fig1.svg"), width = 1100, height = 1100, units = "px")