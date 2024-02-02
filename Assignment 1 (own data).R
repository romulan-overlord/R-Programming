library(caTools)
library(ggplot2)
set.seed(123)

data = read.csv("heart.csv")

split = sample.split(data$target, SplitRatio = 0.7)
training_set = subset(data, split==TRUE)
test_set = subset(data, split==FALSE)

regressor = lm(formula = target ~ ., data = training_set)
print(regressor)

y_pred_train = predict(regressor, newdata = training_set)

ggplot() + 
  geom_point(aes(x = training_set$chol,
                 y = training_set$target),
             colour = "red") + 
  geom_point(aes(x = training_set$chol,
                y = y_pred_train),
            colour = "blue") + 
  ggtitle("Prediction Plot") +
  xlab("Age") + 
  ylab("target")


y_pred_test = predict(regressor, newdata = test_set)

ggplot() + 
  geom_point(aes(x = test_set$chol,
                 y = test_set$target),
             colour = "red") + 
  geom_point(aes(x = test_set$chol,
                 y = y_pred_test),
             colour = "blue") + 
  ggtitle("Prediction Plot") +
  xlab("Cholesterol") + 
  ylab("target")
