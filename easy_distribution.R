dnorm(0, mean = 0, sd = 1)
print(dnorm(0, mean = 0, sd = 1))
print(dnorm(1, mean = 0, sd = 1))
x <- seq(-4, 4, by = .1)
plot(x,dnorm(x, mean = 0, sd = 1))

y <- rnorm(1000)
plot( y )
x <- seq(-4,4,0.1)
hist(y,breaks=x)
lines(x, 100*dnorm(x, mean=mean(y), sd=sqrt(var(y))), col="blue",lwd=2)
print(mean(y))
print(var(y))
print(sqrt(var(y)))

data <- read.csv("tokyo_covid19_patients.csv")
print(head(data))
age <- data$Š³ŽÒ_”N
print(head(age))
plot(age)
x <- seq(0,110,10)
print(x)
hist(age,breaks = x)
lines(x, 48100*dnorm(x, mean=mean(age), sd=sqrt(var(age))), col="red",lwd=2)
print(mean(age))
print(var(age))
print(sqrt(var(age)))

data <- read.csv("tokyo_covid19_patients.csv")
data500 <- subset(data,data$No==1:500 & data$Š³ŽÒ_”N)
print(head(data500))
age <- data500$Š³ŽÒ_”N
print(head(age))
plot(age)
x <- seq(0,110,10)
print(x)
hist(age,breaks = x)
lines(x, 4000*dnorm(x, mean=mean(age), sd=sqrt(var(age))), col="red",lwd=2)
print(mean(age))
print(var(age))
print(sqrt(var(age)))

data <- read.csv("tokyo_covid19_patients.csv")
data5000 <- subset(data,data$No==3501:4000 & data$Š³ŽÒ_”N)
print(head(data5000))
age <- data5000$Š³ŽÒ_”N
print(head(age))
plot(age)
x <- seq(0,110,10)
print(x)
hist(age,breaks = x)
lines(x, 4000*dnorm(x, mean=mean(age), sd=sqrt(var(age))), col="red",lwd=2)
print(mean(age))
print(var(age))
print(sqrt(var(age)))

z_scores <- seq(-3, 3, by = .1)
print(head(z_scores))
dvalues <- dnorm(z_scores)
plot(dvalues, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "o", # Make it a line plot
     main = "pdf of the Standard Normal",
     xlab= "Z-score") 
# These commands label the x-axis
axis(1, at=which(dvalues == dnorm(0)), labels=c(0))
axis(1, at=which(dvalues == dnorm(1)), labels=c(-1, 1))
axis(1, at=which(dvalues == dnorm(2)), labels=c(-2, 2))
print(dnorm(0))
print(dnorm(1))
print(dnorm(2))

jpeg('plot_dvalues.jpg')
plot(dvalues, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "o", #l", # Make it a line plot
     main = "pdf of the Standard Normal",
     xlab= "Z-score")
axis(1, at=which(dvalues == dnorm(0)), labels=c(0))
axis(1, at=which(dvalues == dnorm(1)), labels=c(-1, 1))
axis(1, at=which(dvalues == dnorm(2)), labels=c(-2, 2))
dev.off()

a=0
s=1
source( "paint_region.R" )
curve( dnorm(x,mean = a, sd = s), -3+a, 3+a,type = "o", xlab="x", ylab="dnorm(x)",main = "pdf of the Standard Normal" ) # -4`4‚Ì”ÍˆÍ‚ÅAŠm—¦•ª•z‹Èü‚ð•`‚­
paint_region( -3, -1.96*s,"blue",tx="2.5%" ,a,s) # ¶‘¤Šü‹pˆæ“h‚è‚Â‚Ô‚µ
paint_region( 1.96*s, 3,"red",tx="2.5%",a,s ) # ‰E‘¤Šü‹pˆæ“h‚è‚Â‚Ô‚µ

x <- rt(50, df=5)
xy <- qqplot(qt(ppoints(50), df=5), x)
abline(lsfit(xy$x, xy$y), lty=2)

plot(qlnorm(ppoints(x)), sort(x))

