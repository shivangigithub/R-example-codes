#K-means clustering in R
#Optimization of number of clusters using three methods
#####ELBOW METHOD###########

set.seed(13)
wss <- (nrow(df)-1)*sum(apply(df,2,var))
for (i in 2:12) wss[i] <- sum(kmeans(df,
                                     centers=i)$withinss)
plot(1:12, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

##printing to file### 
set.seed(13)
wss <- (nrow(df)-1)*sum(apply(df,2,var))
for (i in 2:12) wss[i] <- sum(kmeans(df,
                                     centers=i)$withinss)
jpeg (file = paste(wss[i], '.jpg'))
plot(1:12, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
dev.off()

##Method2:SILHOUETTE ANALYSIS##

library(fpc)
set.seed(13)
pamk.best2 <- pamk(df)
cat("number of clusters estimated by optimum average silhouette width:", pamk.best2$nc, "\n")

number of clusters estimated by optimum average silhouette width: 5 

##Method2:GAP STATISTICS##

library(cluster)
set.seed(13)
clusGap(df, kmeans, 10, B = 100, verbose = interactive())
Clustering k = 1,2,..., K.max (= 10): .. done
Bootstrapping, b = 1,2,..., B (= 100)  [one "." per sample]:
  .................................................. 50 
.................................................. 100 
Clustering Gap statistic ["clusGap"] from call:
  clusGap(x = df, FUNcluster = kmeans, K.max = 10, B = 100, verbose = interactive())
B=100 simulated reference sets, k = 1..10; spaceH0="scaledPCA"
--> Number of clusters (method 'firstSEmax', SE.factor=1): 5


results <- kmeans(df,5)
results$cluster
results$size
table(data$Gene_name,results$cluster)
library("factoextra")
fviz_cluster(results, data = df)