library("randomForest")  ###very very efficient package
data("iris")  ###feature of flowers to judge which species it belong to
dim(iris)
head(iris)
###pattern reognition, fisher came up with multivariate analysis, not discussing
summary(iris)
library(party)
MB2 <- randomForest(Species ~ ., data=iris, importance = T) ###importance means feature selection
print(MB2)
###prediction
Data <- data.frame(Sepal.Length=5.4, Sepal.Width=3.0, Petal.Length=4.7, Petal.Width=1.2)
predict(MB2, Data)
Dataa
varImpPlot(MB2, pch = 16, col = "red", n.var = 4, sort = T, main =
             "Importance of Variables for the Iris data")
###if u r interested in feature selection, go for random forest.
###now some twiking,,
MB3 <- randomForest(Species ~ Petal.Width + Petal.Length, data=iris, importance = T)
print (MB3)
varImpPlot(MB3, pch = 16, col = "red", n.var = 2, sort = T, main =
             "Importance of Variables from 2 variables")
###difference is very less ,means petal length and width are equally inportant

###Decision tree on iris data
MB4 <- rpart(Species ~ ., data = iris)
rpart.plot(MB4, type=4, extra=1, digits = 3, col = "red")
