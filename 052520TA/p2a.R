police = read.csv('police.csv')
cm = cor(police, use = "pairwise.complete.obs")
library(corrplot)
corrplot(cm)

# P1
round(sapply(1:7, function(i) 
  factanal(police, factors = i)$PVAL), 3)

# P2
fa.1 = factanal(police, factors = 5)
fa.2 = factanal(police, factors = 5, rotation = "varimax")
fa.3 = factanal(covmat = cov(police), factors = 5, rotation = "varimax")
apply(fa.3$loadings[, c(1:5)] > 0.5, 2, 
      function(x) names(police)[x])
fa.3