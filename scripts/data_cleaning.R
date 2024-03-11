data <- read_csv("/cloud/project/police_race.csv") %>%
  drop_na(Incident_Count) %>%
  mutate(Gender_of_People_Involved = as.factor(Gender_of_People_Involved),
         Perceived_Race_of_People_Involv = as.factor(Perceived_Race_of_People_Involv))

data_sorted <- data[order(-data$Incident_Count), ]
top_10 <- head(data_sorted, 10)

data_selected <- select(top_10, Perceived_Race_of_People_Involv, Incident_Count)
data_selected$Incident_Count[is.na(data_selected$Incident_Count)] <- 0
data_reduced <- head(data_selected, 10)


data_grouped <- data %>%
  group_by(Perceived_Race_of_People_Involv) %>%
  summarise(Incident_Count = sum(Incident_Count, na.rm = TRUE))

print(data_grouped)
