# #set working directory
setwd("D:\\DS\\DS-R\\rprog_data_specdata\\")
#print R version 
print( R.version.string)




source("pollutantmean.R")


pollutantmean ( "specdata", "sulfate", 1:10)
## [1] 4.064128

pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706047

pollutantmean("specdata", "nitrate", 23)
## [1] 1.280833


############## Complete case test###################

source( "complete.R")
print ( complete("specdata", 1))
##  id nobs
##1  1  117

print (complete("specdata", c(2, 4, 8, 10, 12)))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

print (complete("specdata", 30:25))
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

print (complete("specdata", 3))
#    id nobs
## 1  3  243


############################################################
#setwd("D:\\DS\\DS-R\\rprog_data_specdata\\")
source("complete.R")
source("corr.R")


cr <- corr("specdata",150)
head(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
summary(cr)
## Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 

cr <- corr("specdata", 400)
head(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
summary(cr)
## Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 

cr <- corr("specdata", 5000)
summary(cr)
## Length  Class   Mode 
## 0   NULL   NULL 
length(cr)
## [1] 0

cr <- corr("specdata")
summary(cr)
## Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
length(cr)
## [1] 323
#############################Quiz###########################

#1
pollutantmean("specdata", "sulfate", 1:10)
#[1] 4.064128

#2
pollutantmean("specdata", "nitrate", 70:72)
#[1] 1.706047

#3
pollutantmean("specdata", "sulfate", 34)
#1.477143

#4
pollutantmean("specdata", "nitrate")
# 1.702932 

#5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
#[1] 228 148 124 165 104 460 232

#6
cc <- complete("specdata", 54)
print(cc$nobs)
# 219

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
#[1] 711 135  74 445 178  73  49   0 687 237

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
#[1]  0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
#[1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
#[1]  0.0000 -0.0190  0.0419  0.1901