library(dplyr)
#Importamos los datos 
Laliga <- read.csv("EstasdisticaLiga.csv")
#Seleccionamos las columnas que necesitamos
Smalldata<-select(Laliga,Date,HomeTeam,FTHG,AwayTeam,FTAG)
#renombramos las columnas
Smalldata<-rename(Smalldata,date=Date,home.team=HomeTeam,home.score=FTHG,away.team=AwayTeam,away.score=FTAG)
#Generamos el archivo
write.csv(Smalldata,file="Soccer.csv",row.names = F)
#instalacion de paquete
install.packages("fbRanks")
library(fbRanks)
read.csv("Soccer.csv")
#Con la función create.fbRanks.dataframes del paquete fbRanks importe el archivo soccer.csv a R y al mismo tiempo asignelo a una variable llamada listasoccer.
listasoccer<-create.fbRanks.dataframes("Soccer.csv") 
#Se creará una lista con los elementos scores y teams que son data frames listos para la función rank.teams. Asigna estos data frames a variables llamadas anotaciones y equipos.
anotaciones<-listasoccer$scores
equipos<-listasoccer$teams
#Con ayuda de la función unique crea un vector de fechas (fecha) que no se repitan y que correspondan a las fechas en las que se jugaron partidos.
fecha <- unique(anotaciones$date)
n <- length(fecha)
ranking<-rank.teams(anotaciones,equipos,min.date = fecha[1],max.date = fecha[n-1])

predict(ranking, date = fecha[n])
#2020-12-23 Leganes vs Sevilla, HW 22%, AW 50%, T 27%, pred score 0.8-1.4  actual: T (1-1)
#2020-12-23 Valencia vs Huesca, HW 57%, AW 20%, T 23%, pred score 1.8-1  actual: HW (2-1)
#2020-12-23 Vallecano vs Levante, HW 26%, AW 51%, T 22%, pred score 1.3-1.9  actual: HW (2-1)
