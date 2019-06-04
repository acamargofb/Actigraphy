###############################################################################################
###############################################################################################
########################### Resume of the results #############################################
###############################################################################################
###############################################################################################
# This data contains with a interval to detect the pk3 up to 1512
#table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_4days.csv", header=TRUE, sep=",")

# This data contains with a new interval to detect the pk3 up to 1578
#table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_4days_2.csv", header=TRUE, sep=",")

# This data contains with a new interval according to paper Cruze of the circadian range
table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_4days_3_Int_Cruze.csv", header=TRUE, sep=",")


data <- table_data_pks
summary(data)



## 1.- Checking normality 
##############
### MCS #####
##############



Group_Subset_MCS <- subset(data, Group == 'MCS')
summary(Group_Subset_MCS)
Group_Subset_UWS <- subset(data, Group == 'UWS')
Group_Subset_MCS_UWS <- data



plot(density(na.omit(Group_Subset_MCS$pk1)))
plot(density(na.omit(Group_Subset_MCS$pk2)))
plot(density(na.omit(Group_Subset_MCS$pk3)))
plot(density(na.omit(Group_Subset_MCS$pk4)))
plot(density(na.omit(Group_Subset_MCS$pk5)))

plot(density(na.omit(Group_Subset_MCS$pk1_SE)))
plot(density(na.omit(Group_Subset_MCS$pk2_SE)))
plot(density(na.omit(Group_Subset_MCS$pk3_SE)))
plot(density(na.omit(Group_Subset_MCS$pk4_SE)))
plot(density(na.omit(Group_Subset_MCS$pk5_SE)))


hist(na.omit(Group_Subset_MCS$pk3_SE))

summary(aov(lm(Group_Subset_MCS$pk3_SE ~ Group_Subset_MCS$Group,data = data)))
# 
#shapiro.test(Group_Subset$pk1_SE)
#shapiro.test(na.omit(Group_Subset$pk1_SE))

# Here if p > 0.05 => normality can be assumed

shapiro.test(Group_Subset_MCS$pk1)
shapiro.test(Group_Subset_MCS$pk2)
shapiro.test(Group_Subset_MCS$pk3)
shapiro.test(Group_Subset_MCS$pk4)
shapiro.test(Group_Subset_MCS$pk5)

shapiro.test(Group_Subset_MCS$pk1_SE)
shapiro.test(Group_Subset_MCS$pk2_SE) # can be consider normal
shapiro.test(Group_Subset_MCS$pk3_SE)
shapiro.test(Group_Subset_MCS$pk4_SE)
shapiro.test(Group_Subset_MCS$pk5_SE)


summary(aov(lm(Group_Subset_MCS$pk3_SE ~ Group_Subset_MCS$Group,data = data)))

##############
### UWS #####
##############


Group_Subset_UWS <- subset(data, Group == 'UWS')
summary(Group_Subset_UWS)

plot(density(na.omit(Group_Subset_UWS$pk1)))
plot(density(na.omit(Group_Subset_UWS$pk2)))
plot(density(na.omit(Group_Subset_UWS$pk3)))
plot(density(na.omit(Group_Subset_UWS$pk4)))
plot(density(na.omit(Group_Subset_UWS$pk5)))

plot(density(na.omit(Group_Subset_UWS$pk1_SE)))
plot(density(na.omit(Group_Subset_UWS$pk2_SE)))
plot(density(na.omit(Group_Subset_UWS$pk3_SE)))
plot(density(na.omit(Group_Subset_UWS$pk4_SE)))
plot(density(na.omit(Group_Subset_UWS$pk5_SE)))


hist(na.omit(Group_Subset_UWS$pk3_SE))

summary(aov(lm(Group_Subset_UWS$pk3_SE ~ Group_Subset_UWS$Group,data = Group_Subset_UWS)))

#summary(aov(lm(pk3_SE ~ Group,data = Group_Subset_UWS)))
# 
#shapiro.test(Group_Subset$pk1_SE)
#shapiro.test(na.omit(Group_Subset$pk1_SE))

# Here if p > 0.05 => normality can be assumed

shapiro.test(Group_Subset_UWS$pk1)
shapiro.test(Group_Subset_UWS$pk2)
shapiro.test(Group_Subset_UWS$pk3)
shapiro.test(Group_Subset_UWS$pk4)
shapiro.test(Group_Subset_UWS$pk5)

shapiro.test(Group_Subset_UWS$pk1_SE)
shapiro.test(Group_Subset_UWS$pk2_SE)
shapiro.test(Group_Subset_UWS$pk3_SE)
shapiro.test(Group_Subset_UWS$pk4_SE)
shapiro.test(Group_Subset_UWS$pk5_SE)



## 2.-  
##############
### MCS  and UWS #####
##############

Group_Subset_MCS_UWS <- data
data_pk3_SE <- data.frame(Group = Group_Subset_MCS_UWS$Group,pk3_SE = Group_Subset_MCS_UWS$pk3_SE)

# Checking normality of pk3_SE

plot(density(na.omit(Group_Subset_MCS_UWS$pk3_SE)))
shapiro.test(Group_Subset_MCS_UWS$pk3_SE)

library(coin)

independence_test(pk3_SE ~ Group, data = data_pk3_SE, ytrafo = rank_trafo, distribution = exact())

# Checking normality 

plot(density(na.omit(Group_Subset_MCS_UWS$pk1)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk2)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk3)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk4)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk5)))

plot(density(na.omit(Group_Subset_MCS_UWS$pk1_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk2_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk3_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk4_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$pk5_SE)))

plot(density(na.omit(Group_Subset_MCS_UWS$mean_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$std_SE)))
plot(density(na.omit(Group_Subset_MCS_UWS$cv_SE)))


hist(na.omit(Group_Subset_UWS$pk3_SE))

summary(aov(lm(Group_Subset_UWS$pk3_SE ~ Group_Subset_UWS$Group,data = Group_Subset_UWS)))

#summary(aov(lm(pk3_SE ~ Group,data = Group_Subset_UWS)))


# Here if p > 0.05 => normality can be assumed

shapiro.test(Group_Subset_MCS_UWS$pk1)
shapiro.test(Group_Subset_MCS_UWS$pk2)
shapiro.test(Group_Subset_MCS_UWS$pk3)
shapiro.test(Group_Subset_MCS_UWS$pk4)
shapiro.test(Group_Subset_MCS_UWS$pk5)

shapiro.test(Group_Subset_MCS_UWS$pk1_SE)
shapiro.test(Group_Subset_MCS_UWS$pk2_SE)
shapiro.test(Group_Subset_MCS_UWS$pk3_SE)
shapiro.test(Group_Subset_MCS_UWS$pk4_SE)
shapiro.test(Group_Subset_MCS_UWS$pk5_SE)

shapiro.test(Group_Subset_MCS_UWS$mean_SE)
shapiro.test(Group_Subset_MCS_UWS$std_SE)
shapiro.test(Group_Subset_MCS_UWS$cv_SE)

### Theory :) ####
# independent 2-group Mann-Whitney U Test
#wilcox.test(y~A)
# where y is numeric and A is A binary factor 


#Compute the p-value
# pks in time. 
#pk1
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk1


# Mann-Whitney test
# t-test:
wilcox.test(y~x)

summary(aov(lm(Group_Subset_MCS_UWS$pk1 ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))


#pk2
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk2

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk2 ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

#pk3
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk3 # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk3 ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))




#pk4
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk4  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk4 ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

#pk5
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk5 # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk5 ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))


#SE
#pk1
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk1_SE


# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk1_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))
#pk2
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk2_SE

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk2_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

#pk3
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk3_SE  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk3_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

summary(y)

#pk4
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk4_SE  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk4_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

#pk5
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk5_SE  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$pk5_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))

# mean of SE

x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$mean_SE  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$mean_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))



# std of SE

x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$std_SE  # numeric

# Mann-Whitney U test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$std_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))


# cv of SE

x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$cv_SE  # numeric

# Mann-Whitney U test
# t-test:
wilcox.test(y~x)
summary(aov(lm(Group_Subset_MCS_UWS$cv_SE ~ Group_Subset_MCS_UWS$Group,data = Group_Subset_MCS_UWS)))



############################################################
############################################################
############################################################
##  This part is to compute the values of the table   ######
##  that is used then in MATLAB to plot the error bar ######
############################################################
############################################################
############################################################

#MCS
#pks (minutes)
mean_pk1_MCS <- mean(Group_Subset_MCS$pk1, na.rm = TRUE)
mean_pk2_MCS <- mean(Group_Subset_MCS$pk2, na.rm = TRUE)
mean_pk3_MCS <- mean(Group_Subset_MCS$pk3, na.rm = TRUE)
mean_pk4_MCS <- mean(Group_Subset_MCS$pk4, na.rm = TRUE)
mean_pk5_MCS <- mean(Group_Subset_MCS$pk5, na.rm = TRUE)


# SE
mean_pk1_MCS_SE <- mean(Group_Subset_MCS_UWS$pk1_SE, na.rm = TRUE)
mean_pk2_MCS_SE <- mean(Group_Subset_MCS_UWS$pk2_SE, na.rm = TRUE)
mean_pk3_MCS_SE <- mean(Group_Subset_MCS_UWS$pk3_SE, na.rm = TRUE)
mean_pk4_MCS_SE <- mean(Group_Subset_MCS_UWS$pk4_SE, na.rm = TRUE)
mean_pk5_MCS_SE <- mean(Group_Subset_MCS_UWS$pk5_SE, na.rm = TRUE)


#UWS
#pks (minutes)
mean_pk1_UWS <- mean(Group_Subset_UWS$pk1, na.rm = TRUE)
mean_pk2_UWS <- mean(Group_Subset_UWS$pk2, na.rm = TRUE)
mean_pk3_UWS <- mean(Group_Subset_UWS$pk3, na.rm = TRUE)
mean_pk4_UWS <- mean(Group_Subset_UWS$pk4, na.rm = TRUE)
mean_pk5_UWS <- mean(Group_Subset_UWS$pk5, na.rm = TRUE)

# SE
mean_pk1_UWS_SE <- mean(Group_Subset_UWS$pk1_SE, na.rm = TRUE)
mean_pk2_UWS_SE <- mean(Group_Subset_UWS$pk2_SE, na.rm = TRUE)
mean_pk3_UWS_SE <- mean(Group_Subset_UWS$pk3_SE, na.rm = TRUE)
mean_pk4_UWS_SE <- mean(Group_Subset_UWS$pk4_SE, na.rm = TRUE)
mean_pk5_UWS_SE <- mean(Group_Subset_UWS$pk5_SE, na.rm = TRUE)

# table resume for time (pks in minutes)
table_resume1_pks <- data.frame(pk1_mean = mean_pk1_MCS, pk2_mean = mean_pk2_MCS, pk3_mean = mean_pk3_MCS,  pk4_mean = mean_pk4_MCS,  pk5_mean = mean_pk5_MCS)
table_resume2_pks <- data.frame(pk1_mean = mean_pk1_UWS, pk2_mean = mean_pk2_UWS, pk3_mean = mean_pk3_UWS,  pk4_mean = mean_pk4_UWS,  pk5_mean = mean_pk5_UWS)

table_resumen_pks <- rbind(table_resume1_pks, table_resume2_pks)

# table resume for SE
table_resume1 <- data.frame(pk1_mean = mean_pk1_MCS_SE, pk2_mean = mean_pk2_MCS_SE, pk3_mean = mean_pk3_MCS_SE,  pk4_mean = mean_pk4_MCS_SE,  pk5_mean = mean_pk5_MCS_SE)
table_resume2 <- data.frame(pk1_mean = mean_pk1_UWS_SE, pk2_mean = mean_pk2_UWS_SE, pk3_mean = mean_pk3_UWS_SE,  pk4_mean = mean_pk4_UWS_SE,  pk5_mean = mean_pk5_UWS_SE)

table_resumen <- rbind(table_resume1, table_resume2)


library('R.matlab')

#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_bar_input_1578_mean.mat", data_bar_input_1578_mean = data.matrix(table_resumen))
#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_bar_input_1578_mean.mat", data_pks_bar_input_1578_mean = data.matrix(table_resumen_pks))

#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_bar_input_1512_mean.mat", data_bar_input_1512_mean = data.matrix(table_resumen))
#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_bar_input_1512_mean.mat", data_pks_bar_input_1512_mean = data.matrix(table_resumen_pks))

writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_bar_input_IntCruze_mean.mat", data_bar_input_IntCruze_mean = data.matrix(table_resumen))
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_bar_input_IntCruze_mean.mat", data_pks_bar_input_IntCruze_mean = data.matrix(table_resumen_pks))


# finding the std

##############
### MCS  #####
##############

####################
### MCS - pks  #####
####################

std_pk1_MCS <- sd(Group_Subset_MCS$pk1, na.rm = TRUE)
std_pk2_MCS <- sd(Group_Subset_MCS$pk2, na.rm = TRUE)
std_pk3_MCS <- sd(Group_Subset_MCS$pk3, na.rm = TRUE)
std_pk4_MCS <- sd(Group_Subset_MCS$pk4, na.rm = TRUE)
std_pk5_MCS <- sd(Group_Subset_MCS$pk5, na.rm = TRUE)


###################
### MCS - SE  #####
###################

std_pk1_MCS_SE <- sd(Group_Subset_MCS$pk1_SE, na.rm = TRUE)
std_pk2_MCS_SE <- sd(Group_Subset_MCS$pk2_SE, na.rm = TRUE)
std_pk3_MCS_SE <- sd(Group_Subset_MCS$pk3_SE, na.rm = TRUE)
std_pk4_MCS_SE <- sd(Group_Subset_MCS$pk4_SE, na.rm = TRUE)
std_pk5_MCS_SE <- sd(Group_Subset_MCS$pk5_SE, na.rm = TRUE)


##############
### UWS  #####
##############
##  time -pks  ##
##         ##
#############

std_pk1_UWS <- sd(Group_Subset_UWS$pk1, na.rm = TRUE)
std_pk2_UWS <- sd(Group_Subset_UWS$pk2, na.rm = TRUE)
std_pk3_UWS <- sd(Group_Subset_UWS$pk3, na.rm = TRUE)
std_pk4_UWS <- sd(Group_Subset_UWS$pk4, na.rm = TRUE)
std_pk5_UWS <- sd(Group_Subset_UWS$pk5, na.rm = TRUE)

######
# SE #
######


std_pk1_UWS_SE <- sd(Group_Subset_UWS$pk1_SE, na.rm = TRUE)
std_pk2_UWS_SE <- sd(Group_Subset_UWS$pk2_SE, na.rm = TRUE)
std_pk3_UWS_SE <- sd(Group_Subset_UWS$pk3_SE, na.rm = TRUE)
std_pk4_UWS_SE <- sd(Group_Subset_UWS$pk4_SE, na.rm = TRUE)
std_pk5_UWS_SE <- sd(Group_Subset_UWS$pk5_SE, na.rm = TRUE)


#mcs
# Here the number of elements is computed. 
# We have to consider that the number of elements of the pks is the same as the 
# number of elements of SE at that particular peak

n_pk1_mcs<-length(which(!is.na(Group_Subset_MCS$pk1)))
n_pk2_mcs<-length(which(!is.na(Group_Subset_MCS$pk2)))
n_pk3_mcs<-length(which(!is.na(Group_Subset_MCS$pk3)))         
n_pk4_mcs<-length(which(!is.na(Group_Subset_MCS$pk4)))
n_pk5_mcs<-length(which(!is.na(Group_Subset_MCS$pk5))) 

#uws
n_pk1_uws<-length(which(!is.na(Group_Subset_UWS$pk1)))
n_pk2_uws<-length(which(!is.na(Group_Subset_UWS$pk2)))
n_pk3_uws<-length(which(!is.na(Group_Subset_UWS$pk3)))
n_pk4_uws<-length(which(!is.na(Group_Subset_UWS$pk4)))         
n_pk5_uws<-length(which(!is.na(Group_Subset_UWS$pk5)))         


# time pks
table_resume111_time <- data.frame(pk1_sde = std_pk1_MCS/sqrt(n_pk1_mcs), pk2_sde = std_pk2_MCS/sqrt(n_pk2_mcs), pk3_sde = std_pk3_MCS/sqrt(n_pk3_mcs),  pk4_sde = std_pk4_MCS/sqrt(n_pk4_mcs),  pk5_sde = std_pk5_MCS/sqrt(n_pk5_mcs))
table_resume222_time <- data.frame(pk1_sde = std_pk1_UWS/sqrt(n_pk1_uws), pk2_sde = std_pk2_UWS/sqrt(n_pk2_uws), pk3_sde = std_pk3_UWS/sqrt(n_pk3_uws),  pk4_sde = std_pk4_UWS/sqrt(n_pk4_uws),  pk5_sde = std_pk5_UWS/sqrt(n_pk5_uws))

table_resumen_3_time <- rbind(table_resume111_time, table_resume222_time)

# SE

table_resume111 <- data.frame(pk1_sde = std_pk1_MCS_SE/sqrt(n_pk1_mcs), pk2_sde = std_pk2_MCS_SE/sqrt(n_pk2_mcs), pk3_sde = std_pk3_MCS_SE/sqrt(n_pk3_mcs),  pk4_sde = std_pk4_MCS_SE/sqrt(n_pk4_mcs),  pk5_sde = std_pk5_MCS_SE/sqrt(n_pk5_mcs))
table_resume222 <- data.frame(pk1_sde = std_pk1_UWS_SE/sqrt(n_pk1_uws), pk2_sde = std_pk2_UWS_SE/sqrt(n_pk2_uws), pk3_sde = std_pk3_UWS_SE/sqrt(n_pk3_uws),  pk4_sde = std_pk4_UWS_SE/sqrt(n_pk4_uws),  pk5_sde = std_pk5_UWS_SE/sqrt(n_pk5_uws))

table_resumen_3 <- rbind(table_resume111, table_resume222)

#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_error_bar_1578_mean.mat", data_error_bar_1578_mean = data.matrix(table_resumen_3))
#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_error_input_1578_mean.mat", data_pks_error_input_1578_mean = data.matrix(table_resumen_3_time))


#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_error_bar_1512_mean.mat", data_error_bar_1512_mean = data.matrix(table_resumen_3))
#writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_error_input_1512_mean.mat", data_pks_error_input_1512_mean = data.matrix(table_resumen_3_time))

writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_error_bar_IntCruze_mean.mat", data_error_bar_IntCruze_mean = data.matrix(table_resumen_3))
writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/data_pks_error_input_IntCruze_mean.mat", data_pks_error_input_IntCruze_mean = data.matrix(table_resumen_3_time))