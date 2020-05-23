set.seed(22)
irisdata <- iris
print(dim(irisdata))
print(head(irisdata))
print(summary(irisdata))

library(rpart)
model = rpart(Species ~ ., data = irisdata)

print(model)
library(rpart.plot)
#rpp <- rpart.plot(model, extra = 2)
pngFileName <- paste("./fig_iris/iris_species0.png",sep="")
png(file=pngFileName, res=250, w=1500, h=1500)
rpp <- rpart.plot(model) #, extra = 11)
dev.off()

library(randomForest)

model = randomForest(Species ~ ., data = irisdata,,importance=TRUE,proximity=TRUE)

print(model)
print(importance(model))
print(varImpPlot(model))
rpp2 <- varImpPlot(model)
varFileName <- paste("./fig_iris/iris_species_var.png",sep="")
png(file=varFileName, res=250, w=1500, h=1500)
rpp2 <- varImpPlot(model)
dev.off()


#irisdata$Species <- factor(ifelse(irisdata$Species=='virginica','virginica','other'))
model.rf <- randomForest(Species~., data = irisdata,importance=TRUE,proximity=TRUE) #, ntree=500,
                         #importance=TRUE, nodesize=5)
print("model.rf")
print(model.rf)
print("importance(model.rf,type = 1)")
print(importance(model.rf,type = 1))
print("varImpPlot(model.rf,type = 1)")
print(varImpPlot(model.rf,type = 1))
print("importance(model.rf,type = 2)")
print(importance(model.rf,type = 2))
print("varImpPlot(model.rf,type = 2)")
print(varImpPlot(model.rf,type = 2))

rpp3 <- varImpPlot(model.rf)
#print(rpp3)
varFileName <- paste("./fig_iris/iris_species_var_rf.png",sep="")
png(file=varFileName, res=250, w=1500, h=1500)
rpp3 <- varImpPlot(model.rf)
dev.off()

varFileName <- paste("./fig_iris/iris_species_MDS.png",sep="")
png(file=varFileName, res=250, w=1500, h=1500)
rpp4 <-  MDSplot(model, iris$Species)
dev.off()

# ©‘O‚ÅMDSiMDSplot‚Æ“¯‚¶Œ‹‰Ê‚É‚È‚éj
varFileName <- paste("./fig_iris/iris_species_MDS2.png",sep="")
png(file=varFileName, res=250, w=1500, h=1500)
mds <- cmdscale(1 - model$proximity)
plot(mds)
dev.off()

