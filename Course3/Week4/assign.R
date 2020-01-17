# check environment variable

#setwd()

if( !file.exists(".//UCI HAR Dataset"))
{
   Stop("Not data folder!")
}
# Load data

Activity <- read.delim( "./UCI HAR Dataset/Activity_labels.txt", sep=" ", header = FALSE, col.names = c("CODE", "DESC"))


features <- read.delim("./UCI HAR Dataset/features.txt", sep=" ", header = FALSE, col.names = c("CODE", "DESC"))


# load training data



# load testing data

subjectTest <- read.delim("./UCI HAR Dataset/test/subject_test.txt", sep=" ", header = FALSE)
xTest <- read.delim("./UCI HAR Dataset/test/X_test.txt", sep=" ", header = FALSE)
yTest <- read.delim("./UCI HAR Dataset/test/y_test.txt", sep=" ", header = FALSE)

#rm("XTest")
xTest[ colSums( !is.na(xTest))>4300 ]

#clean data


#calculate columns/new column etc


#Merge data

