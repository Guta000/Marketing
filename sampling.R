#fake for test
data = data.frame(factor(sample(c(0,1), 300, replace = TRUE)))
names(data) = c("Name")
data$why1 = factor(sample(c(0,1), 300, replace = TRUE))
data$why2 = factor(sample(c(0,1), 300, replace = TRUE))
data$why3 = factor(sample(c(0,1), 300, replace = TRUE))
data$why4 = factor(sample(c(0,1), 300, replace = TRUE))

data$reason1 = factor(sample(c(0,1), 300, replace = TRUE))
data$reason2 = factor(sample(c(0,1), 300, replace = TRUE))
data$reason3 = factor(sample(c(0,1), 300, replace = TRUE))

data$wholive = factor(sample(c("дети","семья","на сдачу"), 300, replace = TRUE))

data$decisionMaker = factor(sample(c("вместе","мама","собственник"),300, replace = TRUE))
