neji = c(31, 29, 28, 35, 30, 30, 32, 27, 33, 29)
x=c(1,2,3,4,5,6,7,8,9,10)
t.test(neji)

plot(x,neji)
print(t.test(neji))

library(datasets)
data(iris)
print(summary(iris))
print(head(iris))
plot(iris)

print(t.test(iris$Sepal.Length))
print(t.test(iris$Petal.Length))

hist(iris$Sepal.Length)
hist(iris$Petal.Length)

plot(iris$Sepal.Length, iris$Petal.Length)

cor_iris <- data %>% 
  select(-Species) %>% 
  cor()

p.mat <- data %>% 
  select(-Species) %>% 
  cor.mtest() %>% 
  .$p

corrplot(cor_iris, type = "upper", method = "number", diag = F)
