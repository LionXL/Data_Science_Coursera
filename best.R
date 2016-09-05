#########################################################################################################################
## Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
## outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
## in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
## be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular
## outcome should be excluded from the set of hospitals when deciding the rankings.
##
## Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
## be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals "b", "c",
## and "f" are tied for best, then hospital "b" should be returned).
## 
#########################################################################################################################

best <- function(varState, varOutcome) {
  ## Read outcome data
  varCSVTable <- read.csv("R_Programming/outcome-of-care-measures.csv", colClasses = "character")
  
  ## we forced the columns to character to simplify loading step -- ingnores missing data in numeric columns, etc.
  ## so now we will force columns to numeric, but only for those columns we need ("heart attack", "heart failure", or "pneumonia")
  ## these will resolve to 11, 17, and 23.
  varCSVTable[,11] <- suppressWarnings(as.numeric(varCSVTable[,11]))
  varCSVTable[,17] <- suppressWarnings(as.numeric(varCSVTable[,17]))
  varCSVTable[,23] <- suppressWarnings(as.numeric(varCSVTable[,23]))
  
  ## Check that state and outcome are valid
  ## 1. Validate state against data table,
  if (varState %in% varCSVTable$State) {

    ## 2. valid state detected, now check for valid outcome  
    if ((varOutcome %in% c('heart attack','heart failure','pneumonia')) != TRUE) { 
      
      message('Invalid outcome detected')
      stop('stopping...')
    }
    
  ##  inValid state detected, senbd error message and stop    
  } else {
    message('Invalid state detected')
    stop('stopping...')
  }
  

  ## Return hospital name in that state with lowest 30-day death
  ## rate

  
  
  
  return(varCSVTable)
  
}
