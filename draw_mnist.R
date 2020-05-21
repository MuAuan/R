# MNISTのトレーニングデータ読み込み
train <- read.csv("MNIST/train.csv")

# MNISTのトレーニングデータを画像表示する
view_train <- function(train, range = 1:20) {
  par(mfrow=c(length(range)/4, 5))
  par(mar=c(0,0,0,0))
  for (i in range) {
    m <- matrix(data.matrix(train[i,-1]), 28, 28)
    image(m[,28:1])
  }
}

# ラベルを表示
view_label <- function(train, range = 1:20) {
  matrix(train[range,"label"], 4, 5, byrow = TRUE)
}

range <- 1:20
view_train(train, range)
view_label(train, range)

library(nnet)

# MNISTのトレーニングデータ読み込み
train <- read.csv("MNIST/train.csv")
train[,"label"] <- as.factor(train[,"label"])

# 42000件のデータを40000件のトレーニングデータと2000件のテストデータにランダム・サンプリング
training.index <- 1:40000
mnist.train <- train[training.index,]
mnist.test <- train[-training.index,]

# トレーニングデータをニューラルネットで学習
#mnist.nnet <- nnet(label ~ ., size=3, data=mnist.train, MaxNWts = 4000)
mnist.nnet <- nnet(label ~ ., step_size = 0.3, data=mnist.train, reg = 0.0001, niteration = 3500)
mnist.result <- predict(mnist.nnet, mnist.test, type="class")
table(mnist.test$label, mnist.result, dnn = c("Actual", "Predicted"))
#table(mnist.result)

# テストデータの正解、予測を表示
range <- 1:20
view_train(mnist.test, range)
view_label(mnist.test, range)
matrix(mnist.result, 4, 5, byrow = TRUE)


##########

library(nnet)

# 関数の定義
view_train <- function(train, range = 1:20) {
  par(mfrow=c(length(range)/4, 5))
  par(mar=c(0,0,0,0))
  for (i in range) {
    m <- matrix(data.matrix(train[i,-1]), 28, 28)
    image(m[,28:1])
  }
}

view_label <- function(train, range = 1:20) {
  matrix(train[range,"label"], 4, 5, byrow = TRUE)
}

# MNISTのトレーニングデータ読み込み
train <- read.csv("MNIST/train.csv")
train[,"label"] <- as.factor(train[,"label"])

# 42000件のデータを40000件のトレーニングデータと2000件のテストデータに分割
training.index <- 1:40000
mnist.train <- train[training.index,]
mnist.test <- train[-training.index,]

# トレーニングデータをニューラルネットで学習
mnist.nnet <- nnet(label ~ ., size=3, data=mnist.train, MaxNWts=4000)

# テストデータを使って評価
mnist.result <- predict(mnist.nnet, mnist.test, type="class")
table(mnist.test$label, mnist.result, dnn = c("Actual", "Predicted"))

# テストデータの正解、予測を表示
range <- 1:20
view_train(mnist.test, range)
view_label(mnist.test, range)
matrix(mnist.result, 4, 5, byrow = TRUE)

####
train<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_train.csv')
test<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_test.csv')
train<-data.matrix(train)
test<-data.matrix(test)
train.x<-train[,-1]
train.y<-train[,1]
train.x<-t(train.x/255)
test_org<-test
test<-test[,-1]
test<-t(test/255)
table(train.y)

# Deep NN
data <- mx.symbol.Variable("data")
fc1 <- mx.symbol.FullyConnected(data, name="fc1", num_hidden=128)
act1 <- mx.symbol.Activation(fc1, name="relu1", act_type="relu")
fc2 <- mx.symbol.FullyConnected(act1, name="fc2", num_hidden=64)
act2 <- mx.symbol.Activation(fc2, name="relu2", act_type="relu")
fc3 <- mx.symbol.FullyConnected(act2, name="fc3", num_hidden=10)
softmax <- mx.symbol.SoftmaxOutput(fc3, name="sm")
devices <- mx.cpu()
mx.set.seed(0)
model <- mx.model.FeedForward.create(softmax, X=train.x, y=train.y,
                                      ctx=devices, num.round=10, array.batch.size=100,
                                      learning.rate=0.07, momentum=0.9,
                                      eval.metric=mx.metric.accuracy,
                                      initializer=mx.init.uniform(0.07),
                                     epoch.end.callback=mx.callback.log.train.metric(100))
preds <- predict(model, test, ctx=devices)
dim(preds)
pred.label <- max.col(t(preds)) - 1
table(pred.label)
sum(diag(table(test_org[,1],pred.label)))/1000
