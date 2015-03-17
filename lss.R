data = read.table("lss.csv", header = TRUE, sep = ";")
summary(data)

subsetData = data[-which(names(data) %in% c("Age", "Data", "object","agency","why","reason","source","comments","promo","know.from","payment"))]

pie(table(data$object))
pie(table(data$payment))


outdoorSubset = subsetData[complete.cases(subsetData$outdoor),]
summary(outdoorSubset)
internetSubset = subsetData[complete.cases(subsetData$internet),]
summary(internetSubset)

internetPromo = subsetData[complete.cases(subsetData$ifPromo),]
summary(internetPromo)


pie(table(subsetData$age_type))
pie(table(subsetData$Sex))
pie(table(subsetData$who.live))
pie(table(subsetData$decision))
barplot(table(subsetData$flat),col=c("darkblue","red", "green", "yellow"))

counts <- table(subsetData$flat,subsetData$decision)
barplot(counts, col=c("darkblue","red", "green", "yellow"), legend = rownames(counts), beside=TRUE)

counts <- table(data$flat,data$payment)
barplot(counts, col=c("darkblue","red", "green", "yellow"), legend = rownames(counts), beside=TRUE)


reasons = c(sum(!is.na(subsetData$location)),
            sum(!is.na(subsetData$price)),
            sum(!is.na(subsetData$low.rise)),
            sum(!is.na(subsetData$layout)),
            sum(!is.na(subsetData$infrastructure)),
            sum(!is.na(subsetData$philosophy)))

barplot(reasons, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Расположение","Цена", "Малоэтажность", "Планировки","Инфраструктура", "Философия"), beside=TRUE)


reasonsOutdor = c(sum(!is.na(outdoorSubset$location)),
            sum(!is.na(outdoorSubset$price)),
            sum(!is.na(outdoorSubset$low.rise)),
            sum(!is.na(outdoorSubset$layout)),
            sum(!is.na(outdoorSubset$infrastructure)),
            sum(!is.na(outdoorSubset$philosophy)))

barplot(reasonsOutdor, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Расположение","Цена", "Малоэтажность", "Планировки","Инфраструктура", "Философия"), beside=TRUE)

reasonsInternet = c(sum(!is.na(internetSubset$location)),
                  sum(!is.na(internetSubset$price)),
                  sum(!is.na(internetSubset$low.rise)),
                  sum(!is.na(internetSubset$layout)),
                  sum(!is.na(internetSubset$infrastructure)),
                  sum(!is.na(internetSubset$philosophy)))

barplot(reasonsInternet, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Расположение","Цена", "Малоэтажность", "Планировки","Инфраструктура", "Философия"), beside=TRUE)


sourses = c(sum(!is.na(subsetData$internet)),
            sum(!is.na(subsetData$from.agancy)),
            sum(!is.na(subsetData$outdor)),
            sum(!is.na(subsetData$construction)),
            sum(!is.na(subsetData$newspaper)),
            sum(!is.na(subsetData$kith)),
            sum(!is.na(subsetData$exhibition)),
            sum(!is.na(subsetData$SMS)))

barplot(sourses, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose","magenta","black"),axisnames = TRUE,  
        names.arg = c("Интернет","Агентство", "Наружная реклама", "Стройка","Газета", "Знакомые","Выставка","СМС"), beside=TRUE)


reasons = c(sum(!is.na(subsetData$new.house)),
            sum(!is.na(subsetData$for.kids)),
            sum(!is.na(subsetData$investment)),
            sum(!is.na(subsetData$improvement)),
            sum(!is.na(subsetData$relocation)),
            sum(!is.na(subsetData$for.parents)))

barplot(reasons, col=c("darkblue","red", "green", "yellow","lightblue", "mistyrose"),axisnames = TRUE,  
        names.arg = c("Новое жилье","Для детей", "Инвестиции", "Улучшение условий","Переезд", "Для родителей"), beside=TRUE)


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



