###independentently from external dataset########
library(EnhancedVolcano)
rpl <- read.table("/home/ravi/Documents/Volcano.R/Data_volcano..csv", header = TRUE, sep = ",")
head(rpl)
lab <- rpl$Gene.symbol
x<- rpl$logFC
res
y<- rpl$P.Value
lab <-rpl$Gene.symbol
EnhancedVolcano(rpl,
                lab = rpl$Gene.symbol,
                x = 'logFC',
                y = 'P.Value',
                selectLab = NULL,
                title = NULL,
                cutoffLineType = 'twodash',
                cutoffLineWidth = 0.8,
                xlim = c(-8,8),
                xlab = bquote(~Log[2]~ 'fold change'),
                ylim = c(0,12),
                ylab = bquote(~-Log[10]~italic(P)),
                pCutoff = 0.05,
                FCcutoff = 1.0,
                transcriptPointSize = 0.5,
                transcriptLabSize = 4.0,
                colAlpha = 1,
                shape = 19,
                subtitle = NULL,
                legend=c('NS','Log (base 2) fold-change','P value',
                         'P value & Log (base 2) fold-change'),
                legendPosition = 'top',
                legendLabSize = 12,
                legendIconSize = 4.0,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                drawConnectors = FALSE,
                widthConnectors = 0.2,
                colConnectors = 'grey50',
                border = 'full' )
