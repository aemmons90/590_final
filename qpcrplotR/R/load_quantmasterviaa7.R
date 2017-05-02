#' Import qPCR file from a QuantMaster Viaa7 Instrument and convert to standard format.
#'
#' This function loads a .csv file, converts it to a smaller tibble, and
#' extracts relevant information (Sample Name, Quantity, Quantity Mean, SD)
#' to be exported in a standard format (Sample, Copies, Mean, SD). The input
#' file must be in .csv format and assumes i) the header is on the 33rd line,
#' ii) the column names include Well, Well Position, Sample Name, Target Name,
#' Task, Reporter, Quencher, CT, Ct Mean, Ct SD, Quantity, Quantity Mean,
#' Quantity SD, Automatic Ct Threshold, Ct Threshold, Automatic Baseline,
#' Baseline Start, Baseline End, Custom 1-5, HIGHSD, NOAMP, EXPFAIL.  Also,
#' it is important that replicates have the same sample names.
#'
#'
#' @param file the file path for the .csv file in quotes
#' @return Returns a tibble with four columns (Sample, Copies, Mean, SD)
#'
#' @example
#' load_quantmasterviia7("./data/quantmasterviaa7/Jenny2_qPCR.csv")
#'
#' @export


#Takes the qPCR output (.csv) from a QuantMasterViiA7 qPCR machine.
#Sample data should be labeled UNKNOWN under Task columns, and replicates should have the same identity under `Sample Name`
load_quantmasterviia7 <- function(file){
  #Reads file, skips to the row containing the header, and removes spaces
  Rawfile <- read.csv(file, skip = 32, check.names = TRUE, na.strings = c("","NA"))
  #Converts the dataframe to a tibble and selects important columns
  Newfile <- tibble::as_tibble(select(Rawfile, Sample.Name, Task, Quantity, Quantity.Mean, Quantity.SD)) %>%
    #Extracts the rows containing sample data
    filter(Task == "UNKNOWN") %>%
    filter(!is.na(Quantity.Mean)) %>%
    #Selects the columns of interest in the sample data
    select(Sample.Name, Quantity, Quantity.Mean, Quantity.SD) %>%
    #Groups the replicates together
    group_by(Sample.Name)
  colnames(Newfile) <- c("Sample", "Copies","Mean","SD")
return(Newfile)
}


