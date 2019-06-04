####################################################################################
###################   pks (on minutes)##############################################
####################################################################################

#install.packages('nloptr')
library(nloptr)

#install.packages("car")
library("car")

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)

#pk1
Model_pks1 <- lm(table_data_pks$pk1 ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_pks1)
Anova(Model_pks1, type="II")

#pk2

Model_pks2 <- lm(table_data_pks$pk2 ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_pks2)
Anova(Model_pks2, type="II")

#pk3
Model_pks3 <- lm(table_data_pks$pk3 ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_pks3)
Anova(Model_pks3, type="II")

####################################################################################
###################   MSA of the pks ###############################################
####################################################################################


#MSA pk1
Model_MSA_pks1 <- lm(table_data_pks$pk1_MSA ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_MSA_pks1)
Anova(Model_MSA_pks1, type="II")


#MSA pk2
Model_MSA_pks2 <- lm(table_data_pks$pk2_MSA ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_MSA_pks2)
Anova(Model_MSA_pks2, type="II")


#MSA pk3
Model_MSA_pks3 <- lm(table_data_pks$pk3_MSA ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_MSA_pks3)
Anova(Model_MSA_pks3, type="II")

####################################################################################
###################   SE of the pks ################################################
####################################################################################



#SE pk1
Model_SE_pks1 <- lm(table_data_pks$pk1_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_pks1)
Anova(Model_SE_pks1, type="II")


#SE pk2
Model_SE_pks2 <- lm(table_data_pks$pk2_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_pks2)
Anova(Model_SE_pks2, type="II")


#SE pk3
Model_SE_pks3 <- lm(table_data_pks$pk3_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_pks3)
Anova(Model_SE_pks3, type="II")

####################################################################################
###################   Mean, Std, CV, of SE #########################################
####################################################################################

#mean SE 
Model_SE_mean <- lm(table_data_pks$mean_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_mean)
Anova(Model_SE_mean, type="II")


#std SE
Model_SE_std <- lm(table_data_pks$std_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_std)
Anova(Model_SE_std, type="II")


#cv SE
Model_SE_cv <- lm(table_data_pks$cv_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_cv)
Anova(Model_SE_cv, type="II")



table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks_120min.csv", header=TRUE, sep=",")

data <- table_data_pks
summary(data)
##############
### EMCS #####
##############

Group_Subset <- subset(data, Group == 'EMCS')

data_mean_pk1 <-mean(Group_Subset$pk1, trim = 0, na.rm = TRUE)
data_std_pk1 <- sd(Group_Subset$pk1, na.rm = TRUE)

data_mean_pk1MSA <-mean(Group_Subset$pk1_MSA, trim = 0, na.rm = TRUE)
data_std_pk1MSA <- sd(Group_Subset$pk1_MSA, na.rm = TRUE)

##############
##############
## t-test  ###
##############
##############


# independent 2-group t-test
EMCS <-  subset(table_data_pks, Group == 'EMCS')
MCS <-  subset(table_data_pks, Group == 'MCS')
UWS <-  subset(table_data_pks, Group == 'UWS')

# EMCS - MCS :  
# pk1, pk2, pk3
t.test(EMCS$pk1,MCS$pk1) 
t.test(EMCS$pk2,MCS$pk2) 
t.test(EMCS$pk3,MCS$pk3) 

# MSA pk1, pk2, pk3
t.test(EMCS$pk1_MSA,MCS$pk1_MSA)
t.test(EMCS$pk2_MSA,MCS$pk2_MSA) 
t.test(EMCS$pk3_MSA,MCS$pk3_MSA) 

# SE
t.test(EMCS$pk1_SE,MCS$pk1_SE) 
t.test(EMCS$pk2_SE,MCS$pk2_SE) 
t.test(EMCS$pk3_SE,MCS$pk3_SE) 

# mean_SE
t.test(EMCS$mean_SE,MCS$mean_SE)
# std_SE
t.test(EMCS$std_SE,MCS$std_SE) 
# cv_SE
t.test(EMCS$cv_SE,MCS$cv_SE) 

# EMCS - UWS :
# pk1, pk2, pk3
t.test(EMCS$pk1,UWS$pk1)
t.test(EMCS$pk2,UWS$pk2) 
t.test(EMCS$pk3,UWS$pk3) 

# MSA  -- pk1, pk2, pk3 ---
t.test(EMCS$pk1_MSA,UWS$pk1_MSA) 
t.test(EMCS$pk2_MSA,UWS$pk2_MSA) 
t.test(EMCS$pk3_MSA,UWS$pk3_MSA) 

# SE -- pk1, pk2, pk3 ---
t.test(EMCS$pk1_SE,UWS$pk1_SE) 
t.test(EMCS$pk2_SE,UWS$pk2_SE) 
t.test(EMCS$pk3_SE,UWS$pk3_SE) 

# mean_SE  -- pk1, pk2, pk3 ---
t.test(EMCS$mean_SE,UWS$mean_SE) 
# std_SE
t.test(EMCS$std_SE,UWS$std_SE) 
# cv_SE
t.test(EMCS$cv_SE,UWS$cv_SE) 


# MCS - UWS :
#  -- pk1, pk2, pk3 ---
t.test(MCS$pk1,UWS$pk1) 
t.test(MCS$pk2,UWS$pk2) 
t.test(MCS$pk3,UWS$pk3) 

# MSA  -- pk1, pk2, pk3 ---
t.test(MCS$pk1_MSA,UWS$pk1_MSA)
t.test(MCS$pk2_MSA,UWS$pk2_MSA) 
t.test(MCS$pk3_MSA,UWS$pk3_MSA) 

# SE  -- pk1, pk2, pk3 ---
t.test(MCS$pk1_SE,UWS$pk1_SE) 
t.test(MCS$pk2_SE,UWS$pk2_SE) 
t.test(MCS$pk3_SE,UWS$pk3_SE) 

# mean_SE
t.test(MCS$mean_SE,UWS$mean_SE) 
# std_SE
t.test(MCS$std_SE,UWS$std_SE) 
# cv_SE
t.test(MCS$cv_SE,UWS$cv_SE) 



