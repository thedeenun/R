str(iris)
iris_df <- iris
iris_df
species <- as.list(iris_df$Species)
species <- unlist(species)
iris_df <- iris_df[1:4]
iris_df
irisCluster <- kmeans(iris_df, 3, nstart = 20)
irisCluster
irisCluster$cluster
table(irisCluster$cluster, iris$Species)
irisCluster$cluster <- as.factor(irisCluster$cluster)

plot(iris_df[, 3:4], col = (irisCluster$cluster), main = "K-Means result with 3 cluster", pch = 20, cex = 2) #pch คือ ประเภทของจุด
table(irisCluster$cluster, iris$Species)
plot(iris_df[, 3:4], col = (irisCluster$cluster), main = "K-Means result with 3 cluster", pch = 21, cex = 3) #cex คือ ขนาด
table(irisCluster$cluster, iris$Species)
iris.cluster = cbind(iris_df, irisCluster[1])
iris.cluster
