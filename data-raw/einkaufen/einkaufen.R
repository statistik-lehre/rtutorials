library(dplyr)
library(readr)

einkaufen <- read_csv("data-raw/einkaufen/einkaufen.csv",
                      col_types = cols(...1 = col_skip()))

# rearrange columns

einkaufen <- einkaufen |>
  select(Essen, Verkehrsmittel, Weg, Alter, Kochen, Frequenz, Befragung, ID, Ort,
         Datum, Uhrzeit, Bioladen)

usethis::use_data(einkaufen, overwrite = TRUE, version = 3)
