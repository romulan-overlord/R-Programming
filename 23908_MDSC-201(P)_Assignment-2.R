# Simple Linear Regression on ROcket Fuel Data

library(caTools)
library(ggplot2)
set.seed(7)

df = read.csv("RocketFuel.csv")

# we predict Shear Strength based on Age of Propellant

split = sample.split(df$Shear.Strength, SplitRatio = 0.8)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

model = lm(formula = Shear.Strength ~ Age.of.Propellant, data = training_set)

print(model)

y_train_pred = predict(model, training_set)

ggplot() +
  geom_point(aes(x = training_set$Age.of.Propellant,
                 y = training_set$Shear.Strength),
             colour = "red") +
  geom_line(aes(x = training_set$Age.of.Propellant,
                y = y_train_pred),
            colour = "blue") +
  ggtitle("Regression Line Plot")+
  xlab("Age of Propellant") + 
  ylab("Shear Strength")

y_test_pred = predict(model, test_set)

ggplot() +
  geom_point(aes(x = test_set$Age.of.Propellant,
                 y = test_set$Shear.Strength),
             colour = "red") +
  geom_line(aes(x = test_set$Age.of.Propellant,
                y = y_test_pred),
            colour = "blue") +
  ggtitle("Regression Line Plot")+
  xlab("Age of Propellant") + 
  ylab("Shear Strength")

# calculating residuals and plotting them
train_residual = y_train_pred - training_set$Shear.Strength
test_residual = y_test_pred - test_set$Shear.Strength

ggplot() +
  geom_point(aes(x = 1:16,
                 y = train_residual),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")

ggplot() +
  geom_point(aes(x = 1:4,
                 y = test_residual),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")

total_pred = predict(model, df)
total_res = total_pred - df$Shear.Strength

ggplot() +
  geom_point(aes(x = 1:length(total_res),
                 y = total_res),
             colour = "black") + 
  geom_hline(yintercept = 0,
             linetype = "solid",
             color = "red")

# Same procedure on Hardwood dataset

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
