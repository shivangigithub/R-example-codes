
##response var is binary, yes or no
##predictor var are binary and 1 is numeric
Sepsis <- read.csv("/Users/apple/Documents/R_workshop_practice/day3/Sepsis.csv")
##Sepsis <- read.delim("clipboard")  ##using R editor
dim(Sepsis)
head(Sepsis)
Sepsis1 <- glm(Outcome~., data = Sepsis, family = binomial) ##glm=generalized linear model, eg logistic regression, if not given family = binomial, it runs multiple regression.
summary(Sepsis1)
p <- pchisq(53.122,100,lower.tail = FALSE)
p
data <- data.frame(Shock=c(1,1), Malnutrition=c(0,0), Alcoholism = c(0,0), Age=c(30,70), Infarction=c(1,1))
data
predict(Sepsis1, newdata = data, type="response") ###calculate chances of death of patient using above data
Sepsis2 <- glm(Outcome ~ Shock + Alcoholism + Age + Infarction, data = Sepsis, family = binomial)
summary(Sepsis2)
##calculating goodness of fit
p <- pchisq(56.073,101,lower.tail= FALSE)
p
curve(exp(-8.89458992 + 3.70119321 + 3.18590397 + 0.08983175*x +
            2.38646847)/ (1 + exp(-8.89458992 + 3.70119321 + 3.18590397 + 0.08983175*x +
                                    2.38646847)),from = 15, to = 95, lwd = 2, col = "red", ylim = c(0, 1), xlab = "Age",
      ylab = "Probability", main = "Logistic Regression", sub = "Sepsis Data")

curve(exp(-8.89458992 + 3.70119321 + 3.18590397 + 0.08983175*x)/
        (1 + exp(-8.89458992 + 3.70119321 + 3.18590397 + 0.08983175*x)), col =
        "blue", lwd = 2, add = T)
curve(exp(-8.89458992 + 3.70119321 + 0.08983175*x + 2.38646847)/
        (1 + exp(-8.89458992 + 3.70119321 + 0.08983175*x + 2.38646847)), col =
        "green", lwd = 2, add = T)
curve(exp(-8.89458992 + 3.18590397 + 0.08983175*x + 2.38646847)/
        (1 + exp(-8.89458992 + 3.18590397 + 0.08983175*x + 2.38646847)), col =
        "black", lwd = 2, add = T)
curve(exp(-8.89458992 + 3.70119321 +0.08983175*x)/
        (1 + exp(-8.89458992 + 3.70119321 + 0.08983175*x)), col = "gray", lwd = 2, add
      = T)

curve(exp(-8.89458992 + 3.18590397 + 0.08983175*x)/
        (1 + exp(-8.89458992 + 3.18590397 + 0.08983175*x)), col = "violet", lwd = 2,
      add = T)
curve(exp(-8.89458992 + 0.08983175*x + 2.38646847)/
        (1 + exp(-8.89458992 + 0.08983175*x + 2.38646847)), col = "orange", lwd = 2,
      add = T)

curve(exp(-8.89458992 + 0.08983175*x)/(1 + exp(-8.89458992 +
                                                 0.08983175*x)), col = "magenta", lwd = 2, add = T)

legend("right", pch = rep(16, 8), col = c("red", "blue", "green", "black",
                                          "gray", "violet", "orange", "magenta"), legend = c("S=Y, A=Y, I=Y",
                                                                                             "S=Y, A=Y, I=N", "S=Y, A=N, I=Y", "S=N, A=Y, I = Y", "S=Y, A=N, I=N", "S=N, A=Y,
I=N", "S=N, A=N, I=Y", "S=N, A=N, I=N"))

names(Sepsis2)
Sepsis2$coefficients
 
###calculate the prob of 106 patients in sepsis data

Pred <- predict(Sepsis1, newdata = Sepsis, type = "response")
Pred
round(Pred,2)
##concrete prediction, if prob of death, is greater than 50%, he will die, if it is less than 50%, he will survive
ConcretePred <- ifelse(Pred <0.50,"Survive","Die")
ConcretePred
Sepsis3 <- data.frame (Sepsis, ConcretePred)
Sepsis3
Sepsis4 <- Sepsis3[,6:7]
Sepsis4
##to calculate the prediction accuracy
table(Sepsis4$Outcome, Sepsis4$ConcretePred)
MisClassificationRate <- 9/106
MisClassificationRate
CorrectClassificationRate <- 97/106
CorrectClassificationRate
###to make the judgement of acceptable misclassification rate
##i put my misclassification rate in context to skeptic misclassification rate, so lets say skeptic says whosoever comes for surgery, he will survive, accoding to him
#all survive, but in reality 21 died, so lets calculate misclassification rate of skeptic
21/106
##ie his misclassificationrate is 19% gretaer than my misclassrate 8.5%.

getwd()
setwd("C:/Users/USER-55/Desktop/Regression_practice/")
