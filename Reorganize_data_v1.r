library(tidyr)
library(dplyr)
library(ggplot2)
library(lmPerm)
library(lmerTest)
library(sjPlot)
library(predictmeans)

dat_period_UWS = read.csv("/home/aldo/Desktop/resumen_UWS_results.csv")
datLong_UWS = gather(data = dat_period_UWS, key = subj, value = power, -c(periodc, filecsv))
dat_period_MCS = read.csv("/home/aldo/Desktop/resumen_MCS_results.csv")
datLong_MCS = gather(data = dat_period_MCS, key = subj, value = power, -c(periodc, filecsv))
dat_period = rbind(datLong_UWS, datLong_MCS)
dat_period$filecsv = sub(".csv", "", dat_period$filecsv)
colnames(dat_period)[2] = "FName"

dat_demo = read.csv("/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute_ultradian_clean_v2_1.csv")
dat_demo$Filename_CSV = sub(".csv", "", dat_demo$Filename_CSV)
colnames(dat_demo)[2] = "FName"

dat_period = left_join(dat_period, dat_demo, by = "FName")

# dat_MCS = power_MCS
# rownames(dat_MCS) = paste("period_", c(1:163), sep = "")
# colnames(dat_MCS) = paste("sub", c(1:69), sep = "")
# dat_MCS = as.data.frame(t(dat_MCS))
# dat_MCS$Diag = "MCS"
# 
# dat_UWS = power_UWS
# rownames(dat_UWS) = paste("period_", c(1:163), sep = "")
# colnames(dat_UWS) = paste("sub", c(1:23), sep = "")
# dat_UWS = as.data.frame(t(dat_UWS))
# dat_UWS$Diag = "UWS"
# 
# dat_total = rbind(dat_MCS, dat_UWS)
# dat_total$Diag = as.factor(dat_total$Diag)
# dat_total$Name = paste("patient", c(1:dim(dat_total)[1]), sep = "")
# 
# datLong = gather(data = dat_total, key = Period_num, value = period_val, -c(Name, Diag))
# modelAOV = aovp(period_val ~ Diag * Period_num + Error(as.factor(Name)), data = datLong) #repeated anova
# ggplot( data = datLong[1 : 1840,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[1841 : 3680,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[3680 : 5520,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()
# ggplot( data = datLong[5520 : 7360,], (aes(x = Period_num, y = period_val , fill = Diag))) + geom_boxplot()

modelLME = lmer(suppressWarnings(as.numeric(power)) ~ Diagnosis * periodc + TBI + (1| FName), data = dat_period, REML = FALSE) #repeated anova
plot_model(modelLME, type = "diag")
contrastmeans(modelLME, "Diag * Period_num")

modelAOV = aovp(as.numeric(power) ~ Diagnosis * periodc + Error(as.factor(FName)), data = dat_period) #repeated anova
modelAOV = aov(as.numeric(power) ~ Diagnosis * periodc + Error(as.factor(FName)), data = dat_period) #repeated anova



modelAOV = aov(as.numeric(power) ~ as.factor(Diagnosis) * as.factor(periodc) + Error(as.factor(FName)), data = dat_period) #repeated anova

