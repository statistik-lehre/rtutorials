library(dplyr)
library(readr)

einkaufen <- read_csv("data-raw/einkaufen/einkaufen.csv",
                      col_types = cols(...1 = col_skip()))

# rearrange columns

einkaufen <- einkaufen |>
  select(Essen, Verkehrsmittel, Weg, Alter, Kochen, Frequenz, Ort, Bioladen, Befragung, ID,
         Datum, Uhrzeit)

# convert column names to snake_case
colnames(einkaufen) <- tolower(colnames(einkaufen))

# convert some columns to factors

einkaufen |>
  mutate(across(c(essen, verkehrsmittel, frequenz, befragung, ort), forcats::as_factor))

usethis::use_data(einkaufen, overwrite = TRUE, version = 3)
