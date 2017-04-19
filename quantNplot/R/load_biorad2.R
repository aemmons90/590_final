#' load_biorad2
#'
#' Imports data from Bio-Rad Opticon qPCR machines that utilize the Bio-Rad Opticon Monitor 3 software.
#'
#' @param datafile A comma delimited (.csv) file containing data produced by the Bio-Rad Opticon Monitor 3 software.
#' @param row_num The number of rows in the comma delimited file before the header row is reached. This value will vary depending on how many different groups of samples were run on the qPCR machine.
#' @return Invisibly, creates a dataframe for subsequest processing of qPCR data.
#' @examples
#' load_biorad2("my_data.csv")
#' load_biorad2("./data/my_data.csv")
#' @export

# Loads the tidyverse packages which are required for this function to work
library(tidyverse)

# Imports the file as a tibble so that package tools can easily be used on it
load_biorad2 <- function(datafile, row_num) {
  headers <- read.csv(datafile, skip = row_num, header = FALSE, nrows = 1, as.is = TRUE)
  raw_data <- read.csv(datafile, skip = row_num + 1, header = FALSE) %>%
    as_tibble()
  colnames(raw_data) <- headers
  selected_data <- select(raw_data, Sample.name = Col1, Value = Col2) # Testing only, need to fix
  return(selected_data)
}

#Included to test the function
test1 <- load_biorad2("./testingdata/Book1.csv", 3)
test2 <- load_biorad2("./testingdata/Book2.csv", 0)
