#' Load a qPCR file from a QuantMasterViiA7 machine
#'
#' Imports raw qPCR data from a QuantMaster Viaa7 Instrument, converts it to a smaller tibble containing Sample Name and Quantity
#'
#' @param file The qPCR output (.csv) from a QuantMasterViiA7 Instrument
#' @return Returns a tibble for next step, normalization
#'
#' @examples
#' load_quantmasterviia7("jenny2_qPCR.csv")
#'
#' @import tidyverse



#' @export
#Takes the qPCR output (.csv) from a QuantMasterViiA7 qPCR machine.
#Sample data should be labeled UNKNOWN under Task columns, and replicates should have the same identity under `Sample Name`
load_quantmasterviia7 <- function(file){
  #Reads file, skips to the row containing the header (Well, Well Position, ....)
  Rawfile <- read.csv(file, skip = 32, check.names = FALSE)
  #Converts the dataframe to a tibble and selects important columns
  Newfile <- tibble::as_tibble(select(Rawfile, `Sample Name`, Task, Quantity)) %>%
    #Removes rows containing standards, blanks, etc. leaving only the UNKNOWN samples
    dplyr::filter(Task == "UNKNOWN") %>%
    dplyr::select(`Sample Name`, Quantity)
  return(Newfile)
}


