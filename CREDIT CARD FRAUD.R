#packages
library(ranger)
library(caret)
library(data.table)

#importing Dataset
creditcard_data <- read.csv("C:/Users/bmish/OneDrive/Documents/creditcard 2.csv")

#sequence in table
dim(creditcard_data)

#front and back of data 
head(creditcard_data)
tail(creditcard_data)

#no. of creditcard data and class
table((creditcard_data $ Class))

#quadrant and min max mean
summary(creditcard_data $ Amount)

#name of all the column
names(creditcard_data)

#variance and standard deviation
var(creditcard_data $ Amount)
sd(creditcard_data $ Amount)

#head and decrement of time column
head(creditcard_data)
creditcard_data $ Amount=scale( creditcard_data $ Amount)
New_Data=creditcard_data[,-c(1)]
head(New_Data)

#train and test data& dimension (Data modeling) 
library(caTools)
set.seed(123)
data_sample=sample.split(New_Data $ Class , SplitRatio = 0.8)           
train_data=subset(New_Data,data_sample==TRUE)
test_data=subset(New_Data,data_sample==FALSE)
dim(train_data)
dim(test_data)

#logistic model
Logistic_Model=glm(Class~.,test_data,family=binomial())
summary(Logistic_Model)

#plot 4
plot(Logistic_Model)

