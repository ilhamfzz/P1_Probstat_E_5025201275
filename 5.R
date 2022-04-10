#5a
dexp(3)

#5b 
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, 3))
set.seed(1)
hist(rexp(100, 3))
set.seed(1)
hist(rexp(1000, 3))
set.seed(1)
hist(rexp(10000, 3))

#5c
mean(rexp(100, 3))
#we can also use (1/λ) to get result mean
var(rexp(100, 3))
#the variance result can also define by (1/λ)^2