library(lomb)


### Circadian for body temperature using IButtons
table_data<- read.csv(file="/home/aldo/Documents/Projects/iButtons/Actigraphy_data/Randaxhe_Denis.csv", header=TRUE, sep=",")
data <- table_data
summary(data)

data.spec<- lsp(data$DPG_mean, times = data$t, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)

### Circadian with actiwatch using IButtons
table_data<- read.csv(file="/home/aldo/Documents/Projects/iButtons/Actigraphy_data/DE_RA_29082018_acti.csv", header=TRUE, sep=",")
data <- table_data
summary(data)

data.spec<- lsp(data$acti, times = data$time, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)

### Circadian with actiwatch
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/data_acti_4days_v2.csv", header=FALSE, sep=",")
#table_data<- read.csv(file="/home/aldo/Documents/Projects/iButtons/Actigraphy_data/Lemmens_acti_R.csv", header=FALSE, sep=",")
data <- table_data
summary(data)

data.spec<- lsp(data$V2, times = data$V1, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)

data.spec<- lsp(data$V2, times  = NULL, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)


### Circadian with actiwatch
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/acti_files_csv/4days/MCS_m_09acti.csv", header=FALSE, sep=",")
data <- table_data
summary(data)

#data.spec<- lsp(data$V2, times = data$V1, from=1140, to=1680, type=c("period"), ofac=100)
#summary(data.spec)

data.spec<- lsp(data$V2, times  = NULL, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)



## Actiwatch compute of IS  [0,1], closest to 1 means good circadian
library("nparACT")
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Data/code_cruze_paper/Re actimetry/data_acti_4days_v2.csv", header=FALSE, sep=",")
table_data<- read.csv(file="/home/aldo/Documents/Projects/iButtons/Actigraphy_data/Jourdan_acti2_R.csv", header=FALSE, sep=",")
table_data<- read.csv(file="/home/aldo/Documents/Projects/iButtons/Actigraphy_data/DE_RA_29082018acti_ISIV.csv", header=FALSE, sep=",")
r<- nparACT_base("table_data", SR = 1/60 )
print(r)


# Read a list of csv files

library(rio)
my_data <- import_list(dir("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/acti_files_csv", pattern = ".csv"))
table_data <- my_data[1]
data <- table_data
summary(data)

data.spec<- lsp(data$V2, times = data$V1, from=1140, to=1680, type=c("period"), ofac=100)
summary(data.spec)

summ <- summary(data.spec)
summ_dataframe <- data.frame(summ)
d<-rbind("?", c(summ_dataframe))

power<-d[2,1]$Value[9] ## Power
period<-d[2,1]$Value[10] ## Periodicity
p_value<-d[2,1]$Value[12] ## p-value

table_results_LombScar <- as.data.frame(matrix(0,5,3)) ## Table where all the results should be publish


#  A different way to read the files

#table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/acti_files_csv/MCS_p_01_mtn_acti.csv", header=FALSE, sep=",")

# Circadian


folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/", "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/")
length(folders_2work)
diagnosis_2work <- c("MCS+", "MCS-", "MCS_ast", "UWS")
length(diagnosis_2work)
folderdays <- c("/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
#folderdays <- c("/acti_files_csv/4days/","/acti_files_csv/5days/", "/acti_files_csv/6days/", "/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv","result_LombScargle_6days.csv", "result_LombScargle_7days.csv")
result_files <- c("/result_LombScargle_7days.csv")

for (foldername in folders_2work){
  for (diagnosis in diagnosis_2work){
    for(result_file in result_files){
      for(folddays in folderdays){
        workfolder_1 <-  paste0(foldername,diagnosis)
        workfolder_2 <- paste0(workfolder_1,folddays)
        resultw_csv <- paste0(workfolder_1,result_file)
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

          data.spec<- lsp(data$V2, times = NULL, from=1140, to=1680, type=c("period"), ofac=100)

          summ <- summary(data.spec)
          summ_dataframe <- data.frame(summ)
          d<-rbind("?", c(summ_dataframe))

          power<-d[2,1]$Value[9] ## Power
          period<-d[2,1]$Value[10] ## Periodicity
          p_value<-d[2,1]$Value[12] ## p-value

          table_Circ_Lomb_1 <- data.frame(file_csv,period, power, p_value)
          table_Circ_Lomb <- rbind(table_Circ_Lomb, table_Circ_Lomb_1)


          print(summary(data.spec))



      }
      cat(sprintf("printing file %s \n",resultw_csv ))

      write.table(table_Circ_Lomb, file = resultw_csv,sep="\t", append = TRUE)


      }
    }
  }
}


# Circadian


list_files <- list.files("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/acti_files_csv/6days", pattern = ".csv")

path_work <- "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/acti_files_csv/6days/"
path_work2 <- "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/"



#paste0(path_work,file_csv)
#filew_csv <- paste0(path_work, file_csv)
#print(filew_csv)

ncols <- length(list_files)
#table_results_LombScar <- as.data.frame(matrix(0.0,ncols,3)) ## Table where all the results should be publish
result_csv <- "result_LombScargle_6days.csv"
resultw_csv <- paste0(path_work2,result_csv)

print(resultw_csv)

i<- 0
#table_Circ_Lomb<- data.frame(Period_ = period, Power_ = power, p_value_ = p_value)
table_Circ_Lomb<- data.frame(ID_ = NULL, filename = NULL, Period_ = NULL, Power_ = NULL , p_value_ = NULL)
for (file_csv in list_files){
  i<-i+1
  filew_csv <- paste0(path_work,file_csv)
  #print(filew_csv)
  print(file_csv)


  table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
  data <- table_data
  summary(data)

  data.spec<- lsp(data$V2, times = NULL, from=1140, to=1680, type=c("period"), ofac=100)

  summ <- summary(data.spec)
  summ_dataframe <- data.frame(summ)
  d<-rbind("?", c(summ_dataframe))

  power<-d[2,1]$Value[9] ## Power
  period<-d[2,1]$Value[10] ## Periodicity
  p_value<-d[2,1]$Value[12] ## p-value

  table_Circ_Lomb_1 <- data.frame(file_csv,period, power, p_value)
  table_Circ_Lomb <- rbind(table_Circ_Lomb, table_Circ_Lomb_1)


  print(summary(data.spec))

  #readline(prompt="Press [enter] to continue")
}
write.table(table_Circ_Lomb, file = resultw_csv,sep="\t", append = TRUE)






# Ultradian
list_files <- list.files("/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/acti_files_csv", pattern = ".csv")
#nfiles_csv <- length(list_files)

path_work <- "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/acti_files_csv/"
#paste0(path_work,file_csv)
#filew_csv <- paste0(path_work, file_csv)
#print(filew_csv)

fprintf()

for (file_csv in list_files){
  filew_csv <- paste0(path_work,file_csv)
  #print(filew_csv)
  print(file_csv)


  table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
  data <- table_data
  summary(data)

  data.spec<- lsp(data$V2, times = NULL, from=20, to=240, type=c("period"), ofac=100)
  print(summary(data.spec))
  readline(prompt="Press [enter] to continue")
}


### Ultradian walking for all the folders :)


folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/", "/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/")
#folders_2work <-c("/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/")
length(folders_2work)
diagnosis_2work <- c("MCS+", "MCS-", "MCS_ast", "UWS")
length(diagnosis_2work)
#folderdays <- c("/acti_files_csv/7days/")
#result_files <- c("result_LombScargle_4days.csv","result_LombScargle_5days.csv")
#folderdays <- c("/acti_files_csv/4days/","/acti_files_csv/5days/", "/acti_files_csv/6days/", "/acti_files_csv/7days/")
result_files <- c("/result_Ultra2LombScargle_4days.csv","/result_Ultra2LombScargle_5days.csv","/result_Ultra2LombScargle_6days.csv", "/result_Ultra2LombScargle_7days.csv")
#result_files <- c("/result_LombScargle_7days.csv")

for (foldername in folders_2work){
  for (diagnosis in diagnosis_2work){
    for(result_file in result_files){
      for(folddays in folderdays){
        workfolder_1 <-  paste0(foldername,diagnosis)
        workfolder_2 <- paste0(workfolder_1,folddays)
        resultw_csv <- paste0(workfolder_1,result_file)
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



        }
        cat(sprintf("printing file %s \n",resultw_csv ))

        write.table(table_Circ_Lomb, file = resultw_csv,sep="\t", append = TRUE)


      }
    }
  }
}





