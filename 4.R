x = 2
v = 10
#4a Chi-Square distribution probabilities
dchisq(x, v)

#4b Chi-Square distribution with 100 random data
temp = rchisq(100, v)
hist(temp)

#4c variance of Chi-Square distribution is 2*mean
mean = v
mean
variance = 2*v
variance