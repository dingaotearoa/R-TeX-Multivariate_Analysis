data = read.csv("stat111.csv")
data = na.omit(data)
minmod = lm(log(Exam) ~ 1, data = data)
step(minmod, direction = "forward",
     scope = list(lower = ~ 1,
                  upper = ~ Assignment + S1 + S2 + Project + Test))