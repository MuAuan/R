#Live Demo
# Create a function without an argument.
age_hist <- function(a,b) {
  data <- read.csv("tokyo_covid19_patients.csv")
  data500 <- subset(data,data$No==a:b & data$Š³ŽÒ_”N)
  print(head(data500))
  age <- data500$Š³ŽÒ_”N
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
  legend("topright",legend=c(a," |",b,"mean",mean_age,"ƒÐ",sigma_age))
  lines(x, (b-a)*10*dnorm(x, mean=mean_age, sd=sigma_age), col="red",lwd=2)
  dev.off()
  
  print(mean(age))
  print(var(age))
  print(sqrt(var(age)))
}	

# Call the function without supplying an argument.
s=500
for(i in 0:8) {
  a=i*s+1
  b=(i+1)*s
  age_hist(a,b)
}

a=1
b=38
age_hist(a,b)
a=1
b=154
age_hist(a,b)

a=1
b=4810
age_hist(a,b)


