data = read.csv('stat111.csv')
attach(mtcars)
par(mfrow = c(1, 2))
plot(data$Assignment, data$Exam, xlab = 'Assignment',
     ylab = 'Exam')
plot(data$Test, data$Exam, xlab = 'Test', ylab = 'Exam')