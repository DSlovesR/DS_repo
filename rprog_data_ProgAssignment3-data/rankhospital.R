setwd("D:\\DS\\DS-R\\rprog_data_ProgAssignment3-data\\")
source("utils.R")

rankhospital <- function(state, outcome, num = "best") {
  
#outcome <-"heart attack"
#state="NC"
#num<-5
   ## Return hospital name in that state with lowest 30-day death   
   ## rate
   
   #Hospital.30.Day.Death..Mortality..Rates.from.
   # Heart.Attack
   # Heart.Failure
   # Pneumonia
   #predefined outcome for mapping with input arguments
   outcome.in <-  c( "heart attack", "heart failure", "pneumonia")
   
   ## Read outcome data
   #Prepare data
   outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

   ## Check that state and outcome are valid
   if( !length(which( outcomes$State == state)) )
   {
      stop( "invalid state!")
   }
   
   if( !length( which( outcome.in == tolower(outcome)  )) )
   {
      stop("invalid outcome!")
   }
   
   #concatenate & prepare outcome column as per dataset
   outcome <- paste( "Hospital 30-Day Death (Mortality) Rates from", CamelCase(outcome), sep=" ")
   
   #prepare column name as per R dataset column naming format
   # column ="Column Name" to R equivalent ==> "Column.Name" 
   
   ##outcome <- gsub("[[:punct:]]", ".", outcome)
   ##outcome <- gsub(" ", ".", outcome)
   outcome <- sapply( outcome, function(x) { gsub(" ", ".", gsub("[[:punct:]]", ".",x) )})
   
   colIndex <- which( colnames(outcomes) == outcome)
   #Clean data - filter out dataset for state and removed unwanted data
   outcomes <- outcomes[outcomes$State == state & outcomes[outcome] != "Not Available",  c(2,7,colIndex)]
   
   if( is.character(num))
   {
      if( num =="best"){ rankPos = 1
      }else {
         rankPos = nrow(outcomes) }
   }else{
      rankPos = num
   }

   #convert data type for calculation
   outcomes[,outcome] <-  as.numeric(outcomes[ ,outcome])
    
  # xx <- as.numeric( sort(outcomes[,outcome], decreasing = FALSE) )
   
   outcomeResult <- outcomes[ order(outcomes[outcome], outcomes$Hospital.Name), ]
   outcomeResult$Rank <- order( outcomeResult[outcome])

   if( rankPos > nrow( outcomes ))
   {
      print( NA_character_ )
   }else
   {
   print( outcomeResult[ which( outcomeResult$Rank == rankPos), 1] )
   }
}
