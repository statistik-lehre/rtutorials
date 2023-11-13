df <- read.csv("https://query.data.world/s/6fhycjztl6c72mzpjrxfguca4xgufg?dws=00000",
               header=TRUE,
               stringsAsFactors=FALSE)


glimpse(df)
# data is not in long format
# making it longer by putting days columns in a a column for the
# respective variable "day".

fallcolor_wide <- df

fallcolor <- df |> tidyr::pivot_longer(cols = !c(Year, Species, Elevation),
                          names_to = "day",
                          names_prefix = "day",
                          values_to = "value") |>
  rename(year = Year,
         species = Species,
         elevation = Elevation) |>
  mutate(species = dplyr::case_when(species == "SM" ~ "Sugar Maple",
                                    species == "WB" ~ "White Birch",
                                    species == "YB" ~ "Yellow Birch",
                                    species == "RMS" ~ "Female Red Maple",
                                    species == "WA" ~ "White Ash",
                                    species == "RMP" ~ "Male Red Maple")) |>
  mutate(year = forcats::as_factor(year),
         species = forcats::as_factor(species),
         elevation = forcats::as_factor(elevation))

fallcolor$species

usethis::use_data(fallcolor)

levels(fallcolor$species)

library(ggplot2)
library(forcats)
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

new_fallcolor <- fallcolor |>
  group_by(year, species, elevation) |>
  mutate(value = dplyr::case_match(rep(0, 65) ~ NA)) |>
  arrange(desc(value)) |>
           print(n = 20)

unique(new_fallcolor$value)

new_fallcolor |>
  #filter(year == 1994, species == "White Ash", elevation == 1400) |>
  group_by(year, elevation, species) |>
  summarise(maxday = paste(collapse = "-", range(day[value == max(value, na.rm = TRUE)])),
            NAs = sum(is.na(value)),
            zeros = sum(value == 0)) |>
  #filter(zeros == 65) |>
  arrange(desc(NAs)) |>
  print(n = 100)


fallcolor |>
 filter(year == 2018, elevation == 2600, species == "Yellow Birch") |>
 print(n = 65)

  ggplot(aes(x = day,
             y = value,
             group = species,
             color = species)) +
  geom_jitter(alpha = 0.3) +
  viridis::scale_fill_viridis(discrete = T) +
  facet_wrap(~ year)

fallcolor |>
  filter(year == 1994, species == "White Ash", elevation == 1400) |>
  summarise(max = max(value))

# example data for SO
df <- data.frame(id = rep(1:2, each = 4),
                 value = c(0, 0, 0, 0, 10, 20, 10, 0))


