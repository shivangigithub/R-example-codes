#-----
Sel_Genes <- read.csv("example.csv", sep = ",", row.names = 1)
head(Sel_Genes)
Bray_distances <-vegdist(Sel_Genes[,1:100], "bray")
Bray_pcoa <-pcoa(Bray_distances)
Bray_pcoa$values[1:2,]
mds.var.per = round(Bray_pcoa$values$Eigenvalues/sum(Bray_pcoa$values$Eigenvalues)*100, 1)
Bray_PCoA_MATRIX <- Bray_pcoa$vectors[,1:2]
Bray_PCoA_MATRIX <- data.frame(Bray_PCoA_MATRIX)

pc <- c(1,2)
jpeg("Bray-PCoA.png", height = 4, width = 4, units = 'in', res = 600)
plot(Bray_pcoa$vectors[,1:2], bg=c(rgb(154, 0, 0, maxColorValue = 255),rgb(169, 169, 169, maxColorValue = 255))[Sel_Genes$TYPE], pch=c(21,22)[Sel_Genes$TYPE], cex=1.3, xlab=paste0("PCo", pc[1], " (", mds.var.per[1], "%)"), ylab=paste0("PCo", pc[2], " (", mds.var.per[2], "%)"))
ordiellipse(Bray_pcoa$vectors[,1:2], Sel_Genes$TYPE, kind="sd", lwd=1, lty=3, draw = "polygon", alpha = 50, col = c(rgb(154, 0, 0, maxColorValue = 255),rgb(169, 169, 169, maxColorValue = 255)))
ordispider(Bray_pcoa$vectors[,1:2], Sel_Genes$TYPE, lty=3, spider ="centroid", lwd=1, col="black")
legend("top", legend = c("KO", "WT"), col = c(rgb(154, 0, 0, maxColorValue = 255),rgb(169, 169, 169, maxColorValue = 255)),lty = c(1,1,1,1), cex=0.7, title = "", border = "white", fill = NULL, bg="white", bty = "n")
abline(h=0, v=0, col = "gray60")
dev.off ()

adonis(Bray_distances ~ Sel_Genes$TYPE)
#OUTPUT will be like this (R2=0.99, pval=0.008**)
#Df SumsOfSqs MeanSqs F.Model      R2 Pr(>F)   
#Sel_Genes$TYPE  1   0.39235 0.39235  1554.8 0.99488  0.008 **
