library(readxl)
data = read_xls("punting.xls")
round(cor(data, use = "pairwise.complete.obs"), 2)
pairs(data, main = "Matrix plot")