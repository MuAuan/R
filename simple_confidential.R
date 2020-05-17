neji = c(31, 29, 28, 35, 30, 30, 32, 27, 33, 29)
x=c(1,2,3,4,5,6,7,8,9,10)
t.test(neji)

jpeg('neji_plot.jpg')
plot(x,neji)
dev.off()

print(t.test(neji))

library(datasets)
data(iris)
print(summary(iris))
print(head(iris))

jpeg('iris_plot.jpg')
plot(iris)
dev.off()

print(t.test(iris$Sepal.Length))
print(t.test(iris$Petal.Length))

jpeg('iris_Sepal_hist.jpg')
hist(iris$Sepal.Length)
dev.off()

jpeg('iris_Petal_hist.jpg')
hist(iris$Petal.Length)
dev.off()

jpeg('iris_rplot.jpg')
plot(iris$Sepal.Length, iris$Petal.Length)
dev.off()

library("ggpubr")

my_data <- iris


ggscatter(my_data, x = "Sepal.Length", y = "Petal.Length", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Sepal.Length", ylab = "Petal.Length")
ggsave("iris_scatter_plot.jpg")