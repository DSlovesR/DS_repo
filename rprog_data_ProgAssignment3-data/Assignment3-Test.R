setwd("D:\\DS\\DS-R\\rprog_data_ProgAssignment3-data\\")

source("best.R")
 best("TX","heart attack" )
 best("TX","heart failure" )
 best("MD","heart attack" )
 best("MD","pneumonia" )
 best("BB","pneumonia" )
 best("NY", "hert attack")

 
 
 source( "rankhospital.R")
 
 rankhospital("TX", "heart failure", 4)
 rankhospital("MD", "heart attack", "worst")
 rankhospital("MN", "heart attack", 5000)
 rankhospital("NY", "heart attack", 7)
 
 
 
 
 
 source("rankall.R")
 head(rankall("heart attack", 20), 10)
 tail(rankall("pneumonia", "worst"), 3)
 tail(rankall("heart failure"), 10)
 
 r <- rankall("heart attack", 4)
 as.character(subset(r, state == "HI")$hospital)
 
 r <- rankall("pneumonia", "worst")
 as.character(subset(r, state == "NJ")$hospital)
  
 r <- rankall("heart failure", 10)
 as.character(subset(r, state == "NV")$hospital)
  
 