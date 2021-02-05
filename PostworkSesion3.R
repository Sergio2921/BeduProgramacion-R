LaLiga <- read.csv("EstasdisticaLiga.csv")
#goles anotados por local
LaLiga$FTHG
#goles anotados por visitantes
LaLiga$FTAG
#probabilidad de goles de  equipo que juegue de local 
local<-table(LaLiga$FTHG)
round(prop.table(local)*100,3)
visita<-table(LaLiga$FTAG)
local
round(prop.table(visita)*100,3)
resultados

resultados <- data.frame(local=LaLiga$FTHG,visita=LaLiga$FTAG)
F.resultados<-table(resultados)
round(prop.table(F.resultados)*100,3)
ResultadoshEAT<-as.data.frame(round(prop.table(F.resultados)*100,3))
ResultadoshEAT
#grafico de barra de probabilidad marginal
barplot(prop.table(table(LaLiga$FTHG)))
#grafico de barra de probabilidad marginal
barplot(prop.table(table(LaLiga$FTAG)))
hist(LaLiga)
#Grafica heatMap
ggplot(ResultadoshEAT, aes(x = local, y = visita,fill=Freq)) + geom_tile()
