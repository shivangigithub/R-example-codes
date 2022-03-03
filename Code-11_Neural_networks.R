data(Boston)
library("MASS")
dim(Boston)
head(Boston)
###Multiple regression model
Rao <- lm(medv ~ ., data=Boston)
summary(Rao)
###calculate MSE(mean square error)
names(Rao)
Rao$fitted.values
MSE <- sum( (Boston$medv-Rao$fitted.values)^2)/506
MSE
Maxs<- apply(Boston,2,max)
Mins <- apply(Boston,2,min)
class(Boston)
ScaledB <- scale(Boston, center=Mins,scale=Maxs-Mins)
head(ScaledB)
install.packages("neuralnet")
library("neuralnet")
index <- sample(1:nrow(Boston), round(0.75*nrow(Boston)))
head(index)
train <- ScaledB[index, ]
test <- ScaledB[-index, ]
Neural <- neuralnet(medv ~ crim + zn + indus + chas + nox + rm + age + dis +
                       rad + tax + ptratio + black + lstat, data = train, hidden = 5, linear.output =
                       TRUE)
Neural
plot(Neural)
