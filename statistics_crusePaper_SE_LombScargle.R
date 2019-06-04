###############################################################################################
###############################################################################################
########################### Resume of the results #############################################
###############################################################################################
###############################################################################################

table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/DB_Res_Pat_Actigraphy_Cruse_Paper_SE_LombScargle.csv", header=TRUE, sep=",")

data <- table_data
summary(data)

#########################
## Checking normality  ##
#########################

shapiro.test(data$t_circadian_SE_MSA)
shapiro.test(data$t_circ_LombScargle)

#####################
#  Mean and std values
###################

Group_Subset_MCS <- subset(data, Diag_simp == 'MCS')
Group_Subset_UWS <- subset(data, Diag_simp == 'UWS')

# SE and MSA circadian

mean_circadianSE_MCS <- mean(Group_Subset_MCS$t_circadian_SE_MSA, na.rm = TRUE)
mean_circadianSE_UWS <- mean(Group_Subset_UWS$t_circadian_SE_MSA, na.rm = TRUE)

std_circadianSE_MCS <- sd(Group_Subset_MCS$t_circadian_SE_MSA, na.rm = TRUE)
std_circadianSE_UWS <- sd(Group_Subset_UWS$t_circadian_SE_MSA, na.rm = TRUE)

# LomScargle circadian

mean_circadianLombScargle_MCS <- mean(Group_Subset_MCS$t_circ_LombScargle, na.rm = TRUE)
mean_circadianLombScargle_UWS <- mean(Group_Subset_UWS$t_circ_LombScargle, na.rm = TRUE)

std_circadianLombScargle_MCS <- sd(Group_Subset_MCS$t_circ_LombScargle, na.rm = TRUE)
std_circadianLombScargle_UWS <- sd(Group_Subset_UWS$t_circ_LombScargle, na.rm = TRUE)


## 1.-  Circadian with SE and MSA
##############
### MCS  and UWS #####
##############

# Circadian SE MSA
x <- data$Diag_simp
y <- data$t_circadian_SE_MSA


# Mann-Whitney test
# t-test:
wilcox.test(y~x)


x <- data$Diag_simp
y <- data$MSA


# Circadian LombScargle
x <- data$Diag_simp
y <- data$t_circ_LombScargle

# Mann-Whitney test
# t-test:
wilcox.test(y~x)




