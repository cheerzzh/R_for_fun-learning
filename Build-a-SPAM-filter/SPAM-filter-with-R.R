
# goal: classify a given e-mail as spam or not-spam
# a supervised machine learning problem- use SVM

# 0 for no spam and 1 for spam
# dataset contains 57 attributes or features.

dataset <- read.csv("data.csv",header=FALSE,sep=";")
names <- read.csv("names.csv",header=FALSE,sep=";")
names(dataset) <- sapply((1:nrow(names)),function(i) toString(names[i,1]))
dataset$y <- as.factor(dataset$y)

#build it with a sample of our dataset based on 1000 e-mails
sample <- dataset

  # provides a handy function for data partition and model training
require(caret) 
require(kernlab)  # for SVM
require(doMC)  # use more CPU to speed up calculation
library(e1071)

trainIndex <- createDataPartition(sample$y, p = .8, list = FALSE, times = 1)
dataTrain <- sample[ trainIndex,]
dataTest  <- sample[-trainIndex,]

registerDoMC(cores=5)

# parameter concern in training SVM
# C parameter tells the SVM optimization how much you want to avoid misclassifying each training example
### finding optimal value of a tuning parameter 
sigDist <- sigest(y ~ ., data = dataTrain, frac = 1)
### creating a grid of two tuning parameters, .sigma comes from the earlier line. we are trying to find best value of .C
svmTuneGrid <- data.frame(.sigma = sigDist[1], .C = 2^(-2:7))

# train the SVM with the train() function of the caret package
# This function can be used for all the models and algorithms in the caret package
# try the parameter grid
x <- train(y ~ .,                  
           data = dataTrain,                  
           method = "svmRadial",                  
           preProc = c("center", "scale"),                 
           tuneGrid = svmTuneGrid,                  
           trControl = trainControl(method = "repeatedcv", 
                                    repeats = 5,                                           
                                    classProbs =  TRUE))
pred <- predict(x,dataTest)
(acc <- confusionMatrix(pred,dataTest$y))


