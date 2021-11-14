set.seed(123)

ssw <- vector(mode="numeric", length =15)

for (i in 1:15) ssw[i] <- sum(kmeans(df_scale,centers = i, nstart = 25)$withinss)

plot(1:15, ssw, type = "b", xlab="Numero de clusters",ylab="Suma de cuadrados entre grupos")

cluster7.datos <- kmeans(df_scale,centers = 7, nstart = 25)

pairs(df_scale, col=cluster7.datos$cluster)
nk=7
points(cluster7.datos$centers, col=1:nk)

df_sample$grupos <- cluster7.datos$cluster



#library("dbscan")

kNNdistplot(df_scale,k=7) + abline(h=5)

dbscan_cluster <- dbscan(data=df_scale, eps=5, MinPts = 5)

hullplot(df_scale, dbscan_cluster$cluster)


#componente <- prcomp(df_sample, scale=TRUE)
componente <- prcomp(df_scale, scale=FALSE)
names(componente)
componente$rotation
summary(componente)
