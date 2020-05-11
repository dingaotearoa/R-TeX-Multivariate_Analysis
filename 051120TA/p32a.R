x = c(0, 1, 1, 2)
y = c(-1, -1, 1, 1)
slr = lm(y ~ x)
vcov(slr)
round(cov2cor(vcov(slr)), 2)
plot(x, y, xlab = "X", ylab = "y", main = "Simple linear regression")
abline(slr)
legend("bottomright", legend = "Fitted regression line", col = "black", 
       lty = 1: 2, cex = 0.8)