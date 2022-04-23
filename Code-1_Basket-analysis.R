####This is changed by shivangi in sourcetree project
getwd()
setwd("/home/ravi/Documents/basket_analysis/pratima_Basket_analysis/")
#df_groceries <- read.csv("selected_mutation_data_patients_3_2.csv")
df_groceries <- read.csv("uniq_out_hnscc_basket_dead.csv")
str(df_groceries)
df_sorted <- df_groceries[order(df_groceries$Member_number),]
df_sorted$Member_number <- as.numeric(df_sorted$Member_number)
df_sorted$itemDescription <- as.factor(df_sorted$itemDescription)
str(df_sorted)
if(sessionInfo()['basePkgs']=="dplyr" | sessionInfo()['otherPkgs']=="dplyr"){
  detach(package:dplyr, unload=TRUE)
}

library(plyr)
df_itemList <- ddply(df_groceries,("Member_number"),function(df1)paste(df1$itemDescription, collapse = ","))            
df_itemList
df_itemList$Member_number <- NULL
##df_itemList$Date <- NULL
colnames(df_itemList) <- c("itemList")
write.csv(df_itemList,"Itemlist_dead.csv", quote = FALSE, row.names = TRUE)

library(arules)
txn = read.transactions(file="Itemlist_dead.csv", rm.duplicates= FALSE, format="basket",sep=",",cols=1);
txn
txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels)
basket_rules <- apriori(txn,parameter = list(sup = 0.03, conf = 0.6,target="rules",minlen = 1, maxtime =10000, maxlen =100));
if(sessionInfo()['basePkgs']=="tm" | sessionInfo()['otherPkgs']=="tm"){
  detach(package:tm, unload=TRUE)
}
inspect(basket_rules)
df_basket <- as(basket_rules,"data.frame")
View(df_basket)
write.csv(df_basket, "result.csv")
itemFrequencyPlot(txn, topN = 10)
library(arulesViz)
plot(basket_rules)
plot(basket_rules, method = "grouped", control = list(k = 10))
plot(basket_rules, method="graph", control=list(type="items"))
plot(basket_rules, method = "graph", interactive = TRUE, shading = NA)
#itemFrequencyPlot(txn, support = 0.05)
itemFrequencyPlot(txn, topN = 10)
itemFrequency(txn[, 1:3])
##a visualization of the sparse matrix for the first five transactions
image(txn[1:5])
##visualization of a random sample of 100 transactions
image(sample(txn, 100))

