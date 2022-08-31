library(nycflights13)
library(tidyverse)
library(forcats)
flights
df_m <- group_by(flights, carrier) %>%
  mutate(n_vuelos = n()) %>%
  filter(n_vuelos > 1000) %>%
  ungroup()
df_mi <- group_by(df_m, dest) %>%
  mutate(n_vuelos = n()) %>%
  filter(n_vuelos > 1000) 
#  filter(carrier=="UA")

df_mi

ggplot(df_mi) + geom_bar(mapping = aes(x = dest))

df_destinos <- group_by(df_mi, dest)

ggplot(df_destinos) + geom_bar(mapping = aes(x = fct_rev(fct_infreq(dest))))
# 
# destinos <- df_m$dest
# df
# dest_ordenados <- fct_rev(fct_infreq(destinos))
# destinos <- unique(destinos)
# 
# 
# 
# destinos <- max(destinos)
# ggplot(df_m) + geom_bar(mapping = aes(x = dest_ordenados))
