#population tokyo

data <- read.csv("population_tokyo.csv")
data_total <- subset(data,data$���ʃR�[�h==0 & data$�N��K���敪!="total")
print(head(data_total))
pop <- data_total$X2020�N
print(head(pop))
age <- data_total$�N��K���敪
l1<-c()
l2<-c()
for (k in 1:18) {
  if (!k %% 2)
    next
  b<-pop[k]+pop[k+1]
  l2<-c(l2,b)
  l1<-c(l1,age[k])
}
b<-pop[19]
l2<-c(l2,b)
l1<-c(l1,age[19])
print(l2)
print(l1)

barplot(l2,names.arg=c(l1))
jpegName <- paste("./fig/bar_pop_tokyo_.jpg",sep="")
jpeg(jpegName)
barplot(l2,names.arg=c(l1))
title(main = "Histgram of population in Tokyo",xlab="age",ylab="population")
dev.off()

a=1501
b=2000
data <- read.csv("tokyo_covid19_patients.csv")
data500 <- subset(data,data$No==a:b & data$����_�N)
print(head(data500))
age <- data500$����_�N

jpegFileName <- paste("./fig/age_hist_",c(a),"_",c(b),".jpg",sep="")
jpeg(jpegFileName)
x <- seq(0,110,10)
hist(age,breaks = x,main="")
title(main = "Histgram of COVID")
mean_age=round(mean(age),digits=2)
sigma_age=round(sqrt(var(age)),digits=2)
legend("topright",legend=c(a," |",b,"mean",mean_age,"��",sigma_age))
lines(x, (b-a)*10*dnorm(x, mean=mean_age, sd=sigma_age), col="red",lwd=2)
dev.off()

print(l2)
cx=table(data500$����_�N)
print(length(cx))
l3 <- c()
ci=1
for (i in cx) {
  print(i)
  l3[ci]=i
  ci = ci+1
}
l3[ci]=0
print(l3)
print(l2)
l4 <- c()
for (i in 1:10) {
  print(i)
  l4[i]=1000000*l3[i]/l2[i]
}
print(l4)

jpegFileName <- paste("./fig/age_hist_calib",c(a),"_",c(b),".jpg",sep="")
jpeg(jpegFileName)
barplot(l4)
title(main = "Histgram of COVID",xlab="age",ylab="cases per million")
mean_value=round(mean(l4),digits=2)
sigma_value=round(sqrt(var(l4)),digits=2)
legend("topleft",legend=c(a," |",b,"��",mean_value,"��",sigma_value))
dev.off()
