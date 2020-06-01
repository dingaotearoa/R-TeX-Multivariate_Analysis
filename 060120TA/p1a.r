pima = read.table("pima_train.txt", header=TRUE)
pima$type = factor(pima$type)
pima_test = read.table("pima_test.txt", header=TRUE)
pima_test$type = factor(pima_test$type)

# P1

library(MASS)
(pima_lda = lda(type ~ npreg + glu + bp + skin + bmi + ped + age,
                 data = pima, prior = c(0.66, 0.34)))
tab = table(pima$type, predict(pima_lda)$class)
(tab[1,2] + tab[2,1]) / sum(tab)
tabtest = table(pima_test$type, predict(pima_lda,
                                        newdata = pima_test)$class)
(tabtest[1,2] + tabtest[2,1]) / sum(tabtest)

# P2

tabtest
table(pima_test$type)

# P3

(pima_qda = qda(type ~ npreg + glu + bp + skin + bmi + ped + age,
                data = pima, prior = c(0.66, 0.34)))
tab = table(pima$type, predict(pima_qda)$class)
(tab[1,2] + tab[2,1]) / sum(tab)
tabtest = table(pima_test$type, predict(pima_qda,
                                        newdata = pima_test)$class)
(tabtest[1,2] + tabtest[2,1]) / sum(tabtest)

# P4

library(ipred)
mypredict.lda = function(object, newdata) 
  predict(object, newdata = newdata)$class
errorest(type ~ npreg + glu + bp + skin + bmi + ped + age, data = pima, 
         model = lda, estimator="cv", predict = mypredict.lda, 
         est.para = control.errorest(k = 199))
mypredict.qda = function(object, newdata) 
  predict(object, newdata = newdata)$class
errorest(type ~ npreg + glu + bp + skin + bmi + ped + age, data = pima, 
         model = qda, estimator="cv", predict = mypredict.qda, 
         est.para = control.errorest(k = 199))

# P5

logmod = glm(type ~ npreg + glu + bp + skin + bmi + ped + age, 
             data = pima, family = binomial())
summary(logmod)
pclass = predict(logmod, newdata = pima_test, type = "response") > 0.5
table = table(pima_test$type, pclass)
(table[1,2] + table[2,1])/sum(table)


# P6

nd = data.frame(npreg = 5, glu = 111, bp = 81, skin = 33, 
                bmi = 25.1, ped = 0.36, age = 48)
predict(logmod, newdata = nd, type = "response") > 0.5