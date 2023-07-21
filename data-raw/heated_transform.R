
## smol recent data set
heated <- read.csv("https://raw.githubusercontent.com/nychealth/EHDP-data/production/key-topics/heat-syndrome/edheat2023_live.csv")

heated <- heated |> dplyr::rename("maxtemp" = "MAX_DAILY_TEMP", "enddate" = "END_DATE",
              "edvisits" = "HEAT_ED_VISIT_COUNT")

lm(edvisits ~ maxtemp, data = heated) -> fit
lm(edvisits ~ scale(maxtemp, scale = F), data = heated) -> fit2
plot(scale(heated$maxtemp, scale = F), heated$edvisits)
abline(fit2)
summary(fit2)
# non linearity is showing already
#
##########################################
# whole data set data since 2017:

heated <- read.csv("https://static.dwcdn.net/data/ECKxz.csv")
heated <- heated |> dplyr::rename("maxtemp" = "MAX_DAILY_TEMP", "enddate" = "END_DATE",
                                  "edvisits" = "HEAT_ED_VISIT_COUNT") |>
  dplyr::mutate(enddate = lubridate::as_date(enddate),
                wday = lubridate::wday(enddate)
)

class(heated$enddate)

lubridate::wday(heated$enddate)

# Non linearity is showing clearly :/

lm(edvisits ~ maxtemp, data = heated) -> fit
summary(fit)
plot(heated$maxtemp, heated$edvisits)
abline(fit)

library(ggplot2)

ggplot(heated) +
  geom_col(aes(x = wday, y = edvisits))

## save
##
save(heated, file = "./data/heated.rda")

