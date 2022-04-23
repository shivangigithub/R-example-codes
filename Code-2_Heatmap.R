##shivangi branch
###changed again
#####Changed by shivangi email
library(pheatmap)
library("RColorBrewer")
setwd("/home/ravi/Documents/R_heatmap/complexheatmap/Heatmap_all_classes/")
test<-read.csv("all_DE_2.csv",sep="\t", row.names=1)
test
test_ref<-read.csv("all_DE_2.csv",sep="\t")


#y<-data.matrix(test)
#pheatmap(test)
#pheatmap(test, scale = "row", clustering_distance_rows = "correlation")
#pheatmap(test, scale = "row", color = colorRampPalette(c("navy", "white", "firebrick3"))(50))
#pheatmap(test, scale = "row", color = colorRampPalette(c("navy", "white", "firebrick3"))(50),fontsize_row = 7.5, fontsize_col = 15)


library(ComplexHeatmap)
library(circlize)
library(colorspace)
library(GetoptLong)
Heatmap(test)

Heatmap(test,show_row_names = FALSE, km = 15)

Heatmap(test, row_km = 2, column_km = 3, border = TRUE)
Heatmap(test, rect_gp = gpar(col = "white", lwd = 2))


kclus <- kmeans(test,15)
kclus$cluster
table(test_ref$Gene,kclus$cluster)

split <- paste0("Cl\n", kclus$cluster)
default.hmap <- Heatmap(test, split=split)
default.hmap
split <- factor(paste0("Cluster\n", kclus$cluster), levels=c("Cluster\n2","Cluster\n1","Cluster\n3","Cluster\n4","Cluster\n5"))
reorder.hmap <- Heatmap(test, split=split)

