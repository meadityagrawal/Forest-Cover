raw_train <- read.table("train.csv",sep=",",header=TRUE,stringsAsFactors=FALSE)

attach(raw_train)
drops <- c("Id", "Cover_Type")
train <- raw_train[,!(names(raw_train) %in% drops)]
cl=as.factor(Cover_Type)
detach(raw_train)

raw_test <- read.table("test.csv",sep=",",header=TRUE,stringsAsFactors=FALSE)

attach(raw_test)
drops <- c("Id")
test <- raw_test[,!(names(raw_test) %in% drops)]
detach(raw_test)

library(class)
library(caret)
cover_type <- knn(train, test, cl, k = 123)
model <- train(Cover_type)

test <- data.frame(test, Cover_type=c(cover_type))

write.table(test,"Classified.csv",sep=",",
            row.names=FALSE)

library(class)
a <- knn.cv(train, cl, k=123, prob=T)
cv <- data.frame(train, cover=c(a))
write.table(cv,"Cv111.csv",sep=",",
            row.names=FALSE)


c <- c(raw_train$Cover_Type)
b <- a
head(c)
head(b)

ceck <- as.factor(ifelse(c==b,1,0))
write.table(ceck,"C12.csv",sep=",",
            row.names=FALSE)