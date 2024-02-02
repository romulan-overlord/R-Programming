dataset = read.csv("Salary_Data - Salary_Data.csv")

library(caTools)
set.seed(123)

split = sample.split(dataset$Salary, SplitRatio = 2/3)
# Split ratio tells us how much goes to our training set

print(split)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

print(test_set)

# Fitting the simple linear regression model using training set

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)
# formula says: predict Salary based on YearsExperience
# for multiple regression, just give formula = Salary ~
# leaving it blank after ~ means use all the other columns to predict Salary

print(regressor)

# Predicting the test set results

y_pred = predict(regressor, newdata = test_set)

print(y_pred)

# Visualizing the Training Set results

# install.packages("ggplot2")
# this package lets us plot stuff

library(ggplot2)    #importing library

ggplot() +
geom_point(aes(x = training_set$YearsExperience,
                y = training_set$Salary),
            colour = "red") + 
  
  geom_point(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
                colour = "blue") + 
  ggtitle("Sick Plot") + 
  xlab("Years of Experience") + 
  ylab("Salary received")


ggplot() + 
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary),
             colour = "red") + 
  geom_line(aes(x = test_set$YearsExperience,
                 y = y_pred),
             colour = "blue") + 
  ggtitle("Prediction Plot") +
  xlab("Years of Experience") + 
  ylab("Salary Received")
