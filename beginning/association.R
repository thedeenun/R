data <- read.csv('/Users/adeenunabdullee/Code/R101/CS450-Lesson 11/weather.csv')
data
summary(data)
rules <- apriori(data, parameter = list(target="rules"))
rules
inspect(rules)
rules.sorted <- sort(rules, by="lift")
rules.sorted
inspect(rules.sorted)
rules <- apriori(data, parameter = list(supp=0.005, conf=0.8), appearance=list(rhs=c("play=yes","play=no")))
rules.sorted <- sort(rules, by="lift")
inspect(rules)

data <- read.csv("/Users/adeenunabdullee/Code/R101/CS450-Lesson 11/weather.csv",header = TRUE)
fit <- rpart(play ~ outlook + temperature + humidity + windy, method="class",data=data,control=rpart.control(minsplit = 1))
print(fit)
summary(fit)
plot(fit, uniform=TRUE, main="Decision Tree - Play?")
text(fit, use.n=TRUE, all=TRUE, cex=.8)
