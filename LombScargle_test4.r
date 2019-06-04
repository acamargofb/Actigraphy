
### Ultradian walking for all the folders :)

#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/", "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
length(folders_2work)
#diagnosis_2work <- c("MCS+","MCS-", "MCS_ast", "UWS")
diagnosis_2work <- c("UWS")
length(diagnosis_2work)
folderdays <- c("/acti_files_csv/5days/","/acti_files_csv/6days/","/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
#folderdays <- c("/acti_files_csv/4days/","/acti_files_csv/5days/", "/acti_files_csv/6days/", "/acti_files_csv/7days/")
#result_files <- c("/result_Ultra1LombScargle_4days.csv","/result_Ultra1LombScargle_5days.csv","/result_Ultra1LombScargle_6days.csv", "/result_Ultra1LombScargle_7days.csv")
result_files <- c("/result_Ultra4bLombScargle_5days.csv","/result_Ultra4bLombScargle_6days.csv","/result_Ultra4bLombScargle_7days.csv")
i<-0
for (foldername in folders_2work){
  for (diagnosis in diagnosis_2work){
    #for(result_file in result_files){  # correct this loops

      for(folddays in folderdays){   # correct this loops
        i<- i + 1
        workfolder_1 <-  paste0(foldername,diagnosis)
        workfolder_2 <- paste0(workfolder_1,folddays)
        #resultw_csv <- paste0(workfolder_1,result_file)
        resultw_csv <- paste0(workfolder_1,result_files[i])
        #print(workfolder_1)
        #print(workfolder_2)
        #print(resultw_csv)

        list_files <- list.files(workfolder_2, pattern = ".csv")

        table_Circ_Lomb<- data.frame(ID_ = NULL, filename = NULL, Period_ = NULL, Power_ = NULL , p_value_ = NULL)

        for (file_csv in list_files){

          filew_csv <- paste0(workfolder_2,file_csv)
          print(filew_csv)

          table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
          data <- table_data
          #summary(data)

          data.spec<- lsp(data$V2, times = NULL, from=20, to=240, type=c("period"), ofac=100)

          summ <- summary(data.spec)
          summ_dataframe <- data.frame(summ)
          d<-rbind("?", c(summ_dataframe))

          power<-d[2,1]$Value[9] ## Power
          period<-d[2,1]$Value[10] ## Periodicity
          p_value<-d[2,1]$Value[12] ## p-value

          table_Circ_Lomb_1 <- data.frame(file_csv,period, power, p_value)
          table_Circ_Lomb <- rbind(table_Circ_Lomb, table_Circ_Lomb_1)

          print(summary(data.spec))

        } # for -> file_csv
        cat(sprintf("printing file %s \n",resultw_csv ))

        write.table(table_Circ_Lomb, file = resultw_csv,sep="\t", append = TRUE)

      } # folder days 4d,5d,...
  #  }
  } # Diagnosis MCS+ MCS-
} # MTN and AWD
