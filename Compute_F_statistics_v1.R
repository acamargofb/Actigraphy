X1 <- c(3,2,1,3,2)
X2 <- c(5,3,4,5,3)
X3 <- c(5,6,7,5,6)

X <- cbind(X1, X2,X3)

X1_mean = mean(X1)
X2_mean = mean(X2)
X3_mean = mean(X3)
X_mean = mean(X)

m = ncol(X)
n = nrow(X)

SST = sum((X -X_mean)^2)
dof_sst = m*n-1


SSW = sum(cbind(X1-X1_mean,X2 - X2_mean, X3-X3_mean)^2)
dof_ssw = m*(n-1)

SSB = n*(X1_mean -X_mean)^2 + n*(X2_mean -X_mean)^2 + n*(X3_mean -X_mean)^2
dof_ssb = m - 1

F_statistics = (SSB/dof_ssb)/(SSW/dof_ssw)  # the bigger then Ho can not be accepted


alpha = 0.10

#from table#

# or 
Fc2 = qf(0.90,df1 = dof_ssb, df2 = dof_ssw)

# As Fc is < F_statistics
# then Ho is rechased


qf(0.90,df1 = dof_ssb, df2 = dof_ssw)

var.test(X[,1],X[,2])
library(stats)
anova(X)

diris = data(iris)
library(biotools)

boxM(iris$Sepal.Length, iris$Petal.Length, iris$Species)

?boxM
  