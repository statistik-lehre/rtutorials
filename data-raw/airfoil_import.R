airfoil <- read.table("data-raw/airfoil_self_noise.dat")
library(dplyr)
airfoil <- airfoil |> rename(frequency = V1,
                  angle = V2,
                  chord_length = V3,
                  velocity = V4,
                  displacement_thickness = V5,
                  sound_pressure_scaled = V6)

# source https://archive.ics.uci.edu/dataset/291/airfoil+self+noise

lm(data = airfoil, sound_pressure_scaled ~ velocity) |> summary()

corrplot::corrplot(cor(airfoil))

save(airfoil, file = "./data/airfoil.rda")
