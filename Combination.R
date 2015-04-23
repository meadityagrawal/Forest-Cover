A <- read.csv("D:/Kaggle/Forest/K nearest/submission.csv", header = T, sep = ",")
B <- read.csv("D:/Kaggle/Forest/GBM/submission.csv", header = T, sep = ",")
C <- read.csv("D:/Kaggle/Forest/Naive bayes/submission.csv", header = T, sep = ",")
D <- read.csv("D:/Kaggle/Forest/SVM/submission2.csv", header = T, sep = ",")
At <- data.frame(A$Cover_type)
Bt <- data.frame(B$Cover_Type)
Ct <- data.frame(C$Cover_Type)
Dt <- data.frame(D$Cover_Type)

CheckAB <- as.factor(ifelse(At==Bt,1,0))
summary(CheckAB)

CheckBC <- as.factor(ifelse(Ct==Bt,1,0))
summary(CheckBC)

CheckAC <- as.factor(ifelse(At==Ct,1,0))
summary(CheckAC)

CheckDC <- as.factor(ifelse(Dt==Ct,1,0))
summary(CheckDC)

CheckDB <- as.factor(ifelse(Dt==Bt,1,0))
summary(CheckDB)

CheckDA <- as.factor(ifelse(Dt==At,1,0))
summary(CheckDA)

(x <- c(sort(sample(1:20, 9)), NA))
(y <- c(sort(sample(3:23, 7)), NA))

dat <- cbind(At, Bt , Ct , Dt )
dt <- data.frame(dat)
freq <- apply(dt,1,function(x) names(which.max(table(x))))
freq <- as.data.frame(freq)

write.csv(freq,"submission.csv",row.names=FALSE,quote=FALSE)
