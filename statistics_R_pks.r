
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

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)


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

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)


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

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)

#  This code is to select only the columns 1,2,5 and 6 :)
data_mcs_uws <- table_data_pks[,c(1,2,5,6)]

# But as I want to consider only MCS and UWS

Group_MCS_UWS <- subset(data, Group != 'EMCS')
summary(Group_MCS_UWS)

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks_120min.csv", header=TRUE, sep=",")
summary(table_data_pks)


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

###############################################################################################
###############################################################################################
########################### Resume of the results #############################################
###############################################################################################
###############################################################################################

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

data_mean_pk1SE <-mean(Group_Subset$pk1_SE, trim = 0, na.rm = TRUE)
data_std_pk1SE <- sd(Group_Subset$pk1_SE, na.rm = TRUE)

data_mean_meanSE <-mean(Group_Subset$mean_SE, trim = 0, na.rm = TRUE)
data_std_meanSE <- sd(Group_Subset$mean_SE, na.rm = TRUE)

data_mean_stdSE <-mean(Group_Subset$std_SE, trim = 0, na.rm = TRUE)
data_std_stdSE <- sd(Group_Subset$std_SE, na.rm = TRUE)

data_mean_cvSE <-mean(Group_Subset$cv_SE, trim = 0, na.rm = TRUE)
data_std_cvSE <- sd(Group_Subset$cv_SE, na.rm = TRUE)

table_resume <- data.frame(pk1_mean=data_mean_pk1, pk1_std = data_std_pk1, pk1_MSA_mean=data_mean_pk1MSA, pk1_MSA_std=data_std_pk1MSA, pk1SE_mean = data_mean_pk1SE, pk1SE_std =data_std_pk1SE ) 

table_resume$meanSE_mean=data_mean_meanSE
table_resume$meanSE_std=data_std_meanSE

table_resume$stdSE_mean=data_mean_stdSE
table_resume$stdSE_std=data_std_stdSE

table_resume$cvSE_mean=data_mean_cvSE
table_resume$cvSE_std=data_std_cvSE

##############
### MCS #####
##############

Group_Subset <- subset(data, Group == 'MCS')

data_mean_pk1_MCS <-mean(Group_Subset$pk1, trim = 0, na.rm = TRUE)
data_std_pk1_MCS <- sd(Group_Subset$pk1, na.rm = TRUE)

data_mean_pk1MSA_MCS <-mean(Group_Subset$pk1_MSA, trim = 0, na.rm = TRUE)
data_std_pk1MSA_MCS <- sd(Group_Subset$pk1_MSA,  na.rm = TRUE)

data_mean_pk1SE_MCS <-mean(Group_Subset$pk1_SE, trim = 0, na.rm = TRUE)
data_std_pk1SE_MCS <- sd(Group_Subset$pk1_SE,  na.rm = TRUE)

data_mean_pk2SE_MCS <-mean(Group_Subset$pk2_SE, trim = 0, na.rm = TRUE)
data_std_pk2SE_MCS <- sd(Group_Subset$pk2_SE,  na.rm = TRUE)

data_mean_pk3SE_MCS <-mean(Group_Subset$pk3_SE, trim = 0, na.rm = TRUE)
data_std_pk3SE_MCS <- sd(Group_Subset$pk3_SE,  na.rm = TRUE)


data_mean_meanSE_MCS <-mean(Group_Subset$mean_SE, trim = 0, na.rm = TRUE)
data_std_meanSE_MCS <- sd(Group_Subset$mean_SE,  na.rm = TRUE)

data_mean_stdSE_MCS <-mean(Group_Subset$std_SE, trim = 0, na.rm = TRUE)
data_std_stdSE_MCS <- sd(Group_Subset$std_SE,  na.rm = TRUE)

data_mean_cvSE_MCS <-mean(Group_Subset$cv_SE, trim = 0, na.rm = TRUE)
data_std_cvSE_MCS <- sd(Group_Subset$cv_SE,  na.rm = TRUE)

table_resume <- data.frame(pk1_mean=data_mean_pk1, pk1_std = data_std_pk1, pk1_MSA_mean=data_mean_pk1MSA, pk1_MSA_std=data_std_pk1MSA, pk1SE_mean = data_mean_pk1SE, pk1SE_std =data_std_pk1SE ) 

table_resume$meanSE_mean=data_mean_meanSE
table_resume$meanSE_std=data_std_meanSE

table_resume$stdSE_mean=data_mean_stdSE
table_resume$stdSE_std=data_std_stdSE

table_resume$cvSE_mean=data_mean_cvSE
table_resume$cvSE_std=data_std_cvSE


##############
### UWS #####
##############

Group_Subset <- subset(data, Group == 'UWS')

data_mean_pk1_UWS <-mean(Group_Subset$pk1, trim = 0, na.rm = TRUE)
data_std_pk1_UWS <- sd(Group_Subset$pk1, na.rm = TRUE)

data_mean_pk1MSA_UWS <-mean(Group_Subset$pk1_MSA, trim = 0, na.rm = TRUE)
data_std_pk1MSA_UWS <- sd(Group_Subset$pk1_MSA,  na.rm = TRUE)

data_mean_pk1SE_UWS <-mean(Group_Subset$pk1_SE, trim = 0, na.rm = TRUE)
data_std_pk1SE_UWS <- sd(Group_Subset$pk1_SE,  na.rm = TRUE)

data_mean_pk2SE_UWS <-mean(Group_Subset$pk2_SE, trim = 0, na.rm = TRUE)
data_std_pk2SE_UWS <- sd(Group_Subset$pk2_SE,  na.rm = TRUE)

data_mean_pk3SE_UWS <-mean(Group_Subset$pk3_SE, trim = 0, na.rm = TRUE)
data_std_pk3SE_UWS <- sd(Group_Subset$pk3_SE,  na.rm = TRUE)

data_mean_meanSE_UWS <-mean(Group_Subset$mean_SE, trim = 0, na.rm = TRUE)
data_std_meanSE_UWS <- sd(Group_Subset$mean_SE,  na.rm = TRUE)

data_mean_stdSE_UWS <-mean(Group_Subset$std_SE, trim = 0, na.rm = TRUE)
data_std_stdSE_UWS <- sd(Group_Subset$std_SE,  na.rm = TRUE)

data_mean_cvSE_UWS <-mean(Group_Subset$cv_SE, trim = 0, na.rm = TRUE)
data_std_cvSE_UWS <- sd(Group_Subset$cv_SE,  na.rm = TRUE)

table_resume <- data.frame(pk1_mean=data_mean_pk1, pk1_std = data_std_pk1, pk1_MSA_mean=data_mean_pk1MSA, pk1_MSA_std=data_std_pk1MSA, pk1SE_mean = data_mean_pk1SE, pk1SE_std =data_std_pk1SE ) 

table_resume$meanSE_mean=data_mean_meanSE
table_resume$meanSE_std=data_std_meanSE

table_resume$stdSE_mean=data_mean_stdSE
table_resume$stdSE_std=data_std_stdSE

table_resume$cvSE_mean=data_mean_cvSE
table_resume$cvSE_std=data_std_cvSE


#####################################################################
#####################################################################
#######   Using a subgroup of the data with only MCS and UWS  #######
#####################################################################
#####################################################################

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
summary(table_data_pks)

# I want to consider only MCS and UWS

Group_MCS_UWS <- subset(data, Group != 'EMCS')
summary(Group_MCS_UWS)

#######################
#######################
###                ####
### Error Bar Plot ####
###                ####
#######################
#######################

n <- dim(Group_MCS_UWS)[1]


Group_MCS_UWS$std_error <- Group_MCS_UWS$std_SE / sqrt(n)


library(ggplot2)
# Basic box plot
p <- ggplot(Group_MCS_UWS, aes(x=Group, y=pk1_SE)) + 
  geom_boxplot()

p

p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

p +   ylab('Mean pk1_SE')
p

###########
### MCS ###
###########

Group_MCS <- subset(Group_MCS_UWS, Group != 'UWS')
summary(Group_MCS)

n_pk1SE_MCS = length(Group_MCS$pk1_SE)
se_pk1SE_MCS = data_std_pk1SE_MCS/sqrt(n_pk1SE_MCS)

n_pk2SE_MCS = length(Group_MCS$pk2_SE)
se_pk2SE_MCS = data_std_pk2SE_MCS/sqrt(n_pk2SE_MCS)

n_pk3SE_MCS = length(Group_MCS$pk3_SE)
se_pk3SE_MCS = data_std_pk3SE_MCS/sqrt(n_pk3SE_MCS)

###########
### UWS ###
###########

Group_UWS <- subset(Group_MCS_UWS, Group != 'MCS')
summary(Group_UWS)

n_pk1SE_UWS = length(Group_UWS$pk1_SE)
se_pk1SE_UWS = data_std_pk1SE_MCS/sqrt(n_pk1SE_UWS)

n_pk2SE_UWS = length(Group_UWS$pk2_SE)
se_pk2SE_UWS = data_std_pk2SE_UWS/sqrt(n_pk2SE_UWS)

n_pk3SE_UWS = length(Group_UWS$pk3_SE)
se_pk3SE_UWS = data_std_pk3SE_UWS/sqrt(n_pk3SE_UWS)




## Putting together a new table to plot the error bar :)

vect1 <-c("MCS", "pk1",data_mean_pk1SE_MCS, data_std_pk1SE_MCS, n_pk1SE_MCS, se_pk1SE_MCS)
vect2 <-c("MCS", "pk2",data_mean_pk2SE_MCS, data_std_pk2SE_MCS, n_pk2SE_MCS, se_pk2SE_MCS)
vect3 <-c("MCS", "pk3",data_mean_pk3SE_MCS, data_std_pk3SE_MCS, n_pk3SE_MCS, se_pk3SE_MCS)

vect4 <-c("UWS", "pk1",data_mean_pk1SE_UWS, data_std_pk1SE_UWS, n_pk1SE_UWS, se_pk1SE_UWS)
vect5 <-c("UWS", "pk2",data_mean_pk2SE_UWS, data_std_pk2SE_UWS, n_pk2SE_UWS, se_pk2SE_UWS)
vect6 <-c("UWS", "pk3",data_mean_pk3SE_UWS, data_std_pk3SE_UWS, n_pk3SE_UWS, se_pk3SE_UWS)


name_vector <- c("Diagnosis", "peak_SE", "mean_value", "sd_value", "n", "se_value")


#change the names of the dataframe to be the titles


table_resume_errorbar = as.data.frame(t(vect1));
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect2)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect3)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect4)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect5)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect6)))




#change the names of the dataframe to be the titles
colnames(table_resume_errorbar) <- name_vector;



library(ggplot2)
ggplot(table_resume_errorbar, aes(x=table_resume_errorbar$peak, y=table_resume_errorbar$se)) + geom_bar(stat="identity") + 
  labs(x="Percentage", y="Proportion")

myData <- table_resume_errorbar

library(ggplot2)

dodge <- position_dodge(width = 0.9)
limits <- aes(ymax = myData$mean_value + myData$se_value,
              ymin = myData$mean_value - myData$se_value)

p <- ggplot(data = myData, aes(x = peak_SE, y = mean_value, fill = Diagnosis))

p + geom_bar(stat = "identity", position = dodge) +
  geom_errorbar(limits, position = dodge, width = 0.25) +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank(),
        axis.title.x=element_blank())


library(tidyr)
library(dplyr)

dataset <- read.table("myData", header = TRUE, dec=".")

summary <- myData 
  group_by(Diagnosis, peak)
  summarise(mean = myData$mean_value, se = myData$se_value)

  is.numeric(myData$mean_value)
  is.numeric(myData$se_value)
  

# Plot
ggplot(summary, aes(x = peak, y = mean, fill = Diagnosis)) + 
  geom_bar(stat = 'identity', position = 'dodge') +
  geom_errorbar(aes(ymin = mean_value - se_value, ymax = mean_value + se_value),                            
                width = 0.2,
                position = position_dodge(0.9)) +
  xlab('pks') +
  ylab('Mean')



