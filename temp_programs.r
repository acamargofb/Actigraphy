### Circadian with actiwatch
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/result_mean_circ_5days2.csv", header=FALSE, sep=",")


data <- table_data

data.spec<- lsp(data$V2, times = data$V1, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)

data.spec<- lsp(data$V2, times  = NULL, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)
