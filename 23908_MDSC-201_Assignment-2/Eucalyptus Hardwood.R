# Same procedure on Hardwood dataset
library(caTools)
library(ggplot2)
set.seed(7)

df = read.csv("eucalypt_hardwoods.csv")

# predicting hardness based on density
split = sample.split(df$hardness, SplitRatio = 0.7)            

training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

model = lm(formula = hardness ~ density, data = df)
print(model)

y_train_pred = predict(model, training_set)
y_test_pred = predict(model, test_set)

ggplot() +
  geom_point(aes(x = training_set$density,
                 y = training_set$hardness),
             colour = "red") +
  geom_line(aes(x = training_set$density,
                y = y_train_pred),
            colour = "blue") +
  ggtitle("Regression Line Plot")+
  xlab("Density") + 
  ylab("Hardness")

ggplot() +
  geom_point(aes(x = test_set$density,
                 y = test_set$hardness),
             colour = "red") +
  geom_line(aes(x = test_set$density,
                y = y_test_pred),
            colour = "blue") +
  ggtitle("Regression Line Plot")+
  xlab("Density") + 
  ylab("Hardness")

# computing residuals
train_residual = y_train_pred - training_set$hardness
test_residual = y_test_pred - test_set$hardness

ggplot() +
  geom_point(aes(x = 1:length(train_residual),
                 y = train_residual),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")

ggplot() +
  geom_point(aes(x = 1:length(test_residual),
                 y = test_residual),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")

pred = predict(model,df)
total_res = df$hardness - pred
ggplot() +
  geom_point(aes(x = 1:length(total_res),
                 y = total_res),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")
