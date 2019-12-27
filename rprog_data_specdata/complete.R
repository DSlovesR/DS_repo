#print R version 
# print( R.version.string)

#set working directory
#setwd("D:\\DS\\DS-R\\rprog_data_specdata\\")


complete <- function( directory,  id=1:332)
{
   ## 'directory' is a character vector of length 1 indicating
   ## the location of .csv files
   
   ## 'id' is an integer vector indicating the monitor IDs numbers
   ##  to be used
   
   ## Return a data frame of  the form:
   ## id nobs
   ##  1 117
   ##  2 1014
   ## ...
   ## where 'id' is monitor ID and 'nobs' is the 
   ## number of complete cases
   
   mData <- data.frame()
   
   #check wether directory exists in current working folder
   if ( dir.exists(directory))
   {
      #format path according to OS ( windows) 
      fileDir <- paste(".\\",directory,"\\", sep="")
      
      #pull all files from the directory
      files <- list.files( fileDir )
      
      #concatenate path and file name
      filePath <- paste( fileDir, files, sep="")
      
      #read all monitor IDs
      i<- 1
      for ( filecounter in id )
      {
         #TODO for testing only
         #print( filePath[ filecounter])
         
         #read file in dataset variable
         dataset <- read.csv( filePath[filecounter], header=TRUE, sep = ",")
         
         #read specific column of the dataset and remove all NAs
         mData <- rbind( mData, c( filecounter, nrow(dataset[ complete.cases(dataset), ]) )) 
      }
      
      names(mData) <- c("id", "nobs")
   }
   return ( mData )
}

