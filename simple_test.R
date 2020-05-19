
v_a=c(20,50,100,200,500,1000,2000,5000)
x <- seq(-4, 4, by = 0.1)
y2 <- dnorm(x, mean=0, sd=1)
for (nm in v_a) {
  pngFileName <- paste("hist_rnorm_nm=",nm,".jpg",sep="")
  png(file=pngFileName, res=250, w=1500, h=1500)
  k <- seq(0, nm, by = 1)
  y=rnorm(k)
  #plot(y)
  hist(y, xlim=c(-4,4), ylim=c(0,0.5), prob=T, ann=F)
  par(new=T)
  mean_data=round(mean(y),digits=2)
  sigma_data=round(sqrt(var(y)),digits=2)
  legend("topright",legend=c("data",nm,"mean",mean_data,"ƒÐ",sigma_data))
  x <- seq(-4, 4, by = 0.1)
  y1 <- dnorm(x, mean=mean_data, sd=sigma_data)
  lines(x,y1,col="red",lwd=2)
  lines(x,y2,col="blue",lwd=2)
  axis(side=4)
  dev.off()
  print(t.test(y1, y2))
  #y2=y1
}