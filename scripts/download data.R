## download data

if(!require(opendatatoronto)){install.packages('opendatatoronto', dependencies = TRUE)}
library(opendatatoronto)


packagedata <- search_packages("race")
toronto_gender <-
  list_package_resources("police-race-and-identity-based-data-use-of-force") |>
  filter(name == 
           "Gender Composition") |>
  get_resource()
write_csv(
  x = toronto_gender,
  file = "police_race.csv"
)
head(toronto_gender)
