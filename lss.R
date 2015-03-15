data = read.table("lss.csv", header = TRUE, sep = ";")
summary(data)

subsetData = data[-which(names(data) %in% c("Age", "Data", "object","agency","why","reason","source","comments","promo","know.from","payment"))]

outdoorSubset = subsetData[complete.cases(subsetData$outdoor),]
summary(outdoorSubset)

pie(table(subsetData$age_type))
pie(table(subsetData$Sex))
pie(table(subsetData$who.live))
pie(table(subsetData$decision))
barplot(table(subsetData$flat),col=c("darkblue","red", "green", "yellow"))

counts <- table(subsetData$flat,subsetData$age_type)
barplot(counts, col=c("darkblue","red", "green", "yellow"), legend = rownames(counts), beside=TRUE)

reasons = c(sum(!is.na(subsetData$location)),
            sum(!is.na(subsetData$price)),
            sum(!is.na(subsetData$low.rise)),
            sum(!is.na(subsetData$layout)),
            sum(!is.na(subsetData$infrastructure)),
            sum(!is.na(subsetData$philosophy)))

barplot(reasons, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Расположение","Цена", "Малоэтажность", "Планировки","Инфраструктура", "Философия"), beside=TRUE)

sourses = c(sum(!is.na(subsetData$location)),
            sum(!is.na(subsetData$price)),
            sum(!is.na(subsetData$low.rise)),
            sum(!is.na(subsetData$layout)),
            sum(!is.na(subsetData$infrastructure)),
            sum(!is.na(subsetData$philosophy)))

barplot(sourses, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Расположение","Цена", "Малоэтажность", "Планировки","Инфраструктура", "Философия"), beside=TRUE)


library(arules)

transactions = as(subsetData, "transactions");

fsets <- eclat(subsetData, parameter = list(supp = 0.3, minlen = 2))
inspect(fsets)

fsets <- eclat(subsetData, parameter = list(supp = 0.2,minlen = 3))
inspect(fsets)

fsets <- eclat(subsetData, parameter = list(supp = 0.1,minlen = 4))
inspect(fsets)


rules = apriori(transactions, parameter=list(support=0.2, confidence=0.5, target = "rules"))

inspect(rules)

library(arulesViz)

disp_rules = rules[43:51]

plot(disp_rules)
plot(disp_rules, method="graph", control=list(type="items"))



