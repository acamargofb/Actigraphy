
###############################################################################################
###############################################################################################
########################### Resume of the results #############################################
###############################################################################################
###############################################################################################

table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks_120min.csv", header=TRUE, sep=",")

data <- table_data_pks
summary(data)


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

#####################################################################
#####################################################################
#######   Using a subgroup of the data with only MCS and UWS  #######
#####################################################################
#####################################################################

#table_data_pks <- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/group_table_pks.csv", header=TRUE, sep=",")
#summary(table_data_pks)

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


table_resume <- data.frame(MCS_pk1_SE=Group_MCS$pk1_SE, MCS_pk2_SE=Group_MCS$pk2_SE, MCS_pk3_SE=Group_MCS$pk3_SE, UWS_pk1_SE=Group_UWS$pk1_SE, UWS_pk2_SE=Group_UWS$pk2_SE, UWS_pk3_SE=Group_UWS$pk3_SE)


## Putting together a new table to plot the error bar :)

vect1 <-c("MCS", "pk1",data_mean_pk1SE_MCS, data_std_pk1SE_MCS, n_pk1SE_MCS, se_pk1SE_MCS)
vect2 <-c("MCS", "pk2",data_mean_pk2SE_MCS, data_std_pk2SE_MCS, n_pk2SE_MCS, se_pk2SE_MCS)
vect3 <-c("MCS", "pk3",data_mean_pk3SE_MCS, data_std_pk3SE_MCS, n_pk3SE_MCS, se_pk3SE_MCS)

vect4 <-c("UWS", "pk1",data_mean_pk1SE_UWS, data_std_pk1SE_UWS, n_pk1SE_UWS, se_pk1SE_UWS)
vect5 <-c("UWS", "pk2",data_mean_pk2SE_UWS, data_std_pk2SE_UWS, n_pk2SE_UWS, se_pk2SE_UWS)
vect6 <-c("UWS", "pk3",data_mean_pk3SE_UWS, data_std_pk3SE_UWS, n_pk3SE_UWS, se_pk3SE_UWS)


name_vector <- c("Diagnosis", "peak_SE", "mean_value", "sd_value", "n", "se_value")


#change the names of the dataframe to be the titles
#change the names of the dataframe to be the titles
colnames(table_resume_errorbar) <- name_vector;

table_resume_errorbar = as.data.frame(t(vect1));
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect2)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect3)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect4)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect5)))
table_resume_errorbar = rbind(table_resume_errorbar,as.data.frame(t(vect6)))

myData <- table_resume_errorbar
library(ggplot2)

dodge <- position_dodge(width = 0.9)
limits <- aes(ymax = myData$mean_value + myData$se_value,
              ymin = myData$mean_value - myData$se_value)

limits <-  expand_limits(y=c(0, 3.0))

p <- ggplot(data = myData, aes(x = peak_SE, y = mean_value, fill = Diagnosis))


write.csv(myData, file = "/home/aldo/Documents/Projects/Avtivemeter/Data/MyData.csv")



p + geom_bar(stat = "identity", position = dodge) +
  geom_errorbar(limits, position = dodge, width = 0.25) +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank(),
        axis.title.x=element_blank()) + 
       expand_limits(y=c(0, 3.0))




