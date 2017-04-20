#' load_quantmasterviia7
#' 
#' @param file The qPCR output (.csv) from a QuantMasterViiA7 Instrument
#' @return Returns a dataframe containing only relevant information
#' 
#' @import tidyverse

#Initialize required libraries
library(tidyverse)
library(dplyr)

#' @export
#Takes the qPCR output (.csv) from a QuantMasterViiA7 qPCR machine.
#Replicate data should have the same identity under `Sample Name` and labeled UNKNOWN under
load_quantmasterviia7 <- function(file){
  #Reads file, skips to the row containing the header (Well, Well Position, ....)
  Rawfile <- read.csv(file, skip = 32, check.names = FALSE)
  #Converts the dataframe to a tibble and selects important columns
  Newfile <- as_tibble(select(Rawfile, `Sample Name`, Task, Quantity)) %>%
    #Removes rows containing standards, blanks, etc. leaving only the UNKNOWN samples
    filter(Task == "UNKNOWN") %>%
    select(`Sample Name`, Quantity)
  return(Newfile)
}

#Test the function with a file
a <- load_quantmasterviia7("Courses/GEOL_590/data/Jenny2_qPCR.csv")
