library(readxl)
data = read_xls("punting.xls")
minmod = lm(log(Distance) ~ 1, data = data)
maxmod = lm(log(Distance) ~ RStrngth + LStrngth + RFlxible + LFlxible + 
              OStrngth, data = data)
step(minmod, direction = "forward",
     scope = list(lower = ~ 1,
                  upper = ~ RStrngth + LStrngth + RFlxible + LFlxible + 
                    OStrngth))
step(maxmod, direction = "back")
step(minmod, direction = "both",
     scope = list(lower = ~ 1,
                  upper = ~ RStrngth + LStrngth + RFlxible + LFlxible + 
                    OStrngth))
step(maxmod, direction = "both")