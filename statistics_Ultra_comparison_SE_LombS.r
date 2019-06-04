###############################################################################################
###############################################################################################
########################### Resume of the results of 3 Methods ################################
###############################################################################################
###############################################################################################

table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute_ultradian_.csv", header=TRUE, sep=",")
#table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods.csv", header=TRUE, sep=",")


data <- table_data
summary(data)
hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
     main = "WRONG histogram") # and warning
hist(data$n_days_data, breaks = c(4,5,6,7,8,20,40,50,100), freq = TRUE, main = "Histogram")

Group_Subset_MCS <- subset(data, Diagnosis == 'MCS')
Group_Subset_UWS <- subset(data, Diagnosis == 'UWS')

summary(Group_Subset_MCS)
summary(Group_Subset_UWS)


########################################################################
## Checking normality  (if p-value > 0.05 => Normality can be assumed ##
########################################################################

shapiro.test(data$Ultradian_MSA) #==> Normal
shapiro.test(data$Ultradian_Lomb)

shapiro.test(data$MSA_ultradian)
shapiro.test(data$SE_ultradian)


## 1.-  Comparison of Ultradian MSA and Ultradian Lomb-Scargle
########################
### MCS  and UWS   #####
########################

# Diagnosis and MSA
# Ultradian
x <- data$Diagnosis
y <- data$Ultradian_MSA

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# MSA
x <- data$Diagnosis
y <- data$MSA_ultradian

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# SE
x <- data$Diagnosis
y <- data$SE_ultradian

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Lomb-Scargle

x <- data$Diagnosis
y <- data$Ultradian_Lomb    #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#  ANOVA:

summary(aov(lm(data$Ultradian_MSA ~ data$Diagnosis,data = data)))
summary(aov(lm(data$MSA_ultradian ~ data$Diagnosis,data = data)))

# Correlation between Circadian_MSA and Circadian_Lomb
#wilcox.test(y~x, paired=TRUE)
#cor(x,y, method="spearman")

x <- data$Ultradian_MSA
y <- data$Ultradian_Lomb

cor.test(x,y, method="kendall")

#cor.test(x,y) # pearson correlation
# Correlation of only MCS patients for both methods (SE, and Lomb Scargle)

x <- Group_Subset_MCS$Ultradian_MSA
y <- Group_Subset_MCS$Ultradian_Lomb

cor.test(x,y, method="kendall")

# Correlation of only UWS patients for both methods (SE, and Lomb Scargle)

x <- Group_Subset_MCS$Ultradian_MSA
y <- Group_Subset_MCS$Ultradian_Lomb

cor.test(x,y, method="kendall")

#  TBI and Non-TBI Analysis

x<-Group_Subset_MCS$TBI
y<-Group_Subset_MCS$Sig_Ultradian
# Mann-Whitney test
# t-test:
wilcox.test(y~x)

x<-Group_Subset_UWS$TBI
y<-Group_Subset_UWS$Sig_Ultr_LombS
# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# TBI : factor of interest
# Amplitude:  main effect of
shapiro.test(data$Amplitud)
x<-data$TBI
y<-data$Amplitud

wilcox.test(y~x)

summary(aov(lm(data$Amplitud ~ data$TBI,data = data)))


# TBI : factor of interest
# p-value:  main effect of
shapiro.test(data$p_value_Cruse)
x<-data$TBI
y<-data$p_value_Cruse

wilcox.test(y~x)

summary(aov(lm(data$p_value_Cruse ~ data$TBI,data = data)))

# TBI : factor of interest
# Mesor:  main effect of
shapiro.test(data$Mesor)
x<-data$TBI
y<-data$Mesor

wilcox.test(y~x)

summary(aov(lm(data$Mesor ~ data$TBI,data = data)))


# TBI : factor of interest
# IV:  main effect of
shapiro.test(data$IV)
x<-data$TBI
y<-data$IV

wilcox.test(y~x)

summary(aov(lm(data$IV ~ data$TBI,data = data)))

#IS
shapiro.test(data$IS)
x<-data$TBI
y<-data$IS

wilcox.test(y~x)


# TBI : factor of interest
# Ultradian_MSA:  main effect of
shapiro.test(data$Ultradian_MSA)
x<-data$TBI
y<-data$Ultradian_MSA

wilcox.test(y~x)

summary(aov(lm(data$Ultradian_MSA ~ data$TBI,data = data)))

# TBI : factor of interest
# Ultradian_MSA:  main effect of
shapiro.test(data$Ultradian_Lomb)
x<-data$TBI
y<-data$Ultradian_Lomb  ##==> Significant < 0.05

wilcox.test(y~x)

summary(aov(lm(data$Ultradian_Lomb ~ data$TBI,data = data)))

# aov(dependetãs.factor(independent1)*as.factor(indepent2), data=filename)

#####################
#### 2-way ANOVA ####
#####################
# Circadian ~TBI*Diagnosis

summary(aov(lm(data$Circadian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)))
anova2<-aov(data$Circadian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
resid2 <- anova2$residuals
hist(resid2, main="Histogram of residuals", xlab="Residuals")

library(car)

leveneTest(data$Circadian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
summary(anova2)

# Ultradian ~TBI*Diagnosis
summary(aov(lm(data$Ultradian_Lomb ~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)))
anova2<-aov(data$Ultradian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
resid2 <- anova2$residuals
hist(resid2, main="Histogram of residuals", xlab="Residuals")

leveneTest(data$Ultradian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
summary(anova2)

TukeyHSD(anova2)



##############
### MCS  #####
##############

##############
### Ultradian  #####
##############

mea_ultrMSA_MCS <- mean(Group_Subset_MCS$Ultradian_MSA, na.rm = TRUE)
std_ultrMSA_MCS <- sd(Group_Subset_MCS$Ultradian_MSA, na.rm = TRUE)

mea_ultrLombScar_MCS <- mean(Group_Subset_MCS$Ultradian_Lomb, na.rm = TRUE)
std_ultrLombScar_MCS <- sd(Group_Subset_MCS$Ultradian_Lomb, na.rm = TRUE)

###################
### MCS - SE  #####
###################
mea_SE_MCS <- mean(Group_Subset_MCS$SE_ultradian, na.rm = TRUE)
std_SE_MCS <- sd(Group_Subset_MCS$SE_ultradian, na.rm = TRUE)


##############
### UWS  #####
##############

##############
### Ultradian  #####
##############

mea_ultrMSA_UWS <- mean(Group_Subset_UWS$Ultradian_MSA, na.rm = TRUE)
std_ultrMSA_UWS <- sd(Group_Subset_UWS$Ultradian_MSA, na.rm = TRUE)

mea_ultrLombScar_UWS <- mean(Group_Subset_UWS$Ultradian_Lomb, na.rm = TRUE)
std_ultrLombScar_UWS <- sd(Group_Subset_UWS$Ultradian_Lomb, na.rm = TRUE)


###################
### UWS - SE  #####
###################
mea_SE_UWS <- mean(Group_Subset_UWS$SE_ultradian, na.rm = TRUE)
std_SE_UWS <- sd(Group_Subset_UWS$SE_ultradian, na.rm = TRUE)

#mcs
n_ultrMSA_mcs<-length(which(!is.na(Group_Subset_MCS$Ultradian_MSA)))
n_ultrLomb_mcs<-length(which(!is.na(Group_Subset_MCS$Ultradian_Lomb)))

#uws
n_ultrMSA_uws<-length(which(!is.na(Group_Subset_UWS$Ultradian_MSA)))
n_ultrLomb_uws<-length(which(!is.na(Group_Subset_UWS$Ultradian_Lomb)))

##################################################################################
##################################################################################
######################## Exporting to MATLAB mat files ###########################
##################################################################################
##################################################################################


library('R.matlab')
# Ultradian
table_Ultr_MSA_1<- data.frame(C_mean = mea_ultrMSA_MCS, C_sde = std_ultrMSA_MCS/sqrt(n_ultrMSA_mcs))
table_Ultr_MSA_2 <- data.frame(C_mean = mea_ultrMSA_UWS, C_sde = std_ultrMSA_UWS/sqrt(n_ultrMSA_uws))

table_Ultr_MSA <- rbind(table_Ultr_MSA_1, table_Ultr_MSA_2)


writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_UltrMSA_errorplot.mat", data_UltrMSA_errorplot = data.matrix(table_Ultr_MSA))

table_Ultr_Lomb_1<- data.frame(C_mean = mea_ultrLombScar_MCS, C_sde = std_ultrLombScar_MCS/sqrt(n_ultrLomb_mcs))
table_Ultr_Lomb_2 <- data.frame(C_mean = mea_ultrLombScar_UWS, C_sde = std_ultrLombScar_UWS/sqrt(n_ultrLomb_uws))

table_Ultr_Lomb <- rbind(table_Ultr_Lomb_1, table_Ultr_Lomb_2)
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_UltrLomb_errorplot.mat", data_UltrLomb_errorplot = data.matrix(table_Ultr_Lomb))



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



