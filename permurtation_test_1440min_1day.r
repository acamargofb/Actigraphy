###############################################################################################
###############################################################################################
########################### Resume of the results #############################################
###############################################################################################
###############################################################################################

#table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks_120min.csv", header=TRUE, sep=",")

table_data_pks2 <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")

data <- table_data_pks2
summary(data)



## 1.- Checking normality 
##############
### MCS #####
##############



Group_Subset_MCS <- subset(data, Group == 'MCS')
summary(Group_Subset_MCS)
Group_Subset_UWS <- subset(data, Group == 'UWS')
summary(Group_Subset_UWS)
Group_Subset_MCS_UWS <- subset(data, Group != 'EMCS')


plot(density(na.omit(Group_Subset_MCS$pk1)))
plot(density(na.omit(Group_Subset_MCS$pk2)))
plot(density(na.omit(Group_Subset_MCS$pk3)))


plot(density(na.omit(Group_Subset_MCS$pk1_SE)))
plot(density(na.omit(Group_Subset_MCS$pk2_SE)))
plot(density(na.omit(Group_Subset_MCS$pk3_SE)))

hist(na.omit(Group_Subset_MCS$pk3_SE))

summary(aov(lm(pk1_SE ~ Group,data = Group_Subset_MCS_UWS)))
summary(aov(lm(pk2_SE ~ Group,data = Group_Subset_MCS_UWS)))
summary(aov(lm(pk3_SE ~ Group,data = Group_Subset_MCS_UWS)))


#   Testing normality
# Here if p > 0.05 => normality can be assumed

shapiro.test(Group_Subset_MCS_UWS$pk1)
shapiro.test(Group_Subset_MCS_UWS$pk2)
shapiro.test(Group_Subset_MCS_UWS$pk3)

shapiro.test(Group_Subset_MCS_UWS$pk1_SE)
shapiro.test(Group_Subset_MCS_UWS$pk2_SE)
shapiro.test(Group_Subset_MCS_UWS$pk3_SE)

## 2.-  
##############
### MCS  and UWS #####
##############

Group_Subset_MCS_UWS <- subset(data, Group != 'EMCS')
data_pk3_SE <- data.frame(Group = Group_Subset_MCS_UWS$Group,pk3_SE = Group_Subset_MCS_UWS$pk3_SE)


library(coin)

independence_test(pk3_SE ~ Group, data = data_pk3_SE, ytrafo = rank_trafo, distribution = exact())

# pks in the three intervals
#pk1
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk1


# Mann-Whitney test
# t-test:
wilcox.test(y~x)

#pk2
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk2

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#pk3
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk3  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)



# SE
#pk1
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk1_SE


# Mann-Whitney test
# t-test:
wilcox.test(y~x)

#pk2
x <- Group_Subset_MCS_UWS$Group
y <- Group_Subset_MCS_UWS$pk2_SE

# Mann-Whitney test
# t-test:
wilcox.test(y~x)


#pk3
x <- Group_Subset_MCS_UWS$Group  # binary factor
y <- Group_Subset_MCS_UWS$pk3_SE  # numeric

# Mann-Whitney test
# t-test:
wilcox.test(y~x)

summary(y)

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
median_pk1_MCS <- median(Group_Subset_MCS$pk1, na.rm = TRUE)
median_pk2_MCS <- median(Group_Subset_MCS$pk2, na.rm = TRUE)
median_pk3_MCS <- median(Group_Subset_MCS$pk3, na.rm = TRUE)



# SE
median_pk1_MCS_SE <- median(Group_Subset_MCS$pk1_SE, na.rm = TRUE)
median_pk2_MCS_SE <- median(Group_Subset_MCS$pk2_SE, na.rm = TRUE)
median_pk3_MCS_SE <- median(Group_Subset_MCS$pk3_SE, na.rm = TRUE)



#UWS
#pks (minutes)
median_pk1_UWS <- median(Group_Subset_UWS$pk1, na.rm = TRUE)
median_pk2_UWS <- median(Group_Subset_UWS$pk2, na.rm = TRUE)
median_pk3_UWS <- median(Group_Subset_UWS$pk3, na.rm = TRUE)


# SE
median_pk1_UWS_SE <- median(Group_Subset_UWS$pk1_SE, na.rm = TRUE)
median_pk2_UWS_SE <- median(Group_Subset_UWS$pk2_SE, na.rm = TRUE)
median_pk3_UWS_SE <- median(Group_Subset_UWS$pk3_SE, na.rm = TRUE)


# table resume for time (pks in minutes)
table_resume1_pks <- data.frame(pk1_median = median_pk1_MCS, pk2_median = median_pk2_MCS, pk3_median = median_pk3_MCS)
table_resume2_pks <- data.frame(pk1_median = median_pk1_UWS, pk2_median = median_pk2_UWS, pk3_median = median_pk3_UWS)

table_resumen_pks <- rbind(table_resume1_pks, table_resume2_pks)

# table resume for SE
table_resume1 <- data.frame(pk1_median = median_pk1_MCS_SE, pk2_median = median_pk2_MCS_SE, pk3_median = median_pk3_MCS_SE)
table_resume2 <- data.frame(pk1_median = median_pk1_UWS_SE, pk2_median = median_pk2_UWS_SE, pk3_median = median_pk3_UWS_SE)

table_resumen <- rbind(table_resume1, table_resume2)


# finding the IRQ = Q3 - Q1

##############
### MCS  #####
##############

##############
### pks  #####
##############


q1_MCS_pk1_time <- quantile(Group_Subset_MCS$pk1, 0.25, na.rm = TRUE)
q3_MCS_pk1_time <- quantile(Group_Subset_MCS$pk1, 0.75, na.rm = TRUE)
IRQ_MCS_pk1_time <- q3_MCS_pk1_time - q1_MCS_pk1_time

q1_MCS_pk2_time <- quantile(Group_Subset_MCS$pk2, 0.25, na.rm = TRUE)
q3_MCS_pk2_time <- quantile(Group_Subset_MCS$pk2, 0.75, na.rm = TRUE)
IRQ_MCS_pk2_time <- q3_MCS_pk2_time - q1_MCS_pk2_time

q1_MCS_pk3_time <- quantile(Group_Subset_MCS$pk3, 0.25, na.rm = TRUE)
q3_MCS_pk3_time <- quantile(Group_Subset_MCS$pk3, 0.75, na.rm = TRUE)
IRQ_MCS_pk3_time <- q3_MCS_pk3_time - q1_MCS_pk3_time


###################
### MCS - SE  #####
###################

q1_MCS_pk1 <- quantile(Group_Subset_MCS$pk1_SE, 0.25, na.rm = TRUE)
q3_MCS_pk1 <- quantile(Group_Subset_MCS$pk1_SE, 0.75, na.rm = TRUE)
IRQ_MCS_pk1 <- q3_MCS_pk1 - q1_MCS_pk1

q1_MCS_pk2 <- quantile(Group_Subset_MCS$pk2_SE, 0.25, na.rm = TRUE)
q3_MCS_pk2 <- quantile(Group_Subset_MCS$pk2_SE, 0.75, na.rm = TRUE)
IRQ_MCS_pk2 <- q3_MCS_pk2 - q1_MCS_pk2

q1_MCS_pk3 <- quantile(Group_Subset_MCS$pk3_SE, 0.25, na.rm = TRUE)
q3_MCS_pk3 <- quantile(Group_Subset_MCS$pk3_SE, 0.75, na.rm = TRUE)
IRQ_MCS_pk3 <- q3_MCS_pk3 - q1_MCS_pk3



##############
### UWS  #####
##############
##  time -pks  ##
##         ##
#############

q1_UWS_pk1_time <- quantile(Group_Subset_UWS$pk1, 0.25, na.rm = TRUE)
q3_UWS_pk1_time <- quantile(Group_Subset_UWS$pk1, 0.75, na.rm = TRUE)
IRQ_UWS_pk1_time <- q3_UWS_pk1_time - q1_UWS_pk1_time

q1_UWS_pk2_time <- quantile(Group_Subset_UWS$pk2, 0.25, na.rm = TRUE)
q3_UWS_pk2_time <- quantile(Group_Subset_UWS$pk2, 0.75, na.rm = TRUE)
IRQ_UWS_pk2_time <- q3_UWS_pk2_time - q1_UWS_pk2_time

q1_UWS_pk3_time <- quantile(Group_Subset_UWS$pk3, 0.25, na.rm = TRUE)
q3_UWS_pk3_time <- quantile(Group_Subset_UWS$pk3, 0.75, na.rm = TRUE)
IRQ_UWS_pk3_time <- q3_UWS_pk3_time - q1_UWS_pk3_time


######
# SE #
######


q1_UWS_pk1 <- quantile(Group_Subset_UWS$pk1_SE, 0.25, na.rm = TRUE)
q3_UWS_pk1 <- quantile(Group_Subset_UWS$pk1_SE, 0.75, na.rm = TRUE)
IRQ_UWS_pk1 <- q3_UWS_pk1 - q1_UWS_pk1

q1_UWS_pk2 <- quantile(Group_Subset_UWS$pk2_SE, 0.25, na.rm = TRUE)
q3_UWS_pk2 <- quantile(Group_Subset_UWS$pk2_SE, 0.75, na.rm = TRUE)
IRQ_UWS_pk2 <- q3_UWS_pk2 - q1_UWS_pk2

q1_UWS_pk3 <- quantile(Group_Subset_UWS$pk3_SE, 0.25, na.rm = TRUE)
q3_UWS_pk3 <- quantile(Group_Subset_UWS$pk3_SE, 0.75, na.rm = TRUE)
IRQ_UWS_pk3 <- q3_UWS_pk3 - q1_UWS_pk3


#mcs
n_pk1_mcs<-length(which(!is.na(Group_Subset_MCS$pk1)))
n_pk2_mcs<-length(which(!is.na(Group_Subset_MCS$pk2)))
n_pk3_mcs<-length(which(!is.na(Group_Subset_MCS$pk3)))         


#uws
n_pk1_uws<-length(which(!is.na(Group_Subset_UWS$pk1)))
n_pk2_uws<-length(which(!is.na(Group_Subset_UWS$pk2)))
n_pk3_uws<-length(which(!is.na(Group_Subset_UWS$pk3)))
       


# time pks
table_resume111_time <- data.frame(pk1_sde = IRQ_MCS_pk1_time/sqrt(n_pk1_mcs), pk2_sde = IRQ_MCS_pk2_time/sqrt(n_pk2_mcs), pk3_sde = IRQ_MCS_pk3_time/sqrt(n_pk3_mcs))
table_resume222_time <- data.frame(pk1_sde = IRQ_UWS_pk1_time/sqrt(n_pk1_uws), pk2_sde = IRQ_UWS_pk2_time/sqrt(n_pk2_uws), pk3_sde = IRQ_UWS_pk3_time/sqrt(n_pk3_uws))

table_resumen_3_time <- rbind(table_resume111_time, table_resume222_time)

# SE

table_resume111 <- data.frame(pk1_sde = IRQ_MCS_pk1/sqrt(n_pk1_mcs), pk2_sde = IRQ_MCS_pk2/sqrt(n_pk2_mcs), pk3_sde = IRQ_MCS_pk3/sqrt(n_pk3_mcs))
table_resume222 <- data.frame(pk1_sde = IRQ_UWS_pk1/sqrt(n_pk1_uws), pk2_sde = IRQ_UWS_pk2/sqrt(n_pk2_uws), pk3_sde = IRQ_UWS_pk3/sqrt(n_pk3_uws))

table_resumen_3 <- rbind(table_resume111, table_resume222)


