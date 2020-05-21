#coviddata <- read.csv("owid-covid-data.csv", header = T, stringsAsFactors = F)
#coviddata <- subset(coviddata, date>"2020-03-01")
d <- iris

irisdata <- d[,-ncol(d)]
dim(irisdata)
head(irisdata)
summary(irisdata)

library(rpart)
library(randomForest)
set_target = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
for (nm in set_target) {
    if (nm=="Sepal.Length"){
        model = rpart(Sepal.Length ~ ., data = irisdata)
        } else if (nm=="Sepal.Width"){
        model = rpart(Sepal.Width ~ ., data = irisdata)
        } else if (nm=="Petal.Length"){
        model = rpart(Petal.Length ~ ., data = irisdata)
        } else if (nm=="Petal.Width"){
        model = rpart(Petal.Width ~ ., data = irisdata)
        }
    print(model)
    library(rpart.plot)
    rpp <- rpart.plot(model, extra = 1)
    pngFileName <- paste("./fig_iris/iris_",nm,".png",sep="")
    png(file=pngFileName, res=250, w=1500, h=1500)
    rpp <- rpart.plot(model, extra = 1)
    dev.off()
}
for (nm in set_target) {
    if (nm=="Sepal.Length"){
        model = randomForest(Sepal.Length ~ ., data = irisdata)
        } else if (nm=="Sepal.Width"){
        model = randomForest(Sepal.Width ~ ., data = irisdata)
        } else if (nm=="Petal.Length"){
        model = randomForest(Petal.Length ~ ., data = irisdata)
        } else if (nm=="Petal.Width"){
        model = randomForest(Petal.Width ~ ., data = irisdata)
        }
    #model = randomForest(nm ~ ., data = irisdata)
    print(model)
    print(importance(model))
    print(varImpPlot(model))
    rpp2 <- varImpPlot(model)
    varFileName <- paste("./fig_iris/iris_var",nm,".png",sep="")
    png(file=varFileName, res=250, w=1500, h=1500)
    rpp2 <- varImpPlot(model)
    dev.off()
}

