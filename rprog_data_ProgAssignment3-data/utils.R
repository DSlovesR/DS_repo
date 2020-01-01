##utility 
## this file will contain helper/utility function

##CamelCase() will convert input string to CamelCase
## this function required convert outcome name to Camelcase 
## format to match column name as per dataset

CamelCase <- function(x) {   
   tmp <- strsplit(x, " ")[[1]]   
   #convert first character only to upper
   paste(toupper(substring(tmp, 1,1)), substring(tmp, 2),           
         sep="", collapse=" ") 
}