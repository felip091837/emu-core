#!/usr/bin/env Rscript

#SEED=$(( ( RANDOM % 10000 )  + 1 ))
# media com Udp
x<-read.table("/home/cicero/core-ddos/R/mtf.csv", sep=",", h=T)
# media com 1 node
m1u<- x$mudp[8]
m1h<- x$mhttp[12]

# media com 5 node
m5u<- x$mudp[9]
m5h<- x$mhttp[3]

# media com 8 node
m8u<- x$mudp[5]
m8h<- x$mhttp[2]

# sd com 1 node
s1u<- x$sdu[8]
s1h<- x$sdh[12]

# sd com 5 node
s5u<- x$sdu[9]
s5h<- x$sdh[3]

# sd com 8 node
s8u<- x$sdu[5]
s8h<- x$sdh[2]

# confiança de 95% 
transfz <- 1.96

# limit udp com 1 node
iu<- x$interval[8] # tamanho da amostra
udpn<- iu - transfz*s1u/sqrt(length(iu))
udpp<- iu + transfz*s1u/sqrt(length(iu))

# limit http com 1 node
ih<- x$interval[12]
httpn<- ih - transfz*s1h/sqrt(length(ih))
httpp<- ih + transfz*s1h/sqrt(length(ih))

#-------------------------------------------------------------------------------------
# plot gráfico
# udp blue
png("mtf.png", width = 620, height = 620)
matplot(m1u, iu, col="blue",pch=15,ylab="Tempo (s)", xlab="Número de Atacantes", main="Intervalo de Confiança do Tempo Médio Até a Falha do Servidor",ylim=c(10, 400),xlim=c(1,10))

# http green
points(m1h, ih, col="green", pch=15)

arrows(c(1,1),c(x$interval[8],x$interval[8]),c(1,1),c(udpn+5,udpp-5),col="blue",angle=90)
arrows(c(1,1),c(x$interval[12],x$interval[12]),c(1,1),c(httpn+5,httpp-5),col="green",angle=90)
#--------------------------------------------------------------------------------------

# limit udp com 5 node
iu<- x$interval[9] # tamanho da amostra
udpn<- iu - transfz*s5u/sqrt(length(iu))
udpp<- iu + transfz*s5u/sqrt(length(iu))

# limit http com 5 node
ih<- x$interval[3]
httpn<- ih - transfz*s5h/sqrt(length(ih))
httpp<- ih + transfz*s5h/sqrt(length(ih))

# udp blue
points(m5u, iu, col="blue", pch=15)

# http green
points(m5h, ih, col="green", pch=15)

arrows(c(5,5),c(x$interval[9],x$interval[9]),c(5,5),c(udpn+1,udpp-5),col="blue",angle=90)
arrows(c(5,5),c(x$interval[3],x$interval[3]),c(5,5),c(httpn+8,httpp-5),col="green",angle=90)
#--------------------------------------------------------------------------------------

# limit udp com 8 node
iu<- x$interval[5] # tamanho da amostra
udpn<- iu - transfz*s8u/sqrt(length(iu))
udpp<- iu + transfz*s8u/sqrt(length(iu))

# limit http com 8 node
ih<- x$interval[2]
httpn<- ih - transfz*s8h/sqrt(length(ih))
httpp<- ih + transfz*s8h/sqrt(length(ih))

# udp blue
points(m8u, iu, col="blue", pch=15)

# http green
points(m8h, ih, col="green", pch=15)

arrows(c(8,8),c(x$interval[5],x$interval[5]),c(8,8),c(udpn+5,udpp-1),col="blue",angle=90)
arrows(c(8,8),c(x$interval[2],x$interval[2]),c(8,8),c(httpn+5,httpp-8),col="green",angle=90)
#-------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------
# udp 8954
lines(c(1,5,8,16),c(x$interval[8], x$interval[9], x$interval[5], x$interval[4]), col="blue", lty=2)
# http 12321
lines(c(1,5,8,16),c(x$interval[12], x$interval[3], x$interval[2], x$interval[1]), col="green", lty=2)

#arrows(c(1,1),c(x$interval[8],x$interval[8]),c(1,1),c(udpn,udpp),col="blue",angle=90)

dev.off()


