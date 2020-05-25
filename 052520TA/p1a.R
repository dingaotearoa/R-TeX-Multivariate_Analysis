install.packages("tidyr")
library(tidyr)
header = read.table("Nordic.txt", nrows = 1,
                    header = FALSE, 
                    stringsAsFactors = FALSE)
nordic = read.table("Nordic.txt", skip = 1,
                    header = FALSE)
colnames(nordic) = unlist(header)
nor = unite(nordic, "first_Name_Nat", first,Name, Nat)

# P1
d = data.frame(x = nor$SkiJump, y = nor$CrossCountry)
cor(d)
d.pc.cor = prcomp(d[, 1:2], scale = TRUE)
biplot(d.pc.cor)
d.pc.cor
summary(d.pc.cor)

# P3
d$x_adj = d$x - mean(d$x)
d$y_adj = d$y - mean(d$y)
(cm = cor(d[, 1:2]))
(e = eigen(cm))
feat_vec = t(e$vectors)
row_data_adj = t(d[, 3:4])
final_data = data.frame(t(feat_vec %*% row_data_adj))
names(final_data) = c("x", "y")
final_data
d$score.pc1 = -0.7071068 * final_data$x + 0.7071068 *
  final_data$y
d$firt.name.nat = nor$first_Name_Nat

# P7
d = data.frame(x = nor$SkiJump, y = nor$CrossCountry)
d.pc.cov = prcomp(d[, 1:2], scale = FALSE)
biplot(d.pc.cov)
d.pc.cor
summary(d.pc.cov)
d$score.pc1 = -0.001386857 * final_data$x + 0.999999038 *
  final_data$y
d$firt.name.nat = nor$first_Name_Nat