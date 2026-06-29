##########HW7##########
#install.packages("devtools") 
library("devtools") #to install packages from github
install_github("moldach/vapoRwave") #I used this package in ggplot functions
#######################

#a
coursedata <- data.frame(cw=c(5,5,10,12,14,16),exam=c(38,45,69,65,75,96))
attach(coursedata)

#b
library(ggplot2)
library(vapoRwave)
options(warn=-1) #ggplot gives unimportant warnings, i suppressed them 
ggplot(coursedata, aes(x=cw, y=exam)) + 
  geom_point(color="#FFB967",size=2, shape=21)+
  labs(y="Exam \nMarks", x="Coursework Marks",title="Economics Class")+
  new_retro(font = "Times New Roman") +
  scale_x_continuous(breaks = seq(0, 20, by = 2))+
  scale_y_continuous(breaks = seq(0, 100, by = 10))

#c
lfit <- lm(exam ~ cw, coursedata)

#d
lfit[["coefficients"]][["cw"]]

#e
fitted(lfit)

#f
ggplot(coursedata, aes(x=cw, y=exam)) + 
  geom_point(color="#FFB967",size=2, shape=21)+
  labs(y="Exam \nMarks", x="Coursework Marks",title="Economics Class")+
  new_retro(font = "Times New Roman")+
  geom_smooth(formula= y ~ x, method="lm", color = "#FA5F70FF")+
  scale_x_continuous(breaks = seq(0, 20, by = 2))+
  scale_y_continuous(breaks = seq(0, 100, by = 10))

#g
coursedata$cwp <- cw/100

#h
pfit <- lm(exam ~ cwp, coursedata)

#i
fitted(pfit) #did not change the fitted values
lfit[["coefficients"]]
pfit[["coefficients"]] 
"changed only the coefficient of cwp"

#j
coursedata$exampredicted <- predict(lfit)
coursedata$exampredicted[cw==10]

#k
fullmarksdata <- data.frame(cw=20) #we could use this way in step #j
predict(lfit, newdata =fullmarksdata)
"full mark on coursework gets a note of 107.0348 
and this is higher than maximum exam point of 100"

coef(summary(lfit))[, 4] #prints the p-values of coefficients
"p value of 0.057292171 for the intercept is 
statistically insignificant for 0.05 level"

coef(summary(lfit))[, 2] #prints the standard errors
"standard error of 7.3262947 for the intercept gives a clue 
since the prediction gave a result of 107.0348"

"it can also be seen from that the minimum cw marks of 5/20 
which are 25/100 in hundred system corresponds to exam marks of
38/100 and 45/100"

#l
#install.packages("lmtest")
library(lmtest)
bptest(lfit, studentize=FALSE)

"P-value is 0.49743, we fail to reject the null hypothesis. 
We do not have sufficient evidence to say that heteroscedasticity 
is present in the regression model. and the scatterplot we created 
above supports this
"

#m
"since there is only one predictor variable in equation exam ~ cw,
multicollinearity is irrelevant."

