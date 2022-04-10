#6a
sd = 8
mean = 50

set.seed(100)
rndm = rnorm(100, mean, sd)
x1 = floor(mean(rndm))
x2 = ceiling(mean(rndm))
temp = pnorm(x2, mean, sd, lower.tail = TRUE) - pnorm(x1, mean, sd, lower.tail = TRUE)
cat("Distribusi normal P(X1 <= x <= X2) = ", temp)

z_x1 = (x1-mean)/sd
z_x2 = (x2-mean)/sd
cat("Z-Score X1 = ", z_x1)
cat("\nZ-Score X2 = ", z_x2)

par(mfrow = c(2,1))
plot(rndm, type = "l")

#6b
hist(rnorm(100, mean, sd), breaks = 50, main = "5025201275_Moh. Ilham Fakhri Zamzami_E_DNHistogram", xlab = "Value", ylab = "Frequency")

#6c
var(rnorm(100, mean, sd))