# Finding variance covariance in HeartAttack dataset

library('caTools')

df = read.csv('./heart.csv')
# dropping the target column
# df = subset(df, select = -c(target))

# all the columns are numerical in this dataset
# converting dataframe to matrix
M = as.matrix(df)
dims = dim(M)

# defining the identity matrix
ID = diag(nrow = dims[1], ncol = dims[1])

# defining the matrix of ones
One_Mat = matrix(1, nrow=dims[1], ncol=dims[1])

# calculating the variance covariance matrix
sigma = t(M)%*%(ID - One_Mat/(dims[1]))%*%M

# finding the squareroot matrix
sqrt_matrix = diag(1/sqrt(diag(sigma)))

# calculating the correlation coefficient matrix
coeff_matrix = sqrt_matrix %*% sigma %*% sqrt_matrix
print(coeff_matrix)

rounded_coeff = round(coeff_matrix, digits = 2)


heatmap(coeff_matrix)

# Load the package
library(gplots)

# Assuming `data` is your matrix
heatmap.2(rounded_coeff, cellnote = rounded_coeff, notecex = 1.0, notecol = "black", na.color = par("bg"), trace = "none", Rowv = NA, Colv = NA)

