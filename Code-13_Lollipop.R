library(GenVisR)
##datacuration##
####put "p." prior to amino acid change in input eg G27472R is changed to p.G27472R#########
mutation_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/lolli_R/Maml2_genvisR.csv", header=TRUE, sep="\t")
colnames(mutation_data)[c(1,2,3,4)]=c("gene","amino_acid_change","transcript_name","mutation_type")
MAML2_data=mutation_data[mutation_data$gene=="MAML2",]
lolliplot(MAML2_data, fillCol="NULL", labelCol="amino_acid_change", txtSize=3, txtAngle=20, host="jan2019.archive.ensembl.org")
lolliplot(MAML2_data, fillCol= "NULL", labelCol="amino_acid_change", txtSize=3, txtAngle=20, host="oct2018.archive.ensembl.org")
or 
library(GenVisR)
mutation_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/lolli_R/Maml2_genvisR.csv", header=TRUE, sep="\t")
colnames(mutation_data)[c(1,2,3,4)]=c("gene","amino_acid_change","transcript_name","mutation_type")
par(bg = 'white')
lolliplot(mutation_data, fillCol="mutation_type", labelCol="amino_acid_change", proteinColour = "#999999",  
          txtSize=6, pntSize=5, txtAngle=20, host="oct2018.archive.ensembl.org")
#####removing label########
lolliplot(mutation_data, fillCol="mutation_type", proteinColour = "#999999",  
          txtSize=6, pntSize=5, txtAngle=80, host="oct2018.archive.ensembl.org")