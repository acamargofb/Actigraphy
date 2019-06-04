
### Ultradian walking for all the folders :)
library('R.matlab')

#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/", "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/", "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/")
length(folders_2work)
#diagnosis_2work <- c("MCS+","MCS-", "MCS_ast", "UWS")
diagnosis_2work <- c("MCS","UWS")

#folderdays <- c("/acti_files_csv/5days/","/acti_files_csv/6days/","/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
folderdays <- c("/acti_files_csv/4days/")
#result_files <- c("/result_Ultra1LombScargle_4days.csv","/result_Ultra1LombScargle_5days.csv","/result_Ultra1LombScargle_6days.csv", "/result_Ultra1LombScargle_7days.csv")
#result_files <- c("/result_Ultra4bLombScargle_4days.csv")
#result_plot_circ_files <- c("/result_plot_circ_5days.jpg","/result_plot_circ_6days.jpg","/result_plot_circ_7days.jpg")
#result_plot_circ_files <- c("/result_plot_circ_4days.csv")
# to write results in MAT file to be able to use it later

#result_MAT_circ_files <- c("/result_mat_circ_4days.mat") #
#result_circ_lomb_files <- c("/result_LombScarge_circ_7days.csv")
#result_mean_circ_files <- c("/result_mean_circ_7days.csv")

resultMAT_circ_lomb_files <- c("/result_LombScarge_circ_4days.mat")
resultMAT_mean_circ_files <- c("/result_mean_circ_4days.mat")

for (foldername in folders_2work){
  for (diagnosis in diagnosis_2work){
    #for(result_file in result_files){  # correct this loops
     i<-0
    for(folddays in folderdays){   # correct this loops
      i<- i + 1
      workfolder_1 <-  paste0(foldername,diagnosis)
      workfolder_2 <- paste0(workfolder_1,folddays)
      #resultw_csv <- paste0(workfolder_1,result_file)
      resultw_csv <- paste0(workfolder_1,result_files[i])
    #  result_plot <- paste0(workfolder_1,result_plot_circ_files[i])
     # result_mat <- paste0(workfolder_1,result_MAT_circ_files[i])
    #  result_LS <- paste0(workfolder_1,result_circ_lomb_files[i])
    #  result_mean_files <- paste0(workfolder_1,result_mean_circ_files[i])

      result_LS_mat <- paste0(workfolder_1,resultMAT_circ_lomb_files[i])
      result_mean_files_mat <- paste0(workfolder_1,resultMAT_mean_circ_files[i])

      #print(workfolder_1)
      #print(workfolder_2)
      #print(resultw_csv)

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
        summary(data)

         # This part of the code plots the actigraphy data and also the circadian

        table_Circ_Lomb_plot <- cbind(table_Circ_Lomb_plot, data$V2)

        #readline(prompt="Press [enter] to continue")

      } # for -> file_csv
      cat(sprintf("printing file %s \n",result_plot ))

      write.table(table_Circ_Lomb_plot, file = result_plot,sep=",", append = TRUE)

     # Compute the mean of all the subjects
      table_Circ_Lomb_plot_mean <- apply(table_Circ_Lomb_plot,1,mean)

      #write.table(table_Circ_Lomb_plot_mean, file = result_mean_files,sep=",", append = TRUE)

      writeMat(result_mean_files_mat, data_circ_mean = data.matrix(table_Circ_Lomb_plot_mean))

      # Circadian

      #writeMat(result_mat, data_circ_plot = data.matrix(table_Circ_Lomb_plot))

      # Computes the circadian for the mean of all subjects
      data1.spec<- lsp(table_Circ_Lomb_plot_mean, times = NULL, from=1140, to=1680, type=c("period"), ofac=100)
      summ <- summary(data.spec)

      # Creates a table for all the results of power and periodicity using Lomb Scargle
      table_circ_lomb <- cbind(table_circ_lomb, data1.spec$scanned, data1.spec$power)

      writeMat(result_LS_mat, data_LS = data.matrix(table_circ_lomb))

      #write.table(table_circ_lomb, file = result_LS,sep=",", append = TRUE)

    } # folder days 4d,5d,...
    #  }
  } # Diagnosis MCS+ MCS-
} # MTN and AWD
