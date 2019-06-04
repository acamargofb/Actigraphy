stats_pks <- function(file_csv){
  
  #pk1
  Model_pks1 <- lm(file_csv$pk1 ~ file_csv$Group*file_csv$Manu)
  summary(Model_pks1)
  anova_result <- Anova(Model_pks1, type="II")
  return(anova_result) 
}

