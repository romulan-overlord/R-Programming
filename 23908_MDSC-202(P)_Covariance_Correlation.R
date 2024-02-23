# generate a 15x2 matrix, find variance covariance matrix, and correlation coefficient matrix
nrow = 15
ncol = 3
mean = 10
sd = 10
M = matrix((rnorm(nrow*ncol, mean=mean, sd=sd)), nrow=nrow, ncol=ncol)

X_bar = colMeans(M)
sub = matrix(c(X_bar), nrow=nrow, ncol=ncol, byrow=TRUE)
deviations = M - sub

sigma = t(deviations) %*% deviations
print(sigma)

sqrt_matrix = diag(1/sqrt(diag(sigma)))

coeff_matrix = sqrt_matrix %*% sigma %*% sqrt_matrix
print(coeff_matrix)

