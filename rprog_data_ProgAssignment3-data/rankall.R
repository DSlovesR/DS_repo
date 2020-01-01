source("utils.R")


rankall <- function(outcome, num = "best") {
   
   #Hospital.30.Day.Death..Mortality..Rates.from.
   # Heart.Attack
   # Heart.Failure
   # Pneumonia
   #predefined outcome for mapping with input arguments
   outcome.in <-  c("heart attack", "heart failure", "pneumonia")
   
   ## Read outcome data
   
   #Prepare data
   outcomes <-
      read.csv("outcome-of-care-measures.csv",  colClasses = "character")
   
   ## Check that state and outcome are valid
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
   # column ="Column Name" to R equivalent ==> "Column.Name"
   #outcome <- gsub("[[:punct:]]", ".", outcome)
   #outcome <- gsub(" ", ".", outcome)
   
   outcome <-
      sapply(outcome, function(x) {
         gsub(" ", ".", gsub("[[:punct:]]", ".", x))
      })
   
   colIndex <- which(colnames(outcomes) == outcome)
   #Clean data - filter out dataset for state and removed unwanted data
   outcomes <-
      outcomes[ outcomes[outcome] != "Not Available",  c(2, 7, colIndex) ]
   
   
   if (is.character(num) && num == "best") {
      rankPos = 1
   } else{
      rankPos = num
   }
   
   #convert data type for calculation
   outcomes[, outcome] <-  as.numeric(outcomes[, outcome])
   
   outcomeList <- split(outcomes, outcomes$State)
   result <- data.frame()
   
   ## For each state, find the hospital of the given rank
   for (i in 1:length(outcomeList))
   {
      outcomeResult <-
         outcomeList[[i]][order(outcomeList[[i]][outcome], outcomeList[[i]]$Hospital.Name), ]
      
      outcomeResult$Rank <- order(outcomeResult[outcome])
      
      if (is.character(num) && num == "worst")
      {
         #set last row count
         rankPos = nrow(outcomeResult)
      }

      if (rankPos <= nrow(outcomeResult))
      {
         result <- rbind(result ,
                         data.frame(outcomeResult[which(outcomeResult$Rank == rankPos) , c(1, 2)]))
      }
      else
      {
         result <- rbind(result , 
                         data.frame("Hospital.Name"= NA_character_,"State"=outcomeResult[1, 2]))
      }
   }
   
   ## Return a data frame with the hospital names and the
   ## (abbreviated) state name
   names( result) <- c("hospital","state")
   result
}


