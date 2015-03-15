
mylogit <- glm(flat ~ age_type, data = subsetData, family = "binomial")

summary(mylogit)
