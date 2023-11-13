library(dplyr)
library(ggplot2)
library(forcats)

# Read Dataset from remote source

df <- read.csv("https://query.data.world/s/6fhycjztl6c72mzpjrxfguca4xgufg?dws=00000",
               header=TRUE,
               stringsAsFactors=FALSE)


glimpse(df)
# data is not in long format
# save this as a dataset for exercising pivot_longer

fallcolor_wide <- df
usethis::use_data(fallcolor_wide)

# Pivot Longer
# by putting days columns in a a column for the
# respective variable "day".

fallcolor <- df |> tidyr::pivot_longer(cols = !c(Year, Species, Elevation),
                          names_to = "day",
                          names_prefix = "day",
                          values_to = "value") |>
  # snake case
  rename(year = Year,
         species = Species,
         elevation = Elevation) |>
  # make factors, specify whole names instead of abbreviations
  mutate(species = dplyr::case_when(species == "SM" ~ "Sugar Maple",
                                    species == "WB" ~ "White Birch",
                                    species == "YB" ~ "Yellow Birch",
                                    species == "RMS" ~ "Red Maple (F)",
                                    species == "WA" ~ "White Ash",
                                    species == "RMP" ~ "Red Maple (M)") |>
                   as.factor(),
         year = forcats::as_factor(year),
         elevation = forcats::as_factor(elevation)) |>
  # Only keep groups that have at least one non-zero value
  # it is not possible to have 0% leaf coloration during all autumn
  # so this should be NA. I decide to instead delete those only zero groups
  # because some other possible combinations of keys are also just
  # absent.
  filter(!(all(value == 0)),
         .by = c(year, species, elevation))

# save current version as .rda in /data
usethis::use_data(fallcolor, overwrite = TRUE)



# alternative, bulky code for removing groups with only 0:

# mutate(obsolete = case_when(all(value == 0) ~ rep(TRUE, n()),
#                          .default = FALSE),
#                          .by = c(year, species, elevation)) |>
# filter(obsolete == FALSE)

### Exploration

sum(is.na(fallcolor$value))

levels(fallcolor$species)
# alphabetically ordered because as.factor() was used

glimpse(fallcolor)




fallcolor |>
  #dplyr::filter(elevation == 1400) |>

ggplot() +
  geom_area(aes(y = value,
                x = day,
                group = year,
                fill = year),
            position = "identity",
            alpha = 0.7) +
  facet_wrap(elevation ~ species) +
  viridis::scale_fill_viridis(discrete = TRUE) +
  scale_y_continuous(labels = \(x) scales::percent(x, scale = 1)) +
  scale_x_discrete(breaks = c(250, 275, 300)) +
  theme_classic() +
  labs(y = "Herbstfärbung",
       x = "Tag",
       fill = "Jahr")

# Man kann sehen, dass die Herbstfärbung in jüngeren Jahren später eintritt (gelb)
# als in den 90ern (violett)


fallcolor |>
  #filter(year == 1994, species == "White Ash", elevation == 1400) |>
  group_by(year, elevation, species) |>
  summarise(maxday = paste(collapse = "-", range(day[value == max(value, na.rm = TRUE)])),
            NAs = sum(is.na(value))) |>
  arrange(desc(NAs)) |>
  print(n = 10)


fallcolor |>
 filter(year == 2018, elevation == 2600, species == "Yellow Birch") |>
  ggplot(aes(x = day,
             y = value,
             group = species,
             color = species)) +
  geom_jitter(alpha = 0.3) +
  viridis::scale_fill_viridis(discrete = T) +
  facet_wrap(~ year)

