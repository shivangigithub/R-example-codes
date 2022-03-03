library(survival)
library(survminer)
getwd()
data <- read.csv("trial.csv", header = T, sep = ",")
mySurv <- Surv(time=data$days_to_last_followup, event = data$vital_status)
class (mySurv)
head(mySurv)
myfit <- survfit(mySurv~data$NLGN3)
myfit 
median(data$days_to_last_followup)
plot(myfit)
table(data$days_to_last_followup)
plot(myfit, col = c("red", "blue"))
plot(myfit, col = c("red", "blue"),mark=3)
legend("topright", c("alteration", "no_alteration"), col=c("red","blue"),lty=1)
abline(h=0.5)
abline(v=1500)
survdiff(mySurv~data$NLGN3)
plot(myfit, fun="event")
coxph(mySurv~data$NLGN3)


####example data from 

library(survival)
mydata = lung
View(mydata)
recodestatus <- function(x) {
  if (x==1){rs=0}
  if (x==2){rs=1}
  return(rs)
}
for (i in 1:length(mydata$status)) {
  mydata$recodedStatus[i] <- recodestatus(mydata$status[i])
}
mySurv <- Surv(time=mydata$time, event = mydata$recodedStatus)
class(mySurv)
head(mySurv)
myfit<- survfit(mySurv~1)
myfit
median(mydata$time)
plot(myfit)
plot(myfit, conf.int="none")
abline(h=0.5)
abline(v=310)
myfit <- survfit(mySurv~mydata$sex)
myfit
plot(myfit)
plot(myfit, col=c("red","blue"))
plot(myfit, col=c("red","blue"),mark=3)
legend("topright", c("male","female"), col=c("red","blue"),lty=1)
abline(h=0.5)
abline(v=270,col="blue")
abline(v=426,col="red")
coxph(mySurv~mydata$sex+mydata$age)

###mydata##########
library(survival)
library(survminer)
getwd()
data <- read.csv("Early_ER_survival_2.csv", header = T, sep = ",")
mySurv <- Surv(time=data$days_to_last_followup, event = data$vital_status)
class (mySurv)
head(mySurv)
myfit <- survfit(mySurv~data$NLGN3)
myfit 
median(data$days_to_last_followup)
plot(myfit)
table(data$days_to_last_followup)
plot(myfit, col = c("red", "blue"))
plot(myfit, col = c("red", "blue"),mark=3)
legend("topright", c("no_alteration", "alteration"), col=c("red","blue"),lty=1)
abline(h=0.5)
abline(v=1500)
survdiff(mySurv~data$NLGN3)
#plot(myfit, fun="event")
coxph(mySurv~data$NLGN3)
ggsurvplot(myfit, data = data, pval = TRUE)

