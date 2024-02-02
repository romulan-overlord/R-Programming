# Multiple Linear Regression
data = read.csv("50_Startups - 50_Startups.csv")

# Encoding the Categorical "State" column
data$State = factor(data$State,
                    levels = c("New York", "California", "FLorida"),
                    labels = c(1,2,3))

library(caTools)
set.seed(123)
split = sample.split(data$Profit, SplitRatio = 0.8)
print(split)
training_set = subset(data, split==TRUE)
test_set = subset(data, split == FALSE)

regressor = lm(formula = Profit ~ ., data = training_set)
print(regressor)

ypred = predict(regressor, newdata = training_set)
print(ypred)
