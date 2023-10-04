setwd("c:/Rtest")
result <- read.csv("iris.csv", header=TRUE)
View(result)
head(result)
summary(result)
samp <- c(sample(1:150, 75)) ##divide data set of 150 into 2 groups
data.tr <- result[samp, ] #The fist part has name data.tr for training data
data.te <- result[-samp, ] ##The second part has name data.te for test data
library(nnet)
model.nnet <- nnet(SPEC~., data=data.tr, size=2, decay=5e-04)
summary(model.nnet)
model.nnet$wts  #shows weights among nodes in NN
predicted <- predict(model.nnet, data.te, type="class")
predicted  #show predicted values
y=data.te$SPEC
p<- predicted
table(y,p) # shows test performance of the model
data.pre<- read.csv("iris_pre.csv",header=TRUE)   #read data to predict it classes
predicted2<-predict(model.nnet, data.pre, type="class") # predict class for each line of data
predicted2 #show results