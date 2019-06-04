####################################################################################
###################   pks (on minutes)##############################################
####################################################################################

#install.packages('nloptr')
library(nloptr)

#install.packages("car")
library("car")

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks_120min.csv", header=TRUE, sep=",")
summary(table_data_pks)

## ANOVA  ##

#pk1
Model_pks1 <- lm(table_data_pks$pk1 ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_pks1)
Anova(Model_pks1, type="II")



## t-test  ##
# independent 2-group t-test
EMCS <-  subset(table_data_pks, Group == 'EMCS')
MCS <-  subset(table_data_pks, Group == 'MCS')
UWS <-  subset(table_data_pks, Group == 'UWS')

# EMCS - MCS :  
# pk1
t.test(EMCS$pk1,MCS$pk1) 
# MSA
t.test(EMCS$pk1_MSA,MCS$pk1_MSA) 
# SE
t.test(EMCS$pk1_SE,MCS$pk1_SE) 
# mean_SE
t.test(EMCS$mean_SE,MCS$mean_SE) 
# std_SE
t.test(EMCS$std_SE,MCS$std_SE) 
# cv_SE
t.test(EMCS$cv_SE,MCS$cv_SE) 

# EMCS - UWS :
# pk1
t.test(EMCS$pk1,UWS$pk1) 
# MSA
t.test(EMCS$pk1_MSA,UWS$pk1_MSA) 
# SE
t.test(EMCS$pk1_SE,UWS$pk1_SE) 

# mean_SE
t.test(EMCS$mean_SE,UWS$mean_SE) 
# std_SE
t.test(EMCS$std_SE,UWS$std_SE) 
# cv_SE
t.test(EMCS$cv_SE,UWS$cv_SE) 


# MCS - UWS :
# pk1
t.test(MCS$pk1,UWS$pk1) 
# MSA
t.test(MCS$pk1_MSA,UWS$pk1_MSA)  
# SE
t.test(MCS$pk1_SE,UWS$pk1_SE) 

# mean_SE
t.test(MCS$mean_SE,UWS$mean_SE) 
# std_SE
t.test(MCS$std_SE,UWS$std_SE) 
# cv_SE
t.test(MCS$cv_SE,UWS$cv_SE) 


####################################################################################
###################   MSA of the pks ###############################################
####################################################################################


#MSA pk1
Model_MSA_pks1 <- lm(table_data_pks$pk1_MSA ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_MSA_pks1)
Anova(Model_MSA_pks1, type="II")


####################################################################################
###################   SE of the pks ################################################
####################################################################################



#SE pk1
Model_SE_pks1 <- lm(table_data_pks$pk1_SE ~ table_data_pks$Group*table_data_pks$Manu)
summary(Model_SE_pks1)
Anova(Model_SE_pks1, type="II")



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