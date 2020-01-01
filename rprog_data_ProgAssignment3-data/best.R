setwd("D:\\DS\\DS-R\\rprog_data_ProgAssignment3-data\\")


#hospital <- read.csv("hospital-data.csv", header=T, sep=',')

#outcomes <- read.csv("outcome-of-care-measures.csv", header=T,sep = ',')

#check headers
#
# head(outcomes)
#

#check structure
# str(outcomes)
#
#check data summary
# summary(outcomes)
#
source("utils.R")



best <- function(state, outcome) {

   #Hospital.30.Day.Death..Mortality..Rates.from.
   # Heart.Attack
   # Heart.Failure
   # Pneumonia
   
   outcome.in <-  c("heart attack", "heart failure", "pneumonia")
   
   ## Read outcome data
   outcomes <-
      read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
   ## Check that state and outcome are valid
   if (!length(which(outcomes$State == state)))
   {
      stop("invalid state!")
   }
   if (!length(which(outcome.in == tolower(outcome))))
   {
      stop("invalid outcome!")
   }
   
   #concatenate & prepare outcome column as per dataset
   outcome <-
      paste("Hospital 30-Day Death (Mortality) Rates from",
            CamelCase(outcome),
            sep = " ")
   
   #prepare column name as per R dataset column naming format
   outcome <-
      sapply(outcome, function(x) {
         gsub(" ", ".", gsub("[[:punct:]]", ".", x))
      })
   
   #filter out dataset for state and removed unwanted data
   colIndex <- which(colnames(outcomes) == outcome)
   
   outcomes <-
      outcomes[outcomes$State == state &
                  outcomes[outcome] != "Not Available",  c(2, 7, colIndex)]
  
   #convert data type for calculation
   outcomes[, outcome] <-  as.numeric(outcomes[, outcome])
   
   ## Return hospital name in that state with lowest 30-day death
   ## rate
 
   print(outcomes[which(outcomes[outcome]  == min(outcomes[outcome])), 1])
}
