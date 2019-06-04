library("nparACT")
table_data<- read.csv(file="/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/acti_files_csv/MCS_p_01_mtn_acti.csv", header=FALSE, sep=",")
r<- nparACT_base("table_data", SR = 1/60 )
print(r)

#path_work <- "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/acti_files_csv/"

path_work <- "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/acti_files_csv/6days/"
path_results <- "/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/result_ISIVRA_6d.csv"

list_files <- list.files(path_work, pattern = ".csv")

table_Circ_IS_IV<- data.frame(ID_ = NULL, filename = NULL, IS = NULL, IV = NULL , RA = NULL)
for (file_csv in list_files){
  filew_csv <- paste0(path_work,file_csv)
  #print(filew_csv)
  print(file_csv)


  table_data<- read.csv(file=filew_csv, header=FALSE, sep=",")
  data <- table_data
  summary(data)

  r<- nparACT_base("table_data", SR = 1/60 )
  print(r)
  #print(r$IS)
  #print(r$IV)
  #print(r$RA)

  #readline(prompt="Press [enter] to continue")

  table_Circ_IS_IV_1 <- data.frame(file_csv,r$IS, r$IV, r$RA)
  table_Circ_IS_IV <- rbind(table_Circ_IS_IV, table_Circ_IS_IV_1)


}

cat(sprintf("printing file %s \n",path_results ))

write.table(table_Circ_IS_IV, file = path_results,sep=",", append = TRUE)


