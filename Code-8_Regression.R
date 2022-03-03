
Height <- seq(134, 178, 4) #min=134, max= 178 and interval at 4
# or hieght <- seq(134,138,142 and so on)
FEV <- c(1.7, 1.9, 2.0, 2.1, 2.2, 2.5, 2.7, 3.0, 3.1, 3.4, 3.8, 3.9) 
MB <- data.frame(Height,FEV)
MB
MB1 <- lm(FEV~Height,data=MB)
summary(MB1)
names(MB1)
round(MB1$fitted.values,2)
MB$Predicted <- round(MB1$fitted.values,2)
MB
MB$Residuals <- round(MB1$residuals, 2)
MB
RSS <- sum((MB1$residuals)^2) ##using residuals, RSS=residual sum of squares
RSS
TSS <- sum ((FEV-mean(FEV))^2)  ###substracting each FEv value from mean to calculate deviation from mean and then square and sum
TSS
Good <- 1-RSS/TSS
Good
####check normality using residuals
shapiro.test(MB1$residuals) ###null hypothesis is true, p-value is > 5% and data is normally distributed

####now graphics
plot(MB$Height, MB$FEV, xlab = "Height in cms", ylab = "FEV in ltrs",col="red", pch=16, main = "scatter plot + Regression line + 95% confidence band + 95% prediction band"
     , sub = "Boys 12-14yrs")
abline(MB1,col="cyan", lwd =2) ###MB1 contains regression data
##calculate 95% confidence band 
MB2 <- predict(MB1, newdata = MB, int = "c")
MB2
####matlines(MB2$lwr, MB2$upr, ity = c(1,2,2),col=c("steelblue", "red","red" ))
##so u can plot confidence and prediction bands urself following the tutorial
see <- MB$Height
matlines(see, MB2, Ity = c(1,2,2),col=c("steelblue", "red","red" ))
##so u can plot confidence and prediction bands urself following the tutorial
###prediction band
MB3 <- predict(MB1,newdata = MB, int = "p")
matlines(see, MB3, Ity=c(1,2,2), col =c("steelblue", "red", "red"))  ####prediction band

####one example data ploting prediction and confidence bands
xv <- seq(130, 180, 0.5)
xv
yv <- predict(MB1, list(Height = xv), int = "c")
(yv)[1:9,]
##head(MB)
matlines(xv,yv,Ity=c(1,2,2), col=c("steelblue", "red","red"))
yv1 <- predict(MB1, list(Height = xv), int = "p")
matlines(xv,yv1,Ity=c(1,2,2), col=c("steelblue", "red","red"))
