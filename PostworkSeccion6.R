datos<-read.csv("match.data.csv")

datos<-mutate(datos,suma=home.score+away.score,
                   date=as.Date(date,"%Y-%m-%d"),
                   mes_año=paste(as.character(format(as.Date(date,"%Y-%m-%d"),"%Y") ),
                                 as.character(format(as.Date(date,"%Y-%m-%d"),"%m"))))
w<-datos %>% group_by(mes_año) %>% summarise(PromGol=mean(suma))
as.data.frame(w)
ts.PromGol<-ts(as.data.frame(w)$PromGol,start=c(2010,08),frequency=12)
plot(ts.totales)