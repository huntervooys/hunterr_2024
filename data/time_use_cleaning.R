# data from OECD: https://stats.oecd.org/Index.aspx?DataSetCode=TIME_USE
time_use <- read_csv("data/time_use.csv") |>
  # all 15-64 years old
  select(-Age, -AGE) |>
  # all latest year
  select(-T, -Time) |>
  select(-LOCATION, -DESC, - SEX, -`Flag Codes`, -Flags) |>
  janitor::clean_names()

summary(time_use)

time_use <- time_use |>
  pivot_wider(names_from = sex,
              values_from = value) |>
  mutate(women_to_men = Women / Men) |>
  select(-Women, -Men) |>
  rename(time_spent = Total,
         activity = description)

# continents data are from Our World in Data: https://ourworldindata.org/grapher/continents-according-to-our-world-in-data
continents <- read_csv("data/continents-according-to-our-world-in-data.csv")

# are there any countries in the time_use data that are not in the continents data?
time_use %>%
  anti_join(continents, by = c("country" = "Entity")) %>%
  select(country) %>%
  distinct()

# China - in time_use as China (People's Republic of)
# Turkey - in time_use as Türkiye
# South Korea - in time_use as Korea
time_use_cntrys <- time_use$country |> unique()
continents_cntrys <- continents$Entity |> unique()

"Korea" %in% time_use_cntrys
"Korea" %in% continents_cntrys

time_use_cntrys |>
  setdiff(continents_cntrys)

time_use <- time_use |>
  mutate(country = case_when(
    country == "China (People's Republic of)" ~ "China",
    country == "Türkiye" ~ "Turkey",
    country == "Korea" ~ "South Korea",
    TRUE ~ country
  )) |>
  left_join(continents, by = c("country" = "Entity")) |>
  select(-Code, -Year) |>
  rename(continent = Continent)

write_csv(time_use, "data/time_use_cleaned.csv")
