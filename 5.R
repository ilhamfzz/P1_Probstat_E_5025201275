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
var(rexp(100, 3))