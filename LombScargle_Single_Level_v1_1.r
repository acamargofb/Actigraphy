#############################################################################################################
## This R script aims to get the values to get all the circadian/ultradian periodicities using             ##
## Lomb Scargle Method. The idea is to get a MAT (1 or more) where it(they) has(have) the values of those  ##
## periodicities.                                                                                          ##
#############################################################################################################


### Ultradian walking for all the folders :)
library('R.matlab')
library(lomb)
library(pracma)


#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/", "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/")
folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/")

diagnosis_2work <- c("MCS")
#diagnosis_2work <- c("UWS", "EMCS", "LIS", "Control")

#folderdays <- c("/acti_files_csv/5days/","/acti_files_csv/6days/","/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
#folderdays <- c("/acti_files_csv/4days/")
folderdays <- c("/acti_files_csv/4days/")
#result_files <- c("/result_Ultra1LombScargle_4days.csv","/result_Ultra1LombScargle_5days.csv","/result_Ultra1LombScargle_6days.csv", "/result_Ultra1LombScargle_7days.csv")
#result_files <- c("/result_Ultra4bLombScargle_4days.csv")
#result_plot_circ_files <- c("/result_plot_circ_5days.jpg","/result_plot_circ_6days.jpg","/result_plot_circ_7days.jpg")
#result_plot_circ_files <- c("/result_plot_circ_4days.csv")
# to write results in MAT file to be able to use it later

#result_MAT_circ_files <- c("/result_mat_circ_4days.mat") #
#result_circ_lomb_files <- c("/result_LombScarge_circ_7days.csv")
#result_mean_circ_files <- c("/result_mean_circ_7days.csv")

#Circadian

#resultMAT_circ_lomb_files <- c("/result_LombScarge_circ_4days_2.mat")
#resultMAT_mean_circ_files <- c("/result_mean_ultra_4days_2.mat")
resultMAT_circ_lomb_files <- c("/result_LombScarge_circ_4days_5.mat")


#Ultradian
#result_LombScarge_circ_4days_2.mat

#resultMAT_circ_lomb_files <- c("/result_LombScarge_ultrad_mcs_4days_3.mat")
#resultMAT_mean_circ_files <- c("/result_mean_ultra_4days_3.mat")
resultMAT_circ_lomb_files <- c("/result_LombScarge_ultrd_4days_5.mat")



#names_folders_MCS = "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/files_considered.csv"
#names_folders_UWS = "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/files_considered.csv"
resumen_mcs_results = "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/resumen_MCS_results.csv"
#resumen_uws_results = "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/resumen_UWS_results.csv"

for (foldername in folders_2work){
  for (diagnosis in diagnosis_2work){
    #for(result_file in result_files){  # correct this loops
    i<-0
    for(folddays in folderdays){   # correct this loops
      i<- i + 1
      workfolder_1 <-  paste0(foldername,diagnosis)
      workfolder_2 <- paste0(workfolder_1,folddays)
      #resultw_csv <- paste0(workfolder_1,result_file)
      
      #  result_plot <- paste0(workfolder_1,result_plot_circ_files[i])
      # result_mat <- paste0(workfolder_1,result_MAT_circ_files[i])
      #  result_LS <- paste0(workfolder_1,result_circ_lomb_files[i])
      #  result_mean_files <- paste0(workfolder_1,result_mean_circ_files[i])
      
      result_LS_mat <- paste0(workfolder_1,resultMAT_circ_lomb_files[i])
      # result_mean_files_mat <- paste0(workfolder_1,resultMAT_mean_circ_files[i])
      
      #print(workfolder_1)
      #print(workfolder_2)
      #print(resultw_csv)
      
      cat(sprintf("Getting the list of files to work with \n" ))
      
      list_files <- list.files(workfolder_2, pattern = ".csv")
      
      
      #table_Circ_Lomb_plot = data.frame()
      #table_Circ_Lomb_plot<-data.frame(activity = NULL)
      
      table_Circ_Lomb_plot<-NULL
      table_circ_lomb <- NULL
      table_Circ_Lomb_plot_mean <- data.frame(time = NULL, acti_mean = NULL)
      
      for (file_csv in list_files){
        
        filew_csv <- paste0(workfolder_2,file_csv)
        print(filew_csv)
        
        #table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
        
        #table_data<- read.csv(file='/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/acti_files_csv/5days/UWS_02_mtn_acti.csv', header=FALSE, sep=",")
        table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
        data <- table_data
        
        # Computes the circadian for the mean of all subjects
        cat(sprintf("Using Lomb Scargle method \n" ))
        data1.spec<- lsp(data$V2, times = NULL, from=120, to=200, type=c("period"), ofac=100)
        summ <- summary(data1.spec)
        
        # Creates a table for all the results of power and periodicity using Lomb Scargle
        
        cat(sprintf("Creating the table \n" ))
        table_circ_lomb <- cbind(table_circ_lomb, data1.spec$scanned, data1.spec$power)
        #table_circ_lomb <- cbind(table_circ_lomb, data1.spec$scanned, data1.spec$power, file_csv)
        #table_circ_lomb <- cbind(table_circ_lomb, periodc = data1.spec$scanned, power = data1.spec$power, filecsv =file_csv)
        
        #table_circ_lomb <- cbind(table_circ_lomb, data1.spec$scanned, data1.spec$power)
        
        cat(sprintf("Writing the table to a MAT file \n" ))
        writeMat(result_LS_mat, data_LS = data.matrix(table_circ_lomb))
        
        # This part of the code plots the actigraphy data and also the circadian
        
        #  cat(sprintf("Important Values \n" ))
        
        
        #print(summary(data1.spec))
        # readline(prompt="Press [enter] to continue")
        
      } # for -> file_csv
      cat(sprintf("Finishing the process \n" ))
      
      
    } # folder days 4d,5d,...
    #  }
  } # Diagnosis MCS+ MCS-
} # MTN and AWD

write.table(table_circ_lomb, file = resumen_mcs_results, sep = ",")

#write.table(table_circ_lomb, file = resumen_uws_results, sep = ",")
#write.table(list_files, file = names_folders_UWS, sep = ",")


# Computing AUC
x = seq(0,pi, by=0.01)
y = sin(x)

temp <- trapz(x,y)

data_area = data_frame(x=x,y=y)
area = auc(data_area, min = 1, max = 1)
