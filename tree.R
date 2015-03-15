library("party")
dtree <- ctree(flat ~ age_type + who.live, data=subsetData)
plot(dtree)
