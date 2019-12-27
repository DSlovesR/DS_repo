#print R version 
print( R.version.string)
#setwd("D:\\DS\\DS-R\\rprog_data_specdata\\specdata\\")

#Source("complete.R")

#set working directory
#setwd("D:\\DS\\DS-R\\rprog_data_specdata\\")


corr <- function( directory,  thresold=0)
{
   ## 'directory' is a character vector of length 1 indicating
   ## the location of .csv files
   
   
   ## 'thresold' is an integer vector of lenght 1 indicating 
   ## the number of complete observation required to compute the 
   ## correlation between 'nitrate' and 'sulfate'
   
   ## Return 
   ## 'directory' is a character vector of length 1 indicating
   ## the location of .csv files
   
   ## 'id' is an integer vector indicating the monitor IDs numbers
   ##  to be used
   mCompleteData  <- complete(directory )
   nObs  <- mCompleteData[ mCompleteData$nobs>thresold, ]
  
  # if ( nrow(nobs) == 0 )
  # {
  #    return (0)
 #  }
   mData <- c()
   
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
      for ( filecounter in nObs$id )
      {
         #TODO for testing only
         #print( filePath[ filecounter])
         
         #read file in dataset variable
         dataset <- read.csv( filePath[filecounter], header=TRUE, sep = ",")
         
         #read specific column of the dataset and remove all NAs
         tmpData <-    dataset[ complete.cases(dataset), ]
         
         mData <- c(mData, cor( tmpData[,2], tmpData[,3] )) 
      }
      return ( mData ) 
   }
 
}




