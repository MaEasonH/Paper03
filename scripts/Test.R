library(readr)
library(ggplot2)
# 1. summary
data <- read_csv("/cloud/project/police_race.csv")
summary(data)

# 2. ggplot
ggplot(data, aes(x = Perceived_Race_of_People_Involv, y = Incident_Count, fill = Perceived_Race_of_People_Involv)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Number of Incidents by Perceived Race",
       x = "Perceived Race",
       y = "Incident Count",
       fill = "Race") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# 3. Effect
data$Perceived_Race_of_People_Involv <- as.factor(data$Perceived_Race_of_People_Involv)
result <- aov(Incident_Count ~ Perceived_Race_of_People_Involv, data = data)
summary(result)

# 4. Linear Regression Analysis
data$Perceived_Race_of_People_Involv <- as.factor(data$Perceived_Race_of_People_Involv)
model <- lm(Incident_Count ~ Perceived_Race_of_People_Involv, data = data)
summary(model)


# 5. Model Diagnostics
aggregate_data <- aggregate(Incident_Count ~ Perceived_Race_of_People_Involv, data = data, FUN = mean, na.rm = TRUE)
par(mfrow = c(1, 1))
plot(aggregate_data$Perceived_Race_of_People_Involv, aggregate_data$Incident_Count, 
     type = 'b', # Type 'b' for both points and lines
     xlab = "Perceived Race of People Involved", ylab = "Average Incident Count",
     main = "Average Incident Count by Perceived Race",
     las = 2)
