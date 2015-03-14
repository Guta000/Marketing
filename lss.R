data = read.table("lss.csv", header = TRUE, sep = ";")

data$X = NULL 
data$X.1 = NULL 
data$X.2 = NULL 
data$X.3 = NULL 
data$X.4 = NULL 
data$X.5 = NULL 
data$X.6 = NULL 
data$X.7 = NULL 


#fake for test
data$why1 = factor(sample(c(0,1), 300, replace = TRUE))
data$why2 = factor(sample(c(0,1), 300, replace = TRUE))
data$why3 = factor(sample(c(0,1), 300, replace = TRUE))
data$why4 = factor(sample(c(0,1), 300, replace = TRUE))

data$reason1 = factor(sample(c(0,1), 300, replace = TRUE))
data$reason2 = factor(sample(c(0,1), 300, replace = TRUE))
data$reason3 = factor(sample(c(0,1), 300, replace = TRUE))

data$wholive = factor(sample(c("дети","семья","на сдачу"), 300, replace = TRUE))

data$decisionMaker = factor(sample(c("вместе","мама","собственник"),300, replace = TRUE))


summary(data)
