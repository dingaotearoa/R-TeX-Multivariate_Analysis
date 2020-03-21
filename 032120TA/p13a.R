data = read.csv('stat111.csv')
library(scatterplot3d)
with(data, scatterplot3d(Assignment, Test, Exam, type = "h"))