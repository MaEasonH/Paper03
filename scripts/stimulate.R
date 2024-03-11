## stimulate

set.seed(1)
library(readr)

original_data <- read.csv('/cloud/project/police_race.csv')

gender_levels <- levels(factor(original_data$Gender_of_People_Involved))
race_levels <- levels(factor(original_data$Perceived_Race_of_People_Involv))

n <- nrow(original_data)

set.seed(2) 
simulated_data <- data.frame(
  Gender_of_People_Involved = sample(gender_levels, n, replace = TRUE),
  Perceived_Race_of_People_Involv = sample(race_levels, n, replace = TRUE),
  Incident_Count = sample(0:max(original_data$Incident_Count, na.rm = TRUE), n, replace = TRUE)
)
head(simulated_data)