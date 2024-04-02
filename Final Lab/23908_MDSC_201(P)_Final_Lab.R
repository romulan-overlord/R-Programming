library('caTools')
library('ggplot2')

# question 1
M = read.csv('q1_data.csv', header = TRUE)

# (a) finding correlation between months and number of songs
correlation = cor(M)[1,2]

print(correlation)

beta_0 = -12.88728849
beta_1 = 21.12638093

# (b) using regression line found in excel to fit the scatter plot
y_pred = beta_0 + beta_1 * M[,1]

# (c) plotting training set prediction of weekly sales
ggplot() +
  geom_point(aes(x = M$Months,
                 y = M$X.Songs),
             colour = "red") +
  
  geom_line(aes(x = M$Months,
                 y = y_pred),
             colour = "blue") + 
  ggtitle("Regression Line") + 
  xlab("Months") + 
  ylab("Num Songs")


# question 2
M =read.csv('q2_data.csv', header=TRUE)

# (a) fitting a multiple linear regression model
regressor = lm(formula = GGPA ~ ., data = M)
print(regressor)

GGPA_pred = predict(regressor, new_data = M)

ggplot() +
  geom_point(aes(x = M$GRE_Total,
                 y = M$GGPA),
             colour = "red") +
  
  geom_point(aes(x = M$GRE_Total,
                y = GGPA_pred),
            colour = "blue") + 
  ggtitle("MLR Predictions") + 
  xlab("GRE_Total") + 
  ylab("GGPA")

p_values = summary(regressor)$coefficients[2:3,4]

GRE_Total_pval = p_values[1]
UGPA_pval = p_values[2]

print(GRE_Total_pval)
print(UGPA_pval)
