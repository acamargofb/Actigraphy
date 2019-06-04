###############################################################################################
###############################################################################################
########################### Resume of the results of 3 Methods ################################
###############################################################################################
###############################################################################################

table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute.csv", header=TRUE, sep=",")
#table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods.csv", header=TRUE, sep=",")


data <- table_data
summary(data)
sapply(data,sd)


Group_Subset_MCS <- subset(data, Diagnosis == 'MCS')
Group_Subset_UWS <- subset(data, Diagnosis == 'UWS')

summary(Group_Subset_MCS)
summary(Group_Subset_UWS)

########################################################################
## Checking normality  (if p-value > 0.05 => Normality can be assumed ##
########################################################################

shapiro.test(data$Circadian_MSA) #==> Normal
shapiro.test(data$Circadian_Lomb)

shapiro.test(data$MSA)  ##==> Normal
shapiro.test(data$SE)

shapiro.test(data$IS)
shapiro.test(data$RA)
shapiro.test(data$IV)

## 1.-  Comparison of Circadian MSA and Circadian Lomb-Scargle
########################
### MCS  and UWS   #####
########################

# Diagnosis and MSA
# Circadian
x <- data$Diagnosis
y <- data$Circadian_MSA

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# MSA
x <- data$Diagnosis
y <- data$MSA

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# SE
x <- data$Diagnosis
y <- data$SE

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Lomb-Scargle

x <- data$Diagnosis
y <- data$Circadian_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Diagnosis and IS

x <- data$Diagnosis
y <- data$IS

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


# Diagnosis and IV

x <- data$Diagnosis
y <- data$IV

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Diagnosis and RA

x <- data$Diagnosis
y <- data$RA

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

#  ANOVA:

summary(aov(lm(data$Circadian_MSA ~ data$Diagnosis,data = data)))
summary(aov(lm(data$MSA ~ data$Diagnosis,data = data)))

# Correlation between Circadian_MSA and Circadian_Lomb
#wilcox.test(y~x, paired=TRUE)
#cor(x,y, method="spearman")

x <- data$Circadian_MSA
y <- data$Circadian_Lomb

cor.test(x,y, method="kendall")

#cor.test(x,y) # pearson correlation
# Correlation of only MCS patients for both methods (SE, and Lomb Scargle)


x <- Group_Subset_MCS$Circadian_MSA
y <- Group_Subset_MCS$Circadian_Lomb

cor.test(x,y, method="kendall")

# Correlation of only UWS patients for both methods (SE, and Lomb Scargle)


x <- Group_Subset_MCS$Circadian_MSA
y <- Group_Subset_MCS$Circadian_Lomb

cor.test(x,y, method="kendall")

###############################################
#  TBI and Non-TBI Analysis
###################################################


shapiro.test(data$Circadian_Lomb)
x<-Group_Subset_MCS$TBI
y<-Group_Subset_MCS$Circadian_Lomb
# Mann-Whitney test
# t-test:
wilcox.test(y~x)


shapiro.test(data$Circadian_MSA)
x<-Group_Subset_UWS$TBI
y<-Group_Subset_UWS$Circadian_MSA
# Mann-Whitney test
# t-test:
wilcox.test(y~x)

summary(aov(lm(Group_Subset_UWS$Circadian_MSA)))
# TBI : factor of interest
# Amplitude:  main effect of

x<-data$TBI
y<-data$Amplitud

wilcox.test(y~x)

summary(aov(lm(data$Amplitud ~ data$TBI,data = data)))


# TBI : factor of interest
# p-value:  main effect of

x<-data$TBI
y<-data$p_value_Cruse

wilcox.test(y~x)

summary(aov(lm(data$p_value_Cruse ~ data$TBI,data = data)))

# TBI : factor of interest
# Mesor:  main effect of

x<-data$TBI
y<-data$Mesor

wilcox.test(y~x)

summary(aov(lm(data$Mesor ~ data$TBI,data = data)))


# TBI : factor of interest
# IV:  main effect of

x<-data$TBI
y<-data$IV

wilcox.test(y~x)

summary(aov(lm(data$IV ~ data$TBI,data = data)))


# TBI : factor of interest
# IS:  main effect of

x<-data$TBI
y<-data$IS

wilcox.test(y~x)

summary(aov(lm(data$IS ~ data$TBI,data = data)))

# TBI : factor of interest
# RA:  main effect of

x<-data$TBI
y<-data$RA

wilcox.test(y~x)

summary(aov(lm(data$RA ~ data$TBI,data = data)))

# TBI : factor of interest
# Circadian_MSA:  main effect of

x<-data$TBI
y<-data$Circadian_MSA

wilcox.test(y~x)

summary(aov(lm(data$Circadian_MSA ~ data$TBI,data = data)))

# TBI : factor of interest
# Circadian_MSA:  main effect of
shapiro.test(data$Circadian_Lomb)
x<-data$TBI
y<-data$Circadian_Lomb

wilcox.test(y~x)

summary(aov(lm(data$Circadian_Lomb ~ data$TBI,data = data)))


##############
### MCS  #####
##############

##############
### Circadian  #####
##############

mea_circMSA_MCS <- mean(Group_Subset_MCS$Circadian_MSA, na.rm = TRUE)
std_circMSA_MCS <- sd(Group_Subset_MCS$Circadian_MSA, na.rm = TRUE)

mea_circLombScar_MCS <- mean(Group_Subset_MCS$Circadian_Lomb, na.rm = TRUE)
std_circLombScar_MCS <- sd(Group_Subset_MCS$Circadian_Lomb, na.rm = TRUE)

###################
### MCS - SE  #####
###################
mea_SE_MCS <- mean(Group_Subset_MCS$SE, na.rm = TRUE)
std_SE_MCS <- sd(Group_Subset_MCS$SE, na.rm = TRUE)


###########################
### MCS - IS, and IV  #####
###########################
mea_IS_MCS <- mean(Group_Subset_MCS$IS, na.rm = TRUE)
mea_IV_MCS <- mean(Group_Subset_MCS$IV, na.rm = TRUE)

std_IS_MCS <- sd(Group_Subset_MCS$IS, na.rm = TRUE)
std_IV_MCS <- sd(Group_Subset_MCS$IV, na.rm = TRUE)

##############
### UWS  #####
##############

##############
### Circadian  #####
##############

mea_circMSA_UWS <- mean(Group_Subset_UWS$Circadian_MSA, na.rm = TRUE)
std_circMSA_UWS <- sd(Group_Subset_UWS$Circadian_MSA, na.rm = TRUE)

mea_circLombScar_UWS <- mean(Group_Subset_UWS$Circadian_Lomb, na.rm = TRUE)
std_circLombScar_UWS <- sd(Group_Subset_UWS$Circadian_Lomb, na.rm = TRUE)


###################
### UWS - SE  #####
###################
mea_SE_UWS <- mean(Group_Subset_UWS$SE, na.rm = TRUE)
std_SE_UWS <- sd(Group_Subset_UWS$SE, na.rm = TRUE)

#mcs
n_circMSA_mcs<-length(which(!is.na(Group_Subset_MCS$Circadian_MSA)))
n_circLomb_mcs<-length(which(!is.na(Group_Subset_MCS$Circadian_Lomb)))
n_ISIV_mcs <- length(which(!is.na(Group_Subset_MCS$IS)))
#uws
n_circMSA_uws<-length(which(!is.na(Group_Subset_UWS$Circadian_MSA)))
n_circLomb_uws<-length(which(!is.na(Group_Subset_UWS$Circadian_Lomb)))
n_ISIV_uws <- length(which(!is.na(Group_Subset_UWS$IS)))

###########################
### UWS - IS, and IV  #####
###########################
mea_IS_UWS <- mean(Group_Subset_UWS$IS, na.rm = TRUE)
mea_IV_UWS <- mean(Group_Subset_UWS$IV, na.rm = TRUE)

std_IS_UWS <- sd(Group_Subset_UWS$IS, na.rm = TRUE)
std_IV_UWS <- sd(Group_Subset_UWS$IV, na.rm = TRUE)





library('R.matlab')
# Circadian
table_Circ_MSA_1<- data.frame(C_mean = mea_circMSA_MCS, C_sde = std_circMSA_MCS/sqrt(n_circMSA_mcs))
table_Circ_MSA_2 <- data.frame(C_mean = mea_circMSA_UWS, C_sde = std_circMSA_UWS/sqrt(n_circMSA_uws))

table_Circ_MSA <- rbind(table_Circ_MSA_1, table_Circ_MSA_2)


writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_CircMSA_errorplot.mat", data_CircMSA_errorplot = data.matrix(table_Circ_MSA))

table_Circ_Lomb_1<- data.frame(C_mean = mea_circLombScar_MCS, C_sde = std_circLombScar_MCS/sqrt(n_circLomb_mcs))
table_Circ_Lomb_2 <- data.frame(C_mean = mea_circLombScar_UWS, C_sde = std_circLombScar_UWS/sqrt(n_circLomb_uws))

table_Circ_Lomb <- rbind(table_Circ_Lomb_1, table_Circ_Lomb_2)
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_CircLomb_errorplot.mat", data_CircLomb_errorplot = data.matrix(table_Circ_Lomb))

# SE
table_SE_1<- data.frame(C_mean = mea_SE_MCS, C_sde = std_SE_MCS/sqrt(n_circMSA_mcs))
table_SE_2 <- data.frame(C_mean = mea_SE_UWS, C_sde = std_SE_UWS/sqrt(n_circMSA_uws))

table_SE <- rbind(table_SE_1, table_SE_2)
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_SE_errorplot.mat", data_SE_errorplot = data.matrix(table_SE))

# IS and IV
#IS
table_IS_1<- data.frame(C_mean = mea_IS_MCS, C_sde = std_IS_MCS/sqrt(n_ISIV_mcs))
table_IS_2 <- data.frame(C_mean = mea_IS_UWS, C_sde = std_IS_UWS/sqrt(n_ISIV_uws))

table_IS <- rbind(table_IS_1, table_IS_2)
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_IS_errorplot.mat", data_IS_errorplot = data.matrix(table_IS))

#IV
table_IV_1<- data.frame(C_mean = mea_IV_MCS, C_sde = std_IV_MCS/sqrt(n_ISIV_mcs))
table_IV_2 <- data.frame(C_mean = mea_IV_UWS, C_sde = std_IV_UWS/sqrt(n_ISIV_uws))

table_IV <- rbind(table_IV_1, table_IV_2)
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_IV_errorplot.mat", data_IV_errorplot = data.matrix(table_IV))

# Boxplot of the circadian for SE and MSA
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/RBoxplot_Diag_vs_Circadian_MSA.jpg')
boxplot(data$Circadian_MSA/60~data$Diagnosis,  main="Boxplot of Diagnosis vs Circadian MSA", xlab="Diagnosis", ylab="Circadian in hours")
points(factor(data$Diagnosis), data$Circadian_MSA/60, col=3)
dev.off()


# Boxplot of the circadian for Lomb-Scargle
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/RBoxplot_Diag_vs_Circadian_LombScargle.jpg')
boxplot(data$Circadian_Lomb/60~data$Diagnosis,  main="Boxplot of Diagnosis vs Circadian Lomb Scargle", xlab="Diagnosis", ylab="Circadian in hours")
points(factor(data$Diagnosis), data$Circadian_Lomb/60, col=3)
dev.off()




###########################################################################################
###########################################################################################
#########################  Plots using CRS-R ##############################################
#########################                    ##############################################
###########################################################################################
###########################################################################################

## SE and MSA results
# Plots and statistics of the CRS-R  (Auditory) vs Absolute Deviation from 24.18 h

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_AbsDeviation24h18min_SE_vs_CRS_R_Aud.jpg')
plot(Group_Subset_MCS$Abs_dev_24h18_SE, Group_Subset_MCS$audi, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Auditory", xlim=c(0,6), col=c("blue"),  ylim=c(0,5),xlab="Absolute deviation from 24.18h", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Abs_dev_24h18_SE, Group_Subset_UWS$audi, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Auditory", xlim=c(0,6), col=c("red"), ylim=c(0,5), xlab="Absolute deviation from 24.18h", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$Abs_dev_24h18_SE
y <- Group_Subset_MCS$audi
cor.test(x,y, method="kendall")

x <- Group_Subset_UWS$Abs_dev_24h18_SE
y <- Group_Subset_UWS$audi
cor.test(x,y, method="kendall")


# Plots and statistics of the Abs_dev_24h18min vs CRS-R  (Arousal)
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_AbsDeviation24h18minSE_vs_CRS_S_Arousal.jpg')
plot(Group_Subset_MCS$Abs_dev_24h18_SE, Group_Subset_MCS$arousal, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Arousal", xlim=c(0,6), col=c("blue"),  ylim=c(0,5),xlab="Absolute deviation from 24.18h", ylab="CRS-R Arousal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Abs_dev_24h18_SE, Group_Subset_UWS$arousal, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Arousal", xlim=c(0,6), col=c("red"), ylim=c(0,5), xlab="Absolute deviation from 24.18h", ylab="CRS-R Arousal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()


x <- Group_Subset_MCS$Abs_dev_24h18_SE
y <- Group_Subset_MCS$arousal
cor.test(x,y, method="kendall")

x <- Group_Subset_UWS$Abs_dev_24h18_SE
y <- Group_Subset_UWS$arousal
cor.test(x,y, method="kendall")


# Lomb-Scargle

# Plots and statistics of the CRS-R  (Auditory) vs Absolute Deviation from 24.18 h

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_AbsDeviation24h18min_LombS_vs_CRS_R_Aud.jpg')
plot(Group_Subset_MCS$Abs_dev_24h18_Lomb, Group_Subset_MCS$audi, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Auditory", xlim=c(0,6), col=c("blue"),  ylim=c(0,5),xlab="Absolute deviation from 24.18h", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Abs_dev_24h18_Lomb, Group_Subset_UWS$audi, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Auditory", xlim=c(0,6), col=c("red"), ylim=c(0,5), xlab="Absolute deviation from 24.18h", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$Abs_dev_24h18_Lomb
y <- Group_Subset_MCS$audi
cor.test(x,y, method="kendall")

x <- Group_Subset_UWS$Abs_dev_24h18_Lomb
y <- Group_Subset_UWS$audi
cor.test(x,y, method="kendall")


# Plots and statistics of the Abs_dev_24h18min vs CRS-R  (Arousal)
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_AbsDeviation24h18minLombS_vs_CRS_S_Arousal.jpg')
plot(Group_Subset_MCS$Abs_dev_24h18_Lomb, Group_Subset_MCS$arousal, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Arousal", xlim=c(0,6), col=c("blue"),  ylim=c(0,5),xlab="Absolute deviation from 24.18h", ylab="CRS-R Arousal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Abs_dev_24h18_Lomb, Group_Subset_UWS$arousal, main="Plot of Absolute Deviation from 24.18 h vs CRS-R Arousal", xlim=c(0,6), col=c("red"), ylim=c(0,5), xlab="Absolute deviation from 24.18h", ylab="CRS-R Arousal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()


x <- Group_Subset_MCS$Abs_dev_24h18_SE
y <- Group_Subset_MCS$arousal
cor.test(x,y, method="kendall")

x <- Group_Subset_UWS$Abs_dev_24h18_SE
y <- Group_Subset_UWS$arousal
cor.test(x,y, method="kendall")


###  CRS-R  Aud vs Normalized Power of Lomb Scargle

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_LS_CRS_R_Aud_vs_Normalized Power.jpg')
plot(Group_Subset_MCS$Power_Lomb, Group_Subset_MCS$audi, main="Plot of Normalized Power vs CRS-R Auditory", xlim=c(0,400), col=c("blue"),  ylim=c(0.0,5),xlab="Normalized Power", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Power_Lomb, Group_Subset_UWS$audi, main="Plot of Normalized Power vs CRS-R Auditory", xlim=c(0,400), col=c("red"), ylim=c(0.0,5), xlab="Normalized Power", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$Power_Lomb
y <- Group_Subset_MCS$audi
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$Power_Lomb
y <- Group_Subset_UWS$audi
cor.test(x,y, method="kendall")


###  CRS-R  oroverbal vs Normalized Power of Lomb Scargle

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_LS_CRS_R_OroVerbal_vs_Normalized Power.jpg')
plot(Group_Subset_MCS$Power_Lomb, Group_Subset_MCS$comm, main="Plot of Normalized Power vs CRS-R Oroverbal", xlim=c(0,400), col=c("blue"),  ylim=c(0.0,5),xlab="Normalized Power", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Power_Lomb, Group_Subset_UWS$comm, main="Plot of Normalized Power vs CRS-R Oroverbal", xlim=c(0,400), col=c("red"), ylim=c(0.0,5), xlab="Normalized Power", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$Power_Lomb
y <- Group_Subset_MCS$comm
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$Power_Lomb
y <- Group_Subset_UWS$comm
cor.test(x,y, method="kendall")

###  CRS-R  Arousal vs Normalized Power of Lomb Scargle

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_LS_CRS_R_Arousal_vs_Normalized_Power.jpg')
plot(Group_Subset_MCS$Power_Lomb, Group_Subset_MCS$arousal, main="Plot of Normalized Power vs CRS-R Arousal", xlim=c(0,400), col=c("blue"),  ylim=c(0.0,5),xlab="Normalized Power", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$Power_Lomb, Group_Subset_UWS$arousal, main="Plot of Normalized Power vs CRS-R Arousal", xlim=c(0,400), col=c("red"), ylim=c(0.0,5), xlab="Normalized Power", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$Power_Lomb
y <- Group_Subset_MCS$arousal
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$Power_Lomb
y <- Group_Subset_UWS$arousal
cor.test(x,y, method="kendall")


# vs IS


###  CRS-R  Aud vs IS

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_CRS_R_Aud_vs_IS.jpg')
plot(Group_Subset_MCS$IS, Group_Subset_MCS$audi, main="Plot of IS vs CRS-R Auditory", xlim=c(0,1), col=c("blue"),  ylim=c(0.0,5),xlab="Normalized Power", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IS, Group_Subset_UWS$audi, main="Plot of IS vs CRS-R Auditory", xlim=c(0,1), col=c("red"), ylim=c(0.0,5), xlab="Normalized Power", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IS
y <- Group_Subset_MCS$audi
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$IS
y <- Group_Subset_UWS$audi
cor.test(x,y, method="kendall")


###  CRS-R  oroverbal vs IS

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_CRS_R_OroVerbal_vs_IS.jpg')
plot(Group_Subset_MCS$IS, Group_Subset_MCS$comm, main="Plot of IS vs CRS-R Oroverbal", xlim=c(0,1), col=c("blue"),  ylim=c(0.0,5),xlab="IS", ylab="CRS-R Oroverbal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IS, Group_Subset_UWS$comm, main="Plot of IS vs CRS-R Oroverbal", xlim=c(0,1), col=c("red"), ylim=c(0.0,5), xlab="IS", ylab="CRS-R Oroverbal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IS
y <- Group_Subset_MCS$comm
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$Power_Lomb
y <- Group_Subset_UWS$comm
cor.test(x,y, method="kendall")

###  CRS-R  Arousal vs IS

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_LS_CRS_R_Arousal_vs_IS.jpg')
plot(Group_Subset_MCS$IS, Group_Subset_MCS$arousal, main="Plot of IS vs CRS-R Arousal", xlim=c(0,1), col=c("blue"),  ylim=c(0.0,5),xlab="IS", ylab="CRS-R Arousal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IS, Group_Subset_UWS$arousal, main="Plot of IS vs CRS-R Arousal", xlim=c(0,1), col=c("red"), ylim=c(0.0,5), xlab="IS", ylab="CRS-R Arousal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IS
y <- Group_Subset_MCS$arousal
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$IS
y <- Group_Subset_UWS$arousal
cor.test(x,y, method="kendall")



# vs IV


###  CRS-R  Aud vs IV

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_CRS_R_Aud_vs_IV.jpg')
plot(Group_Subset_MCS$IV, Group_Subset_MCS$audi, main="Plot of IV vs CRS-R Auditory", xlim=c(0,3), col=c("blue"),  ylim=c(0.0,5),xlab="IV", ylab="CRS-R Auditory", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IV, Group_Subset_UWS$audi, main="Plot of IV vs CRS-R Auditory", xlim=c(0,3), col=c("red"), ylim=c(0.0,5), xlab="IV", ylab="CRS-R Auditory", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IV
y <- Group_Subset_MCS$audi
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$IV
y <- Group_Subset_UWS$audi
cor.test(x,y, method="kendall")


###  CRS-R  oroverbal vs IV

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_CRS_R_OroVerbal_vs_IV.jpg')
plot(Group_Subset_MCS$IV, Group_Subset_MCS$comm, main="Plot of IV vs CRS-R Oroverbal", xlim=c(0,3), col=c("blue"),  ylim=c(0.0,5),xlab="IV", ylab="CRS-R Oroverbal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IV, Group_Subset_UWS$comm, main="Plot of IV vs CRS-R Oroverbal", xlim=c(0,3), col=c("red"), ylim=c(0.0,5), xlab="IV", ylab="CRS-R Oroverbal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IV
y <- Group_Subset_MCS$comm
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$IV
y <- Group_Subset_UWS$comm
cor.test(x,y, method="kendall")

###  CRS-R  Arousal vs IV

jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/Rplot_LS_CRS_R_Arousal_vs_IV.jpg')
plot(Group_Subset_MCS$IV, Group_Subset_MCS$arousal, main="Plot of IV vs CRS-R Arousal", xlim=c(0,3), col=c("blue"),  ylim=c(0.0,5),xlab="IV", ylab="CRS-R Arousal", pch=12)
par(new=TRUE)
plot(Group_Subset_UWS$IV, Group_Subset_UWS$arousal, main="Plot of IV vs CRS-R Arousal", xlim=c(0,3), col=c("red"), ylim=c(0.0,5), xlab="IV", ylab="CRS-R Arousal", pch=5)
par(new=FALSE)

legend("topleft", legend=c("MCS", "UWS"), col=c("blue", "red"), pch=c(12,5), lty=1:2, cex=0.8)
dev.off()

x <- Group_Subset_MCS$IV
y <- Group_Subset_MCS$arousal
cor.test(x,y, method="kendall")


x <- Group_Subset_UWS$IV
y <- Group_Subset_UWS$arousal
cor.test(x,y, method="kendall")



