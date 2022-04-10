#2a
dbinom(4, size = 20, prob = 0.2)

#2b
peluang <- dbinom(1:20, 20, 0.2)
data = data.frame(y=c(peluang), x=c(1:20))
barplot(data$y, names.arg=data$x, ylab="Peluang", xlab="Jumlah Pasien")

#2c
#rataan
4*0.2
#varian
4*0.2*(1-0.2)