
### Ultradian walking for all the folders :)

#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/", "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/")
length(folders_2work)
#diagnosis_2work <- c("MCS+","MCS-", "MCS_ast", "UWS")
diagnosis_2work <- c("UWS")
length(diagnosis_2work)
#folderdays <- c("/acti_files_csv/5days/","/acti_files_csv/6days/","/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
folderdays <- c("/acti_files_csv/5days/")
#result_files <- c("/result_Ultra1LombScargle_4days.csv","/result_Ultra1LombScargle_5days.csv","/result_Ultra1LombScargle_6days.csv", "/result_Ultra1LombScargle_7days.csv")
result_files <- c("/result_Ultra4bLombScargle_5days.csv")
#result_plot_circ_files <- c("/result_plot_circ_5days.jpg","/result_plot_circ_6days.jpg","/result_plot_circ_7days.jpg")
result_plot_circ_files <- c("/result_plot_circ_5days.csv")



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
      result_plot <- paste0(workfolder_1,result_plot_circ_files[i])
      #print(workfolder_1)
      #print(workfolder_2)
      #print(resultw_csv)

      list_files <- list.files(workfolder_2, pattern = ".csv")


      #table_Circ_Lomb_plot = data.frame()
      #table_Circ_Lomb_plot<-data.frame(activity = NULL)

      table_Circ_Lomb_plot<-NULL

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

      #  readline(prompt="Press [enter] to continue")

      } # for -> file_csv
      cat(sprintf("printing file %s \n",result_plot ))


      write.table(table_Circ_Lomb_plot, file = result_plot,sep=",", append = TRUE)


      #A <- 65
      #f <- 1/(1423)
      #Ttime <- length(data$V2)
      #Ttime <- 10080
      #xx <- c(seq(1,Ttime,by=1.0))
      #xdata <- cbind(data,xx)

      #fcos <-A*cos(2*pi*f*xx) + A

      #mesor <- mean(data$V2[data$V2!=0],na.rm = TRUE) # mean not counting zeros and NA (Non a number)
      #ydata <- cbind(xdata,fcos)

      #summary(data)



      #jpeg('/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/Plottest_4.jpg')
      #plot(data$V1, data$V2,  main="Plot of ...", xlab="Time", ylab="Acitivity", pch=19)
      #lines(xx,fcos)
      #dev.off()



    } # folder days 4d,5d,...
    #  }
  } # Diagnosis MCS+ MCS-
} # MTN and AWD

library('R.matlab')
# Ultradian
table_Ultr_MSA_1<- data.frame(C_mean = mea_ultrMSA_MCS, C_sde = std_ultrMSA_MCS/sqrt(n_ultrMSA_mcs))
table_Ultr_MSA_2 <- data.frame(C_mean = mea_ultrMSA_UWS, C_sde = std_ultrMSA_UWS/sqrt(n_ultrMSA_uws))

table_Ultr_MSA <- rbind(table_Ultr_MSA_1, table_Ultr_MSA_2)


writeMat("/home/aldo/Documents/Projects/Avtivemeter/Data/Comparison_3Methods/data_UltrMSA_errorplot.mat", data_UltrMSA_errorplot = data.matrix(table_Ultr_MSA))


