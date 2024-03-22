# Given a positive definite square matrix, find its squareroot matrix

# setting dimension of matrix
n = 3

# setting matrix input
mat_in = c(2, 0, 0, 0, 2, 0, 0, 0, 3)

# defining matrix
M = matrix(mat_in, nrow=n, ncol=n)

# getting eigen values and eigen vectors
eigen_data = eigen(M)

# note: eigen(M) handles repeated eigen values internally, so eigen vectors are not repeated.

# getting squareroot of eigen values for lambda^-1
sqrt_eigvals = sqrt(eigen_data$values)

# constructing lambda (diagonal matrix)
lambda = diag(sqrt_eigvals)

# calculating squareroot matrix
sqrt_M = eigen_data$vectors %*% lambda %*% solve(eigen_data$vectors)

print("Square root of M:")
print(sqrt_M)
