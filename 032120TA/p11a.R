data = read.csv('stat111.csv')
cor(data, use = "complete.obs")
pairs(data)