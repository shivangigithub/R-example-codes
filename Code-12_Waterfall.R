library ("GenVisR")
my_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/waterfall/cluster1_deleterious.csv", header=TRUE, sep="\t")
my_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/waterfall/cluster_2_deleterious.csv", header=TRUE, sep="\t")
my_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/waterfall/cluster_3_deleterious_curated.csv", header=TRUE, sep="\t")
my_data=read.table(file="/home/ravi/Documents/cbio_oncoprint_data/using_R_package/waterfall/cluster_4_deleterious_curated.csv", header=TRUE, sep="\t")
colnames(my_data)[c(1,2,3)]=c("sample","gene","variant_class")
most_deleterious <- c("missense_deleterious")
waterfall(my_data, fileType = "Custom", variant_class_order = most_deleterious, mainLabelCol="amino.acid.change", mainLabelSize=3, 
          mainLabelAngle = 90)
###removing label
waterfall(my_data, fileType = "Custom", variant_class_order = most_deleterious, main_geneLabSize =9.0,mainLabelSize=25,
          mainLabelAngle = 90)
#save as ratio 1500:900 and 2000:1100