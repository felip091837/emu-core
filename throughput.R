# UDP MEDIA
x<-read.table("/home/cicero/core-ddos2/R/vazao.csv", sep=",", h=T)
# media com 1 atacante
m1u<- x$udp[1]
m1h<- x$http[1]

# media com 5 atacantes
m5u<- x$udp[2]
m5h<- x$http[2]

# media com 8 atacantes
m8u<- x$udp[3]
m8h<- x$http[3]

# sd com 1 atacante
s1u<- x$sdu[1]
s1h<- x$sdh[1]

# sd com 5 atacantes
s5u<- x$sdu[2]
s5h<- x$sdh[2]

# sd com 8 atacantes
s8u<- x$sdu[3]
s8h<- x$sdh[3]

# confiança 95% 
tz <- 1.96

# limit udp com 1 atacante
iu<- x$amostra[1] # tamanho da amostra
udpn<- m1u - tz*s1u/sqrt(length(iu))
udpp<- m1u + tz*s1u/sqrt(length(iu))

# limit http com 1 atacante
ih<- x$amostra[1]
httpn<- m1h - tz*s1h/sqrt(length(ih))
httpp<- m1h + tz*s1h/sqrt(length(ih))

#-------------------------------------------------------------------------------------
# plot gráfico
# UDP AZUL
png("vazao.png", width = 620, height = 620)
matplot(x$nodes[1], m1u, col="blue",pch=15,ylab="Throughput (Mbps)", xlab="Número de Atacantes", main="Throughput (Mbps) em função do número\n de Atacantes",ylim=c(0, 10.0),xlim=c(1,10.0))

# http VERDE
points(x$nodes[1], m1h, col="green", pch=15)

arrows(c(1,1),c(m1u,m1u),c(1,1),c(udpn,udpp),col="blue",angle=90)
arrows(c(1,1),c(m1h,m1h),c(1,1),c(httpn,httpp),col="green",angle=90)

#--------------------------------------------------------------------------------------

# limit udp com 5 atacantes
iu<- x$amostra[2] # tamanho da amostra
udpn<- m5u - tz*s5u/sqrt(length(iu))
udpp<- m5u + tz*s5u/sqrt(length(iu))

# limit http com 5 atacantes
ih<- x$amostra[2]
httpn<- m5h - tz*s5h/sqrt(length(ih))
httpp<- m5h + tz*s5h/sqrt(length(ih))

# udp AZUL
points(x$nodes[2], m5u, col="blue", pch=15)

# http VERDE
points(x$nodes[2],m5h, col="green", pch=15)

arrows(c(5,5),c(m5u,m5u),c(5,5),c(udpn,udpp),col="blue",angle=90)
arrows(c(5,5),c(m5h,m5h),c(5,5),c(httpn,httpp),col="green",angle=90)
#--------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------

# limit udp com 8 atacantes
iu<- x$amostra[3] # tamanho da amostra
udpn<- m8u - tz*s8u/sqrt(length(iu))
udpp<- m8u + tz*s8u/sqrt(length(iu))

# limit http com 8 atacantes
ih<- x$amostra[3]
httpn<- m8h - tz*s8h/sqrt(length(ih))
httpp<- m8h + tz*s8h/sqrt(length(ih))

# udp AZUL
points(x$nodes[3], m8u, col="blue", pch=15)

# http VERDE
points(x$nodes[3],m8h, col="green", pch=15)

arrows(c(8,8),c(m8u,m8u),c(8,8),c(udpn,udpp),col="blue",angle=90)
arrows(c(8,8),c(m8h,m8h),c(8,8),c(httpn,httpp),col="green",angle=90)
#--------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------
# udp 8954
lines(c(1,5,8),c(m1u,m5u,m8u), col="blue", lty=2)
# http 12321
lines(c(1,5,8),c(m1h,m5h,m8h), col="green", lty=2)

#arrows(c(1,1),c(x$interval[8],x$interval[8]),c(1,1),c(udpn,udpp),col="blue",an$
#arrows(c(15,15),c(mudpc,mudpc),c(15,15),c(iudpcn,iudpcp),col=2,angle=90)

dev.off()