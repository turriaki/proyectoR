library(nycflights13)
library(tidyverse)
library(forcats)


#FILTRO CARRIERS CON MAS DE 1000 VUELOS (filtro general del programa)
df_m <- group_by(flights, carrier) %>%
  mutate(n_vuelos = n()) %>%
  filter(n_vuelos >= 1000) %>% 
  ungroup()

#-----------------------SELECCION EMPRESA CHICA INICIO----------------------------#
#FILTRO CON CARACTERISTICAS DE UNA EMPRESA PEQUEÑA COMO POCOS N VUELOS, DISTANCIA CORTA ETC.
df_pe<-df_m %>% 
  group_by(carrier) %>% 
  filter(n_vuelos >= 1000 & n_vuelos <=4000 & distance<=1500)
view(df_pe)
#VEO CUAL DE ESOS CARRIERS TIENEN MENOS TIEMPO DE DELAY DE SALIDA
less_delay<-df_pe%>% 
  group_by(carrier) %>% 
  #filter(dep_delay <=1 & dep_delay >=-1) %>% 
  filter(dep_delay==0) %>% 
  summarize(num_delay=n()) %>% 
  filter(num_delay==min(num_delay)) %>% 
  select(carrier, num_delay)
view(less_delay)


#VEMOS QUE LA QUE TIENE MENOS TIEMPO DE DELAY ES FL (PODEMOS ELIGIRLA COMO EMPRESA CHICA YA QUE TIENE MUY 
#POCOS VUELOS COMPARADO CON LAS OTRAS)
#-----------------------SELECCION EMPRESA CHICA FIN ----------------------------#

#VEMOS A QUE DESTINOS VA ESA AEROLINEA
df_pe_dest <-df_pe %>%
  summarize(unique(dest))
view(df_pe_dest)

#ATL, MKE, CAK son los 3 destinos con esos filtros donde va la aerolinea
#ATL tiene muchos vuelos (por lo tanto mucha competencia tambien)



















#df_m <- group_by(flights, carrier) %>%
 # mutate(n_vuelos = n()) %>%
  #filter(n_vuelos > 1000) %>%
  #ungroup()
#df_mi <- group_by(df_m, dest) %>%
 # mutate(n_vuelos = n()) %>%
  #filter(n_vuelos > 1000) 
#  filter(carrier=="UA")

#df_mi

#ggplot(df_mi) + geom_bar(mapping = aes(x = dest))

#df_destinos <- group_by(df_mi, dest)

#ggplot(df_destinos) + geom_bar(mapping = aes(x = fct_rev(fct_infreq(dest))))
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
