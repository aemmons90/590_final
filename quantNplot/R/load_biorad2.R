#' load_biorad2
#'
#' Imports data from Bio-Rad Opticon qPCR machines that utilize the Bio-Rad Opticon Monitor 3 software. This function only accepts raw data from the program, without any calculations on user-input well sets.
#'
#' @param datafile A comma delimited (.csv) file containing data produced by the Bio-Rad Opticon Monitor 3 software.
#' @return Invisibly, creates a dataframe for subsequest processing of qPCR data.
#' @examples
#' load_biorad2("my_data.csv")
#' load_biorad2("./data/my_data.csv")
#' @export

# Loads the tidyverse packages which are required for this function to work
library(tidyverse)

# Imports the file as a tibble so that package tools can easily be used on it
load_biorad2 <- function(datafile) {
  headers <- read.csv(datafile, header = FALSE, nrows = 1, as.is = TRUE)
  raw_data <- read.csv(datafile, skip = 3, header = FALSE) %>%
    as_tibble()
  colnames(raw_data) <- headers
  selected_data <- filter(raw_data, Content == "Sample") %>%
    select(Sample = Description, Copies = copies)
  return(selected_data)
}

#Included to test the function
test <- load_biorad2("./testingdata/BioRad2_sample_qPCR_data.csv")
