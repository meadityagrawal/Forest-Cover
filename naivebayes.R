#NAive bayes
library(e1071)
setwd("D:/Kaggle/Forest/Naive bayes")
CSV <- read.csv("train.csv", header = T, sep = ",")
train <- data.frame(CSV)
train <- train[-30]
train <- train[-22]
train <- train[-1]

for (i in 11:53){
  train[,i] <- as.factor(train[,i])
}


for (i in 1:10){
  train[,i] <- as.numeric(train[,i])
}


CSV1 <- read.csv("test.csv", header = T, sep = ",")
test <- data.frame(CSV1)
test <- test[-30]
test <- test[-22]
test <- test[-1]

for (j in 11:52){
  test[,j] <- as.factor(test[,j])
}


for (i in 1:10){
  test[,i] <- as.numeric(test[,i])
}

model <- naiveBayes(as.factor(Cover_Type) ~., data = train)


prediction <- predict(model, test)

table(prediction, test$Cover_Type)
tune(naiveBayes,Cover_Type ~., data = train,
     tunecontrol = tune.control(sampling="boot"))

submit<-as.data.frame(cbind(test$Id, prediction))

colnames(submit)<-c("Id","Prediction")
write.csv(submit,"Naive.csv",row.names=FALSE,quote=FALSE)
