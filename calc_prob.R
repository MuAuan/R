#Theorem of Beisian

prop_calc <- function(x,a,b) {
  P=a*x/(a*x+(1-b)*(1-x))
}

v_a=c(0.7)  #感度 0.1,0.3,0.5,0.7,0.9,0.99,0.995,0.999,1
v_b=c(0.99) #特異度
jpegFileName <- paste("yousei_",c(v_a),"_",c(v_b),".jpg",sep="")
jpeg(jpegFileName)
j=2
for (b in v_b) {
  for (a in v_a) {
    #b=0.999 #特異度
    print(prop_calc(0.05,a,b))
    print(prop_calc(0.1,a,b))
    
    l=c()
    lx=c()
    for(i in 0:200) {
      x=i/1000
      lx[i]=x
      l[i]=prop_calc(x,a,b)
    }
    par(new=T)
    g <- plot(lx,l,ylim = c(0,1),col=j,lwd=2)
    y=grid(lty = 3 ,lwd = 3)
    title(main = "感度・特異度を変化させたときの \n 陽性適合率の社会陽性率依存性",xlab="社会の陽性率",ylab="検査陽性適合率")
    legend("bottomright",legend=c("感度",a," |","特異度",b))
    j <- j+1
  }
  
}
dev.off()

