concrete <- read_excel("data-raw/Concrete_Data.xls")
library(dplyr)
concrete <- concrete |> rename(cement = `Cement (component 1)(kg in a m^3 mixture)`,
                   flyash =`Fly Ash (component 3)(kg in a m^3 mixture)`,
                   slag = `Blast Furnace Slag (component 2)(kg in a m^3 mixture)`,
                   water = `Water  (component 4)(kg in a m^3 mixture)`,
                   superplasticizer = `Superplasticizer (component 5)(kg in a m^3 mixture)`,
                   coarse_aggregate =`Coarse Aggregate  (component 6)(kg in a m^3 mixture)`,
                   fine_aggregate = `Fine Aggregate (component 7)(kg in a m^3 mixture)`,
                   age_days = `Age (day)`,
                   compressive_strength = `Concrete compressive strength(MPa, megapascals)`)

plot(concrete$compressive_strength, concrete$cement)

lm(compressive_strength ~ cement + age_days + superplasticizer + water, data = concrete) |> summary()

corrplot::corrplot(cor(concrete))

save(concrete, file = "./data/concrete.rda")
