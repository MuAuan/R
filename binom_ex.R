## Using "log = TRUE" for an extended range :
n <- 500
k <- seq(0, n, by = 1)
y=rbinom(k, 5000, 0.001)
plot( y )
k <- seq(0, 20, by = 1)
hist(y,breaks=k)
y=dbinom(k, size=500, prob=0.01, log = FALSE)
plot( 70/0.15*y )
lines(70/0.15*dbinom(k, size = 5000, prob=0.001, log=FALSE), col="blue",lwd=2)

k1 <- seq(0, 20, by = 1)
y1=dpois(k1, lambda=5, log = FALSE)
plot( 70/0.15*y1 )
lines(70/0.15*dpois(k1, lambda = 5, log=FALSE), col="green",lwd=2)

print(shapiro.test(y))
print(ks.test(y, "pnorm", mean=mean(y), sd=sd(y)))

print(t.test(y, y1))

library(brunnermunzel)
library(lawstat)
#print(brunner.munzel.test(y, y1))

Y <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 1, 1)
N <- c(3, 3, 4, 3, 1, 2, 3, 1, 1, 5, 4)

print(brunner.munzel.test(Y, N))
print(brunnermunzel.permutation.test(Y, N))
