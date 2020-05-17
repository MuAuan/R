set.seed(1234)
testData <- c(rnorm(1000, mean=100, sd=10))
print(shapiro.test(testData))

set.seed(1234)
testData2 <- c(rnorm(4000, mean=100, sd=10))
print(ks.test(testData2, "pnorm", mean=mean(testData2), sd=sd(testData2)))

print(dnorm(0, mean = 0, sd = 1))
print(dnorm(0))
print(dnorm(2, mean = 5, sd = 3))
z_scores <- seq(-3, 3, by = .1)
print(head(z_scores))
dvalues <- dnorm(z_scores)
print(head(dvalues))

plot(dvalues, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "l", # Make it a line plot
     main = "pdf of the Standard Normal",
     xlab= "Z-score") 

# These commands label the x-axis
axis(1, at=which(dvalues == dnorm(0)), labels=c(0))
axis(1, at=which(dvalues == dnorm(1)), labels=c(-1, 1))
axis(1, at=which(dvalues == dnorm(2)), labels=c(-2, 2))

print(pnorm(0))
print(pnorm(2))
print(pnorm(2, mean = 5, sd = 3))
print(1 - pnorm(2, mean = 5, sd = 3, lower.tail = FALSE))

pvalues <- pnorm(z_scores)

# Now we'll plot these values
plot(pvalues, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "l", # Make it a line plot
     main = "cdf of the Standard Normal",
     xlab= "Quantiles",
     ylab="Probability Density") 

# These commands label the x-axis
axis(1, at=which(pvalues == pnorm(-2)), labels=round(pnorm(-2), 2))
axis(1, at=which(pvalues == pnorm(-1)), labels=round(pnorm(-1), 2))
axis(1, at=which(pvalues == pnorm(0)), labels=c(.5))
axis(1, at=which(pvalues == pnorm(1)), labels=round(pnorm(1), 2))
axis(1, at=which(pvalues == pnorm(2)), labels=round(pnorm(2), 2))

testData3a <- c(rnorm(4000, mean=100, sd=10))
testData3b <- c(rnorm(4000, mean=110, sd=10))
print(t.test(testData3a, testData3b))

jpeg('testData3a.jpg')
plot(testData3a, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "l", # Make it a line plot
     main = "cdf of the Standard Normal",
     xlab= "Quantiles",
     ylab="testData3a") 
dev.off()

jpeg('testData3b.jpg')
plot(testData3b, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "l", # Make it a line plot
     main = "cdf of the Standard Normal",
     xlab= "Quantiles",
     ylab="testData3b") 
dev.off()

hist(testData3a)
jpeg('testData3a_hist.jpg')
hist(testData3a)
dev.off()

hist(testData3b)
jpeg('testData3b_hist.jpg')
hist(testData3b)
dev.off()

curve( dnorm(x), from=-4, to=4,
       xlab="", ylab="" ) # �W�����K���z��`��
print(pnorm( 1.64 )) # P(z<1.64) �����m��
print(pnorm( 1.64, lower.tail=FALSE )) # P(z>1.64) �㑤�m��
print(qnorm( 0.025)) # ����2.5%�̋��E�l
print(qnorm( 0.025, lower.tail=FALSE )) # ����2.5%�̋��E�l
print(rnorm( 20 )) # ���K������20����
y <- rnorm(1000)
plot( y, xlab="", ylab="" )
hist(y)

z_scores <- seq(-3, 3, by = .01)
plot( z_scores, xlab="", ylab="" )
hist(z_scores)
dvalues <- dnorm(z_scores)
plot( dvalues, xlab="", ylab="",main = "dvalue")
hist(dvalues)
curve(dnorm(x), xlab="", ylab="" ) # �W�����K���z��`��

# ��Ӓ������̍��W
x <- seq( -4, -1.96, length=50 ) # x�͈͂�50����
y <- rep( 0, 50 ) # y���W�͂��ׂ�0
# �m�����x�Ȑ���̍��W
revx <- rev( x ) # x���W���t�����ɕ��בւ�
dx <- dnorm( revx ) # x���W�ɑΉ�����Ȑ���̒l�iy���W�j
# �������ƋȐ����̍��W������
xvals <- c( x, revx )
yvals <- c( y, dx )
# �W�����K���z��`���āA���p�`��h��Ԃ��Ēǉ�
curve( dnorm( x ), -4, 4, xlab="", ylab="" )
polygon( xvals, yvals, col="red" ) # ����2.5%���p��̓h��Ԃ�
# �E��2.5%�̈�
xvals <- c( seq( 4, 1.96, length=50 ), seq( 1.96, 4, length=50 ) )
yvals <- c( rep( 0, 50 ), dnorm( seq( 1.96, 4, length=50 ) ) )
polygon( xvals, yvals, col="blue" )
text( -3, 0.1, "2.5%" )
text( 3, 0.1, "2.5%" )

source( "paint_region.R" )
curve( dnorm(x), -4, 4, xlab="", ylab="" ) # -4�`4�͈̔͂ŁA�m�����z�Ȑ���`��
paint_region( -4, -1.96,"blue",tx="2.5%" ) # �������p��h��Ԃ�
paint_region( 1.96, 4,"red",tx="2.5%" ) # �E�����p��h��Ԃ�
