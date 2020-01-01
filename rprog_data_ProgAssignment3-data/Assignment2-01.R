setwd("D:\\DS\\DS-R\\rprog_data_ProgAssignment3-data\\")
      

hospital <- read.csv("hospital-data.csv", header=T, sep=',')

 outcomes <- read.csv("outcome-of-care-measures.csv", header=T,sep = ',')
 
# 
# head(outcomes)
# 

 str(outcomes)
# 
# summary(outcomes)
# 
# #find complete dateset
# 
# complete <- as.numeric(outcomes[ ,11])
# 
# hist( complete)


best <- function(state, outcome) {
   ## Read outcome data
   hospital <- NULL
   state <- "TX"
   outcome <-"Heart Attack"
   
   ## Check that state and outcome are valid
   
   if( is.null( state) && length(state) ==2)
   {
      Stop( paste("Error in best(",state, ",",outcome,") : invalid state!", sep=" " ) )
   }
   
   if( is.null( outcome))
   {
      Stop( paste("Error in best(",state, ",",outcome,") : invalid outcome!", sep=" " ) )
   }
   
   outcomes <- read.csv("outcome-of-care-measures.csv", header=T,sep = ',')
   
   ## Return hospital name in that state with lowest 30-day death
   #Hospital.30.Day.Death..Mortality..Rates.from.
   # Heart.Attack
   # Heart.Failure
   # Pneumonia
   
   if( tolower(outcome) =="heart attack")
   {
      outcome ="Hospital 30-Day Death (Mortality) Rates from Heart Attack"
   }else if( tolower(outcome) =="heart failure")
   {
      outcome ="Hospital 30-Day Death (Mortality) Rates from Heart Failure"
   } else 
   {
      outcome ="Hospital 30-Day Death (Mortality) Rates from Pneumonia"
   }
   
   outcome <- gsub("[[:punct:]]", ".", outcome)

   outcome <- gsub(" ", ".", outcome)
   
   outcomes[,outcome] <- sapply(outcomes[,outcome], as.numeric)
   
   x<- tapply(outcomes[,outcome], outcomes[ ,"State"], min)
 
  y<-  outcomes[ outcomes$State==state & outcomes[outcome] == as.numeric(x[state][[1]]) , c(2)]
   ## rate
}





rankhospital <- function(state, outcome, num = "best") {
   ## Read outcome data
   ## Check that state and outcome are valid
   ## Return hospital name in that state with the given rank
   ## 30-day death rate
}



rankall <- function(outcome, num = "best") {
   ## Read outcome data
   ## Check that state and outcome are valid
   ## For each state, find the hospital of the given rank
   ## Return a data frame with the hospital names and the
   ## (abbreviated) state name
}
