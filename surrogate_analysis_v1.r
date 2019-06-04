# This R script is for the surrogate analysis on the actigraphy data based on the paper of Cruze
table_data_surrogate_analysis <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/surrogate_analysis_v3.csv", header=TRUE, sep=",")

data <- table_data_surrogate_analysis
summary(data)


plot(density(na.omit(data$P.value)))

quantile(data$P.value)

quantile(data$P.value, c(.05, .10)) 

p_valuex <- 6.257586905958622e-05