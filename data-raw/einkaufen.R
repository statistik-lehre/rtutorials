library(rtutorials)
library(dplyr)

# rearrange columns

einkaufen <- einkaufen |>
  select(Essen, Verkehrsmittel, Weg, Alter, Kochen, Frequenz, Befragung, ID, Ort,
         Datum, Uhrzeit, Bioladen)

usethis::use_data(einkaufen, overwrite = TRUE)
