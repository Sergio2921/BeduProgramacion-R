getwd()
setwd("D:/Downloads/Programacion-con-R-Santander-master (1)/Programacion-con-R-Santander-master/Sesion-01/Data")

#Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

datos.LaLiga<- read.csv("SP1.csv")
str(datos.LaLiga)

#goles anotados por local
datos.LaLiga$FTHG
#goles anotados por visitantes
datos.LaLiga$FTAG
#probabilidad de goles de  equipo que juegue de local 
local<-table(datos.LaLiga$FTHG)
round(prop.table(local)*100,3)

##probabilidad de goles de  equipo que juegue de visitante
visita<-table(datos.LaLiga$FTAG)
round(prop.table(visita)*100,3)

resultados <- data.frame(local=datos.LaLiga$FTHG,visita=datos.LaLiga$FTAG)
resultados
#probabilidad de que se de un resultado
F.resultados<-table(resultados)
round(prop.table(F.resultados)*100,3)
