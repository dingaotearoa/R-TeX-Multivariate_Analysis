data = read.csv("stat111.csv")
# data = na.omit(data)
temp = data[!is.na(data$Test) & !is.na(data$Exam),]
# My Method
data_TE = cbind(temp$Test, temp$Exam)
data_TE_center = c(mean(temp$Test), mean(temp$Exam))
data_TE_MD = mahalanobis(data_TE, data_TE_center, cov(data_TE))
data_TE_MD_Sqr = data_TE_MD ^ 2
qqnorm(data_TE_MD_Sqr, pch = 1, frame = FALSE,
       main = "QQ plot of the squared Mahalanobis distances")
qqline(data_TE_MD_Sqr, col = "steelblue", lwd = 2)
# Lab Method
library(mixtools)
data_TE = data.frame(temp$Test, temp$Exam)
n = nrow(data_TE)
samplemean = apply(data_TE, MARGIN = 2, FUN = mean)
samplecov = var(data_TE)
dists = apply(data_TE, 1, FUN = function(x) 
  (x - samplemean) %*% solve(samplecov) %*% t(x - t(samplemean)))
probs = ((1 : n) - 0.5) / n
qdists = qchisq(probs, df = 2)
plot(sort(dists), qdists, 
     main = "QQ plot of the squared Mahalanobis distances", 
     xlab = "Squared distances of data from mean", 
     ylab = "Chi-squared quantiles")
abline(0, 1)