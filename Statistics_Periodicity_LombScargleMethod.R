#############################################################################################################
## This R script to do statistical analysis on the Lomb-Scargle Method for every periodicity
##
#############################################################################################################


### Ultradian walking for all the folders :)
library('R.matlab')
library('pragma')

library(data.table)

MCS_folder <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/")
UWS_folder <- c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/")

#file for Circadian
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days_2.mat'
result_LS_MCS_circ_mat <- paste0(MCS_folder,file_mat_LS_circ_4d)
result_LS_UWS_circ_mat <- paste0(UWS_folder,file_mat_LS_circ_4d)



#file for Ultradian
file_mat_LS_ultr_4d = 'result_LombScarge_ultra_4days_2.mat'
result_LS_MCS_ultr_mat <- paste0(MCS_folder,file_mat_LS_ultr_4d)
result_LS_UWS_ultr_mat <- paste0(UWS_folder,file_mat_LS_ultr_4d)

##############################################################
##############################################################
#### Processing Circadian data   #############################
####                             #############################
##############################################################
##############################################################


############
### MCS ####
############

data_MCS <- readMat(result_LS_MCS_circ_mat)

m<- length(data_MCS[[1]][,1])
n_mcs<- length(data_MCS[[1]][1,])

vector_values <- seq(2,n_mcs, by=2)

# Getting the time and power from the data
t_periodicity_MCS <- data_MCS[[1]][,1]
power_MCS <-data_MCS[[1]][,vector_values]

############
### UWS ####
############

data_UWS <- readMat(result_LS_UWS_circ_mat)

m<- length(data_UWS[[1]][,1])
n_uws<- length(data_UWS[[1]][1,])

vector_values <- seq(2,n_uws, by=2)

# Getting the time and power from the data
t_periodicity_UWS <- data_UWS[[1]][,1]
power_UWS <-data_UWS[[1]][,vector_values]

#power_UWS[1,]
#power_MCS[1,]

#preparing the variables to use on the loops

width_mcs_power <- seq(1,length(power_MCS[1,]), by=1)
width_uws_power <- seq(1,length(power_UWS[1,]), by=1)

vector_for <- seq(1,m, by=1)
vector_for_mcs <- seq(1,n_mcs, by=1)
vector_for_uws <- seq(1,n_uws, by=1)

#i<-1  # used for debugging


# declaring the data frames that will contain the results
p_value_vector<-data.frame(pvalue = NULL)
table_Circ_Power <- data.frame(ID_ = NULL, Power = NULL, Diagnosis = NULL)

for(i in vector_for){ # for loop over all the periodicities points
  for(ii in width_mcs_power){ # for loop over the number of subject on MCS 
    x<-power_MCS[i,ii]
    table_Circ_Power_temp <- data.frame(Power = x,Diagnosis = "MCS")
    table_Circ_Power <- rbind(table_Circ_Power, table_Circ_Power_temp)
  }
  for(jj in width_uws_power){ # for loop over the number of subject on UWS 
    x<-power_UWS[i,jj]
    table_Circ_Power_temp <- data.frame(Power = x, Diagnosis ="UWS")
    table_Circ_Power <- rbind(table_Circ_Power, table_Circ_Power_temp)
    # the previous table contains both MCS and UWS data per periodicity
  }
  # Now it is time to do the statistics on this data obtained
  # Doing Wilcox Test f
  xx <-table_Circ_Power$Diagnosis
  yy<- table_Circ_Power$Power
  ##wt<- wilcox.test(yy~xx)  
  ##pvalue <-wt$p.value
  
  # Doing Kruskal Wallis Test
  kt<- kruskal.test(yy~xx)
  pvalue <- kt$p.value
  
  # Then we store the results in a data frame for pvalues
  
  p_value_vector_temp<- data.frame(pvalue = pvalue)
  
  p_value_vector <- rbind(p_value_vector, p_value_vector_temp)
  
  table_Circ_Power <- data.frame(ID_ = NULL, Power = NULL, Diagnosis = NULL)
  #p_value_vector<-data.frame(pvalue = NULL)
}

p_value_vector_matrix = data.matrix(p_value_vector)

p_value_adj <- p.adjust(p_value_vector_matrix,method="BH")

##############################################################
##############################################################
#### Processing Ultradian data   #############################
####                             #############################
##############################################################
##############################################################


############
### MCS ####
############

data_MCS <- readMat(result_LS_MCS_ultr_mat)

m<- length(data_MCS[[1]][,1])
n_mcs<- length(data_MCS[[1]][1,])

vector_values <- seq(2,n_mcs, by=2)

# Getting the time and power from the data
t_periodicity_MCS <- data_MCS[[1]][,1]
power_MCS <-data_MCS[[1]][,vector_values]

############
### UWS ####
############

data_UWS <- readMat(result_LS_UWS_ultr_mat)

m<- length(data_UWS[[1]][,1])
n_uws<- length(data_UWS[[1]][1,])

vector_values <- seq(2,n_uws, by=2)

# Getting the time and power from the data
t_periodicity_UWS <- data_UWS[[1]][,1]
power_UWS <-data_UWS[[1]][,vector_values]

#power_UWS[1,]
#power_MCS[1,]

#preparing the variables to use on the loops

width_mcs_power <- seq(1,length(power_MCS[1,]), by=1)
width_uws_power <- seq(1,length(power_UWS[1,]), by=1)

vector_for <- seq(1,m, by=1)
vector_for_mcs <- seq(1,n_mcs, by=1)
vector_for_uws <- seq(1,n_uws, by=1)

#i<-2  # used for debugging


# declaring the data frames that will contain the results
p_value_vector<-data.frame(pvalue = NULL)
table_Circ_Power <- data.frame(ID_ = NULL, Power = NULL, Diagnosis = NULL)



for(i in vector_for){ # for loop over all the periodicities points
  for(ii in width_mcs_power){ # for loop over the number of subject on MCS 
    x<-power_MCS[i,ii]
    table_Circ_Power_temp <- data.frame(Power = x,Diagnosis = "MCS")
    table_Circ_Power <- rbind(table_Circ_Power, table_Circ_Power_temp)
  }
  for(jj in width_uws_power){ # for loop over the number of subject on UWS 
    x<-power_UWS[i,jj]
    table_Circ_Power_temp <- data.frame(Power = x, Diagnosis ="UWS")
    table_Circ_Power <- rbind(table_Circ_Power, table_Circ_Power_temp)
    # the previous table contains both MCS and UWS data per periodicity
  }
  # Now it is time to do the statistics on this data obtained
  # Doing Wilcox Test f
  xx <-table_Circ_Power$Diagnosis
  yy<- table_Circ_Power$Power
  wt<- wilcox.test(yy~xx)  
  pvalue <-wt$p.value
  
  # Then we store the results in a data frame for pvalues
  
  p_value_vector_temp<- data.frame(pvalue = pvalue)
  
  p_value_vector <- rbind(p_value_vector, p_value_vector_temp)
  
  table_Circ_Power <- data.frame(ID_ = NULL, Power = NULL, Diagnosis = NULL)
  #p_value_vector<-data.frame(pvalue = NULL)
}
p_value_vector_matrix = data.matrix(p_value_vector)

p_value_adj <- p.adjust(p_value_vector_matrix,method="BH")


