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
       xlab="", ylab="" ) # 標準正規分布を描画
print(pnorm( 1.64 )) # P(z<1.64) 下側確率
print(pnorm( 1.64, lower.tail=FALSE )) # P(z>1.64) 上側確率
print(qnorm( 0.025)) # 下側2.5%の境界値
print(qnorm( 0.025, lower.tail=FALSE )) # 下側2.5%の境界値
print(rnorm( 20 )) # 正規乱数を20個生成
y <- rnorm(1000)
plot( y, xlab="", ylab="" )
hist(y)

z_scores <- seq(-3, 3, by = .01)
plot( z_scores, xlab="", ylab="" )
hist(z_scores)
dvalues <- dnorm(z_scores)
plot( dvalues, xlab="", ylab="",main = "dvalue")
hist(dvalues)
curve(dnorm(x), xlab="", ylab="" ) # 標準正規分布を描画

# 底辺直線部の座標
x <- seq( -4, -1.96, length=50 ) # x範囲を50分割
y <- rep( 0, 50 ) # y座標はすべて0
# 確率密度曲線上の座標
revx <- rev( x ) # x座標を逆向きに並べ替え
dx <- dnorm( revx ) # x座標に対応する曲線上の値（y座標）
# 直線部と曲線部の座標を合併
xvals <- c( x, revx )
yvals <- c( y, dx )
# 標準正規分布を描いて、多角形を塗りつぶして追加
curve( dnorm( x ), -4, 4, xlab="", ylab="" )
polygon( xvals, yvals, col="red" ) # 左側2.5%棄却域の塗りつぶし
# 右側2.5%領域
xvals <- c( seq( 4, 1.96, length=50 ), seq( 1.96, 4, length=50 ) )
yvals <- c( rep( 0, 50 ), dnorm( seq( 1.96, 4, length=50 ) ) )
polygon( xvals, yvals, col="blue" )
text( -3, 0.1, "2.5%" )
text( 3, 0.1, "2.5%" )

source( "paint_region.R" )
curve( dnorm(x), -4, 4, xlab="", ylab="" ) # -4～4の範囲で、確率分布曲線を描く
paint_region( -4, -1.96,"blue",tx="2.5%" ) # 左側棄却域塗りつぶし
paint_region( 1.96, 4,"red",tx="2.5%" ) # 右側棄却域塗りつぶし

