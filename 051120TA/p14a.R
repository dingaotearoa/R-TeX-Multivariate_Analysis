data = read.csv("stat111.csv")
data = na.omit(data)
maxmod = lm(log(Exam) ~ Assignment + S2 + S1 + Project + Test, 
            data = data)
summary(maxmod)
minamod = lm(log(Exam) ~ Assignment + S2 + Project + Test, data = data)
summary(minamod)