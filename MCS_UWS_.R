#####################################################################
#####################################################################
#######   Using a subgroup of the data with only MCS and UWS  #######
#####################################################################
#####################################################################

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)

# I want to consider only MCS and UWS

Group_MCS_UWS <- subset(table_data_pks, Group != 'EMCS')
summary(Group_MCS_UWS)


#pk1
Model_pks1 <- lm(Group_MCS_UWS$pk1 ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_pks1)
Anova(Model_pks1, type="II")


#pk2

Model_pks2 <- lm(Group_MCS_UWS$pk2 ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_pks2)
Anova(Model_pks2, type="II")


#pk3
Model_pks3 <- lm(Group_MCS_UWS$pk3 ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_pks3)
Anova(Model_pks3, type="II")

####################################################################################
###################   MSA of the pks ###############################################
####################################################################################

#MSA pk1
Model_MSA_pks1 <- lm(Group_MCS_UWS$pk1_MSA ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_MSA_pks1)
Anova(Model_MSA_pks1, type="II")


#MSA pk2
Model_MSA_pks2 <- lm(Group_MCS_UWS$pk2_MSA ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_MSA_pks2)
Anova(Model_MSA_pks2, type="II")


#MSA pk3
Model_MSA_pks3 <- lm(Group_MCS_UWS$pk3_MSA ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_MSA_pks3)
Anova(Model_MSA_pks3, type="II")

####################################################################################
###################   SE of the pks ################################################
####################################################################################


#SE pk1
Model_SE_pks1 <- lm(Group_MCS_UWS$pk1_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_pks1)
Anova(Model_SE_pks1, type="II")


#SE pk2
Model_SE_pks2 <- lm(Group_MCS_UWS$pk2_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_pks2)
Anova(Model_SE_pks2, type="II")


#SE pk3
Model_SE_pks3 <- lm(Group_MCS_UWS$pk3_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_pks3)
Anova(Model_SE_pks3, type="II")

####################################################################################
###################   Mean, Std, CV, of SE #########################################
####################################################################################

#mean SE 
Model_SE_mean <- lm(Group_MCS_UWS$mean_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_mean)
Anova(Model_SE_mean, type="II")


#std SE
Model_SE_std <- lm(Group_MCS_UWS$std_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_std)
Anova(Model_SE_std, type="II")


#cv SE
Model_SE_cv <- lm(Group_MCS_UWS$cv_SE ~ Group_MCS_UWS$Group*Group_MCS_UWS$Manu)
summary(Model_SE_cv)
Anova(Model_SE_cv, type="II")