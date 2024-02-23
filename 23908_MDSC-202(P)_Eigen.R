library(geometry)
M = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)

eigen_data = eigen(M)
eigenvalues = eigen_data$values
eigenvectors = eigen_data$vectors
norm_vectors = eigenvectors

for(col in 1:3){
  # norm_vectors[,col] = norm_vectors[,col]/(dot(norm_vectors[,col], norm_vectors[,col], d=NULL))
  dot = 0
  for (x in norm_vectors[,col]){
    dot = dot + x*x
  }
  norm_vectors[,col] = norm_vectors[,col]/sqrt(dot)
}
