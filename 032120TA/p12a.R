data = read.csv('stat111.csv')
boxplot(data$Test ~ data$S1, xlab = 'S1', ylab = 'Test')