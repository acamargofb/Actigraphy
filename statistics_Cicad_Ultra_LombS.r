###############################################################################################
###############################################################################################
########################### Statistical Analysis for 4d,5d,6d, and 7d #########################
###############################################################################################
###############################################################################################
######## 14-16/11/18 :   Correlation of Circadian with days since insult for MCS and UWS#######
###############################################################################################
###############################################################################################


#table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute_ultradian_clean.csv", header=TRUE, sep=",")
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods_crs_r_no_acute_ultradian_clean_v2_1.csv", header=TRUE, sep=",")
#table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/CSV_Results/csv_Result_4Methods.csv", header=TRUE, sep=",")


data <- table_data
summary(data)

Group_Subset_MCS <- subset(data, Diagnosis == 'MCS')
Group_Subset_UWS <- subset(data, Diagnosis == 'UWS')

summary(Group_Subset_MCS)
summary(Group_Subset_UWS)

sd(Group_Subset_MCS$Ultr4d_Lomb)
mean(Group_Subset_MCS$Ultr4d_Lomb)

sd(Group_Subset_UWS$Ultr4d_Lomb)
mean(Group_Subset_UWS$Ultr4d_Lomb)

########################################################################
## Checking normality  (if p-value > 0.05 => Normality can be assumed ##
########################################################################

shapiro.test(data$Circ4d_Lomb)
shapiro.test(data$Circ5d_Lomb)
shapiro.test(data$Circ6d_Lomb)
shapiro.test(data$Circ7d_Lomb)

shapiro.test(data$Power_Lomb4d)

shapiro.test(data$Ultr4d_Lomb)
shapiro.test(data$Ultr5d_Lomb)
shapiro.test(data$Ultr6d_Lomb)
shapiro.test(data$Ultr7d_Lomb)

shapiro.test(data$IS_4d)
shapiro.test(data$IS_5d) # Normal Distributed
shapiro.test(data$IS_6d)
shapiro.test(data$IS_7d)

shapiro.test(data$IV_4d)
shapiro.test(data$IV_5d)
shapiro.test(data$IV_6d)
shapiro.test(data$IV_7d) # Normal Distributed


## 1a.-  Circadian for 4d, 5d, 6d and 7d
########################
### MCS  and UWS   #####
########################

# Diagnosis and
# Circadian
x <- data$Diagnosis
y <- data$Circ4d_Lomb   #==> Is close to significant p-value=0.08

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#Diagnosis and Power
x <- data$Diagnosis
y <- data$Power_Lomb4d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 5d
x <- data$Diagnosis
y <- data$Circ5d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# SE
x <- data$Diagnosis
y <- data$Circ6d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Lomb-Scargle

x <- data$Diagnosis
y <- data$Circ7d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#  ANOVA:

summary(aov(lm(data$Circ4d_Lomb ~ data$Diagnosis,data = data)))



## 1b.-  Ultradian for 4d, 5d, 6d and 7d
########################
### MCS  and UWS   #####
########################

# Diagnosis
# Ultradian
x <- data$Diagnosis
y <- data$Ultr4d_Lomb   #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# MSA
x <- data$Diagnosis
y <- data$Ultr5d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# SE
x <- data$Diagnosis
y <- data$Ultr6d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# Lomb-Scargle

x <- data$Diagnosis
y <- data$Ultr7d_Lomb

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#  ANOVA:

summary(aov(lm(data$Ultr4d_Lomb ~ data$Diagnosis,data = data)))


## 2.-  Non parametric Analysis IS, and IV
########################
### MCS  and UWS   #####
########################

# Diagnosis - IS
#4d

x <- data$Diagnosis
y <- data$IS_4d   #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 5d
x <- data$Diagnosis
y <- data$IS_5d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 6d
x <- data$Diagnosis
y <- data$IS_6d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 7d

x <- data$Diagnosis
y <- data$IS_7d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

###################################################################
####################################################################
# Diagnosis - RA
#4d

x <- data$Diagnosis
y <- data$RA_4d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 5d
x <- data$Diagnosis
y <- data$RA_5d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 6d
x <- data$Diagnosis
y <- data$RA_6d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 7d

x <- data$Diagnosis
y <- data$RA_7d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

#################################################################
#################################################################
# Diagnosis - IV
#4d

x <- data$Diagnosis
y <- data$IV_4d   #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 5d
x <- data$Diagnosis
y <- data$IV_5d     #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 6d
x <- data$Diagnosis
y <- data$IV_6d     #==> Is significant < 0.05

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

# 7d

x <- data$Diagnosis
y <- data$IV_7d

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#IS
shapiro.test(data$IS)
x<-data$TBI
y<-data$IS

wilcox.test(y~x)


# TBI : factor of interest
#TBI : factor of interest
# Ultradian_MSA:  main effect of
shapiro.test(data$Ultr4d_Lomb)
x<-data$TBI
y<-data$Ultr4d_Lomb  ##==> Significant < 0.05

wilcox.test(y~x)

summary(aov(lm(data$Ultr4d_Lomb ~ data$TBI,data = data)))

# aov(dependetãs.factor(independent1)*as.factor(indepent2), data=filename)

#####################
#### 2-way ANOVA ####
#####################
# Circadian ~TBI*Diagnosis

summary(aov(lm(data$Circ4d_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)))
anova2<-aov(data$Circ4d_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
resid2 <- anova2$residuals
hist(resid2, main="Histogram of residuals", xlab="Residuals")

library(car)

leveneTest(data$Circ4d_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
summary(anova2)

# Ultradian ~TBI*Diagnosis
summary(aov(lm(data$Ultr4d_Lomb ~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)))
anova2<-aov(data$Ultr4d_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
resid2 <- anova2$residuals
hist(resid2, main="Histogram of residuals", xlab="Residuals")

leveneTest(data$Ultradian_Lomb~as.factor(data$TBI)*as.factor(data$Diagnosis), data=data)
summary(anova2)

TukeyHSD(anova2)



##############
### MCS  #####
##############

##################################
### Ultradian 4d, 5d, 6d, 7d #####
##################################

mea_ultrLombScar4d_MCS <- mean(Group_Subset_MCS$Ultr4d_Lomb, na.rm = TRUE)
std_ultrLombScar4d_MCS <- sd(Group_Subset_MCS$Ultr4d_Lomb, na.rm = TRUE)

mea_ultrLombScar5d_MCS <- mean(Group_Subset_MCS$Ultr5d_Lomb, na.rm = TRUE)
std_ultrLombScar5d_MCS <- sd(Group_Subset_MCS$Ultr5d_Lomb, na.rm = TRUE)

mea_ultrLombScar6d_MCS <- mean(Group_Subset_MCS$Ultr6d_Lomb, na.rm = TRUE)
std_ultrLombScar6d_MCS <- sd(Group_Subset_MCS$Ultr6d_Lomb, na.rm = TRUE)

mea_ultrLombScar7d_MCS <- mean(Group_Subset_MCS$Ultr7d_Lomb, na.rm = TRUE)
std_ultrLombScar7d_MCS <- sd(Group_Subset_MCS$Ultr7d_Lomb, na.rm = TRUE)



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


#################################################################################
#################################################################################
########## Correlation of Circadian with days since insult for MCS and UWS ######
#################################################################################
#################################################################################

# Circadian - 4d
# MCS
xcorr <- Group_Subset_MCS$day_since_insult/30 # to set the days on months
ycorr <- Group_Subset_MCS$Circ4d_Lomb/60 # to set the circadian to hours

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for months since Insult vs Circadian for MCS", xlab = "Months since insult", ylab = "Circadian 4d (hours)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 

# UWS
xcorr <- Group_Subset_UWS$day_since_insult/30 # to set the days on months
ycorr <- Group_Subset_UWS$Circ4d_Lomb/60 # to set the circadian to hours

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for months since Insult vs Circadian for UWS", xlab = "Months since insult", ylab = "Circadian 4d (hours)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 


# Ultradian - 4d
# MCS
xcorr <- Group_Subset_MCS$day_since_insult/30 # to set the days on months
ycorr <- Group_Subset_MCS$Ultr4d_Lomb# 

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for months since Insult vs Ultradian for MCS", xlab = "Months since insult", ylab = "Ultradian 4d (minutes)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 

# UWS
xcorr <- Group_Subset_UWS$day_since_insult/30 # to set the days on months
ycorr <- Group_Subset_UWS$Ultr4d_Lomb 

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for months since Insult vs Ultradian for UWS", xlab = "Months since insult", ylab = "Ultradian 4d (minutes)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 



#################################################################################
#################################################################################
########## Correlation of Circadian - Ultradian with CRS score        ###########
#################################################################################
#################################################################################

# Circadian - 4d
# MCS
xcorr <- Group_Subset_MCS$crs_r # Total CRS-R best total score
ycorr <- Group_Subset_MCS$Circ4d_Lomb/60 # to set the circadian to hours

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for CRS-R vs Circadian for MCS", xlab = "Total CRS-R score", ylab = "Circadian 4d (hours)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 

# UWS
xcorr <- Group_Subset_UWS$crs_r # Total CRS-R best total score
ycorr <- Group_Subset_UWS$Circ4d_Lomb/60 # to set the circadian to hours

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for CRS-R  vs Circadian for UWS", xlab = "Total CRS-R score", ylab = "Circadian 4d (hours)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 


# Ultradian - 4d
# MCS
xcorr <- Group_Subset_MCS$crs_r # Total CRS-R best total score
ycorr <- Group_Subset_MCS$Ultr4d_Lomb# 

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for CRS-R vs Ultradian for MCS", xlab = "Total CRS-R score", ylab = "Ultradian 4d (minutes)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 

# UWS
xcorr <- Group_Subset_UWS$crs_r # Total CRS-R best total score
ycorr <- Group_Subset_UWS$Ultr4d_Lomb 

cor(xcorr, ycorr)
cor(xcorr, ycorr, use="complete.obs", method="kendall") 
plot(xcorr, ycorr, main="Scatterplot for CRS-R vs Ultradian for UWS", xlab = "Total CRS-R score", ylab = "Ultradian 4d (minutes)",   pch=19)

abline(lm(ycorr~xcorr), col="red") # regression line (y~x) 
#lines(lowess(xcorr,ycorr), col="blue") # lowess line (x,y) 





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


##################################################################################
##################################################################################
######################## Plottings  ###########################
##################################################################################
##################################################################################


# Boxplot of the circadian for Lomb-Scargle 4d, 5d, 6d, and 7d
# Boxplot of circadian for 4d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Circ_4d_LombScarg.jpg')
boxplot(data$Circ4d_Lomb/60~data$Diagnosis, main="Boxplot of Diagnosis vs Circadian Lomb Scargle", xlab="Diagnosis", ylab="Circadian in hours (4d)", ylim=c(19,28))
points(factor(data$Diagnosis), data$Circ4d_Lomb/60, col=3)
dev.off()

# Boxplot of circadian for 5d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Circ_5d_LombScarg.jpg')
boxplot(data$Circ5d_Lomb/60~data$Diagnosis, main="Boxplot of Diagnosis vs Circadian Lomb Scargle", xlab="Diagnosis", ylab="Circadian in hours (5d)", ylim=c(19,28))
points(factor(data$Diagnosis), data$Circ5d_Lomb/60, col=3)
dev.off()

# Boxplot of circadian for 6d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Circ_6d_LombScarg.jpg')
boxplot(data$Circ6d_Lomb/60~data$Diagnosis, main="Boxplot of Diagnosis vs Circadian Lomb Scargle", xlab="Diagnosis", ylab="Circadian in hours (6d)", ylim=c(19,28))
points(factor(data$Diagnosis), data$Circ6d_Lomb/60, col=3)
dev.off()

# Boxplot of circadian for 7d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Circ_7d_LombScarg.jpg')
boxplot(data$Circ7d_Lomb/60~data$Diagnosis, main="Boxplot of Diagnosis vs Circadian Lomb Scargle", xlab="Diagnosis", ylab="Circadian in hours (7d)", ylim=c(19,28))
points(factor(data$Diagnosis), data$Circ7d_Lomb/60, col=3)
dev.off()

###########################################################################################################################################################################
###########################################################################################################################################################################
###########################################################################################################################################################################


# Boxplot of the ultradian for Lomb-Scargle 4d, 5d, 6d, and 7d
# Boxplot of Ultradian for 4d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Ultrad_4d_LombScarg.jpg')
boxplot(data$Ultr4d_Lomb~data$Diagnosis, main="Boxplot of Diagnosis vs Ultradian Lomb Scargle", xlab="Diagnosis", ylab="Ultradian in hours (4d)", ylim=c(20,240))
points(factor(data$Diagnosis), data$Ultr4d_Lomb, col=3)
dev.off()

# Boxplot of Ultradian for 5d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Ultrad_5d_LombScarg.jpg')
boxplot(data$Ultr5d_Lomb~data$Diagnosis, main="Boxplot of Diagnosis vs Ultradian Lomb Scargle", xlab="Diagnosis", ylab="Ultradian in hours (5d)", ylim=c(20,240))
points(factor(data$Diagnosis), data$Ultr5d_Lomb, col=3)
dev.off()

# Boxplot of Ultradian for 6d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Ultrad_6d_LombScarg.jpg')
boxplot(data$Ultr6d_Lomb~data$Diagnosis, main="Boxplot of Diagnosis vs Ultradian Lomb Scargle", xlab="Diagnosis", ylab="Ultradian in hours (6d)", ylim=c(20,240))
points(factor(data$Diagnosis), data$Ultr6d_Lomb, col=3)
dev.off()

# Boxplot of Ultradian for 7d
jpeg('/home/aldo/Documents/Projects/Avtivemeter/Data/Reports/2018-Plots_4_ppt/RBoxplot_Diag_vs_Ultrad_7d_LombScarg.jpg')
boxplot(data$Ultr7d_Lomb~data$Diagnosis, main="Boxplot of Diagnosis vs Ultradian Lomb Scargle", xlab="Diagnosis", ylab="Ultradian in hours (7d)", ylim=c(20,240))
points(factor(data$Diagnosis), data$Ultr7d_Lomb, col=3)
dev.off()

###########################################################################################################################################################################
###########################################################################################################################################################################
###########################################################################################################################################################################
#  Plot of correlation of Circadian with day since insult






