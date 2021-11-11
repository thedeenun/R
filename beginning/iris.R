library(datasets)
data("iris")
names(iris)
summary(iris)
view(iris)

#check missing values
is.na(iris)

#unique value
length(unique(iris))
length(distinct(iris))

plot(iris)
plot(iris$Sepal.Width, iris$Petal.Width)
library(party)

.libPaths()
