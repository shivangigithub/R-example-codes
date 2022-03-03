
library("DESeq2")
library(ggplot2)
countsName <- "http://bioconnector.org/workshops/data/airway_scaledcounts.csv"
#download.file(countsName, destfile = "airway_scaledcounts.csv", method = "auto")

countData <- read.table(file = "Mnemiopsis_count_data.txt", header = T, sep = "\t")
head(countData)
#metaDataName <- "http://bioconnector.org/workshops/data/airway_metadata.csv"
#download.file(metaDataName, destfile = "airway_metadata.csv", method = "auto")

metaData <- read.table(file = "Mnemiopsis_col_data.txt", header = T, sep = "\t")
metaData
dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~condition)
dds
dds <- DESeq(dds)
?DESeq
res <- results(dds)
head(results(dds, tidy=TRUE))
summary(res) #summary of results
res <- res[order(res$padj),]
head(res)
par(mfrow=c(2,3))

plotCounts(dds, gene="ML087114a", intgroup="dex")
plotCounts(dds, gene="ENSG00000179094", intgroup="dex")
plotCounts(dds, gene="ENSG00000116584", intgroup="dex")
plotCounts(dds, gene="ENSG00000189221", intgroup="dex")
plotCounts(dds, gene="ENSG00000120129", intgroup="dex")
plotCounts(dds, gene="ENSG00000148175", intgroup="dex")

par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-3,3)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(res, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col="blue"))
with(subset(res, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))
vsdata <- vst(dds, blind=FALSE)
plotPCA(vsdata, intgroup="dex") #using the DESEQ2 plotPCA fxn we can
