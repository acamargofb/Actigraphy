rm(list = ls()); graphics.off(); cat("\014")

library(tidyr)
library(dplyr)
library(ggplot2)
# library(lmPerm)
library(lmerTest)
# library(sjPlot)
library(predictmeans)

#------------------------------- Load and organize data ----------------------------#
dat_period_UWS = read.csv("/home/aldo/Desktop/resumen_UWS_results.csv")
dat_period_MCS = read.csv("/home/aldo/Desktop/resumen_MCS_results.csv")

datTmp_UWS = dat_period_UWS[, c("periodc", "power", "filecsv")]
colTmp_UWS = lapply(1:22, function(x) paste(colnames(datTmp_UWS), x, sep = "."))
datLst_UWS = lapply(colTmp_UWS, function(x) 
{
  dd = dat_period_UWS[, x]
  names(dd) = colnames(datTmp_UWS)
  return(dd)
})
dat_UWS = rbind(datTmp_UWS, do.call("rbind", datLst_UWS))

datTmp_MCS = dat_period_MCS[, c("periodc", "power", "filecsv")]
colTmp_MCS = lapply(1:65, function(x) paste(colnames(datTmp_MCS), x, sep = "."))
datLst_MCS = lapply(colTmp_MCS, function(x) 
{
  dd = dat_period_MCS[, x]
  names(dd) = colnames(datTmp_MCS)
  return(dd)
})
dat_MCS = rbind(datTmp_MCS, do.call("rbind", datLst_MCS))

dat_period = rbind(dat_UWS, dat_MCS)
dat_period$filecsv = sub(".csv", "", dat_period$filecsv)
colnames(dat_period)[3] = "FName"

dat_demo = read.csv("/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute_ultradian_clean_v2_1.csv")
dat_demo$Filename_CSV = sub(".csv", "", dat_demo$Filename_CSV)
colnames(dat_demo)[2] = "FName"

dat_period = left_join(dat_period, dat_demo, by = "FName")
#------------------------------- Stats ----------------------------------#

# datLong = gather(data = dat_total, key = Period_num, value = period_val, -c(Name, Diag))
# modelAOV = aovp(period_val ~ Diag * Period_num + Error(as.factor(Name)), data = datLong) #repeated anova
# ggplot( data = datLong[1 : 1840,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[1841 : 3680,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[3680 : 5520,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[5520 : 7360,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()

dat_period$periodc = as.factor(dat_period$periodc)
modelLME = lmer(power ~ Diagnosis * (periodc) + 
                  (1| FName) + (1|periodc), data = dat_period) #Linear mixed model

modelLME = lme(power ~  (periodc) * Diagnosis,
                  random = ~1| periodc/Name,
               data = dat_period, method = "ML") #Linear mixed model

plot_model(modelLME, type = "diag")
contrastmeans(modelLME, "Diag * Period_num")

modelAOV = aovp(power ~ Diagnosis * as.factor(periodc) + Error(as.factor(FName)), data = dat_period) #repeated anova with permutation
modelAOV = aov(power ~ Diagnosis * as.factor(periodc) + Error(as.factor(FName)), data = dat_period) #repeated anova



meansUWS = rowMeans(dat_period_UWS[seq(from = 2, to = 69, by = 3)])
meansMCS = rowMeans(dat_period_MCS[seq(from = 2, to = 198, by = 3)])

sumUWS = rowSums(dat_period_UWS[seq(from = 2, to = 69, by = 3)])
sumMCS = rowSums(dat_period_MCS[seq(from = 2, to = 198, by = 3)])



