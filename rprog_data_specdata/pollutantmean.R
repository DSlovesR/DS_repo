
# #print R version 
# print( R.version.string)

#set working directory
#setwd("D:\\DS\\DS-R\\rprog_data_specdata\\")


pollutantmean <- function( directory, pollutant, id=1:332)
{
   ## 'directory' is a character vector of length 1 indicating
   ## the location of .csv files
   
   ## 'pollutant' is a character vector of length 1 indicating
   ## the name of pollutant for which we will calculate the 
   ## mean; either "sulfate" or "nitrate".
   
   ## 'id' is an integer vector indicating the monitor IDs numbers
   ##  to be used
   
   ## Return the mean of the pollutant acorss all the monitors list
   ## in the 'id' vector (ignoring NA values)
   ## NOTE: Do not round the result!
   
   
   mVector <- c()
   
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
      for ( filecounter in id )
      {
         #TODO for testing only
         #print( filePath[ filecounter])
         
         #read file in dataset variable
         dataset <- read.csv( filePath[filecounter], header=TRUE, sep = ",")
         
         #read specific column of the dataset and remove all NAs
         mVector <-  c( mVector, dataset[ !is.na(dataset[, pollutant]), pollutant]) 
     
      }
      
      #compute mean and return
      return( mean( mVector) )
   }
}


