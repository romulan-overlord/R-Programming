# the c function combines stuff in brackets
vec = c(1,2,3,4,5,6)

# indexing starts from 1 in R, for some reason.
print(vec[1])

# for loops in R
for (x in 1:6) {
  print(vec[x])
}

# we can divide, add, multiply or subtract this numerical array by scalars.
print(vec/3)

# declaring matrices
M = matrix(data=c(1,2,3,4), nrow=2, ncol = 2, byrow = TRUE)

# by default, we fill columns first. But by setting byrow = TRUE, we fill rows first.

print(M)

# bind these things in rows
rbind(1:3, 4:6)

# bind these things in columns
M = cbind(c(1,2,3), c(3,4,5), c(2,3,4,5,6,7))

# get the shape of matrix
dim(M)[2]

nrow(M)
ncol(M)

# diaginal elements of M
diag(x=M)

# 2nd column of M
M[,2]

# 1st row of M
M[1,]

# get 2nd row and 1st row in that order
M[c(2,1),]

M[2:3, c(2,1)]

# everything except row 1
M[-1,]

M[1,] = 1:2

class(M)

x = 10L
y = as.numeric(x)

str = "hello world"

nchar(str)

grepl("hel", str)
