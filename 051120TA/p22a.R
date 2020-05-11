library(readxl)
data = read_xls("punting.xls")
maxmod = lm(log(Distance) ~ RStrngth + LStrngth + RFlxible + LFlxible + 
              OStrngth, data = data)
summary(maxmod)
round(vcov(maxmod), 2)
round(cov2cor(vcov(maxmod)), 2)