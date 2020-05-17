#Live Demo
# Create a function without an argument.
age_hist <- function(a,b) {
  data <- read.csv("tokyo_covid19_patients.csv")
  data500 <- subset(data,data$No==a:b & data$患者_年)
  print(head(data500))
  age <- data500$患者_年
  print(head(age))
  jpegName <- paste("age_",c(a),"_",c(b),".jpg",sep="")
  jpeg(jpegName)
  plot(age)
  dev.off()
  
  x <- seq(0,110,10)
  print(x)
  jpegFileName <- paste("age_hist_",c(a),"_",c(b),".jpg",sep="")
  jpeg(jpegFileName)
  hist(age,breaks = x,main="")
  title(main = "Histgram of COVID")
  mean_age=round(mean(age),digits=2)
  sigma_age=round(sqrt(var(age)),digits=2)
  legend("topright",legend=c(a," |",b,"mean",mean_age,"σ",sigma_age))
  lines(x, (b-a)*10*dnorm(x, mean=mean_age, sd=sigma_age), col="red",lwd=2)
  dev.off()
  
  print(mean(age))
  print(var(age))
  print(sqrt(var(age)))
  print(t.test(age,rnorm(x,mean=mean(age), sd=sd(age))))
  print(shapiro.test(age))
  print(ks.test(age, "pnorm", mean=mean(age), sd=sd(age)))
}	

# Call the function without supplying an argument.
a=1
b=4000
age_hist(a,b)
a=1
b=100
age_hist(a,b)
a=4001
b=4100
age_hist(a,b)

data <- read.csv("tokyo_covid19_patients.csv")
data154 <- subset(data,data$No==1:100 & data$患者_年)
age154 <- data154$患者_年
print(mean(age154))
data1154 <- subset(data,data$No==4201:4300 & data$患者_年)
age1154 <- data1154$患者_年
print(mean(age1154))

library(lawstat)
print(brunner.munzel.test(age154, age1154))

