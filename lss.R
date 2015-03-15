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


summary(data)

library(mclust)

fit <- Mclust(data)

classif = fit$classification # classifn vector
fit
mydata1 = cbind(data, classif) # append to dataset
mydata1[1:10,] #view top 10 rows
fit1=cbind(classif)
rownames(fit1)=rownames(data)
library(cluster)
clusplot(data, fit1, color=TRUE, shade=TRUE,labels=2, lines=0)

table(classif)

mydata1[mydata1$classif == 1,]


transactions = as(data, "transactions");


image(transactions)

rules = apriori(transactions, parameter=list(support=0.1, confidence=0.5))


trans = ""

for(i in ncol(data)){
  is.text = nlevels(data[[i]]) > 2
  t = ""
  for(j in nrow(data)){
    tmp = t
    if(is.text){
      t = paste(tmp,data[j,i], sep=",")
    }else{
      t = paste(tmp,names(data[i]), sep=",")
    }
  }
  
  tmp = trans
  trans = paste(tmp, t, sep ="\n")
}
