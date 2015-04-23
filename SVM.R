setwd("D:/Kaggle/Forest/SVM")

library(e1071)
library(lubridate)

#read the data
train <- read.csv("train.csv", header = T, sep = ",")
train <- data.frame(train)
train <- train[-30]
train <- train[-22]
train <- train[-1]

for (i in 11:53){
  train[,i] <- as.factor(train[,i])
}


for (i in 1:10){
  train[,i] <- as.numeric(train[,i])
}


test <- read.csv("test.csv", header = T, sep = ",")
test <- data.frame(test)
test <- test[-30]
test <- test[-22]
test <- test[-1]

for (j in 11:52){
  test[,j] <- as.factor(test[,j])
}


for (i in 1:10){
  test[,i] <- as.numeric(test[,i])
}

#select relevant columns
train_cols<-train[,c(1:52)]
labels<-as.matrix(train[,53])
testdata<-test[,1:52]


fit<- svm(Cover_Type ~ ., data = train,type="C-classification", cost = 10, gamma = 0.5)
predictions<-as.data.frame(predict(fit,newdata=testdata))

# # 
# obj <- tune.svm(Cover_Type ~ ., data = train,type="C-classification", cost = 10^(0:1), gamma = 2^(-1:1))
# # summary(obj)
# plot(obj) 

#create submission file
submit<-as.data.frame(cbind(test[,1],predictions))
colnames(submit)<-c("Id","Cover_Type")
write.csv(submit,"submission2.csv",row.names=FALSE,quote=FALSE)
