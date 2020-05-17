l<-c()
i=1

while(i<21) {
  
  b<-i
  l<-c(l,b)
  i=i+1
}
print(l)

m=20
odd=numeric()
l2<-c()

for (k in 1:m) {
  if (!k %% 2)
    next
  odd <- c(odd,k)
  b<-l[k]+l[k+1]
  print(b)
  l2<-c(l2,b)
}
print(odd)
print(l2)