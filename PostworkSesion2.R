setwd("D:/Downloads/Programacion-con-R-Santander-master (1)/Programacion-con-R-Santander-master/Sesion-02/Postwork/Data")
url1<-"https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
url2<-"https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
url3<-"https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
library("dplyr")
download.file(url=url1,destfile = "liga1718.csv",mode="wb")
download.file(url=url2,destfile = "liga1819.csv",mode="wb")
download.file(url=url3,destfile = "liga1920.csv",mode="wb")

dir()
lista<-lapply(dir(),read.csv)
lista
str(lista[1])
head(lista[1])
View(lista[1])
class(lista[1])
summary(lista[1])
str(lista[2])
head(lista[2])
View(lista[2])
summary(lista[2])
str(lista[3])
head(lista[3])
View(lista[3])
summary(lista[3])
dir()
ligas<-lapply(lista,select,Date:FTR)
ligas[[3]]$Time<-NULL
data<- do.call(rbind,ligas)

data2<-mutate(data,Date = as.Date(Date,format= "%d/%m/%y"))
str(data) 
write.csv(data2,file="EstasdisticaLiga.csv")
