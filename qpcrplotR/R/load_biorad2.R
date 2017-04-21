#' load_biorad2
#'
#' Imports data from Bio-Rad Opticon qPCR machines that utilize the Bio-Rad Opticon Monitor 3 software. This function only accepts raw data from the program, without any calculations on user-input well sets.
#'
#' @param datafile A comma delimited (.csv) file containing data produced by the Bio-Rad Opticon Monitor 3 software.
#' @return Invisibly, creates a dataframe for subsequest processing of qPCR data.
#' @examples
#' load_biorad2("my_data.csv")
#' load_biorad2("./data/my_data.csv")
#' @import tidyverse
#' @import tibble
#' @export

# Imports the file as a tibble and calculates means so that package tools can easily be used on it
load_biorad2 <- function(datafile) {

  #Imports data from the .csv file
  headers <- read.csv(datafile, header = FALSE, nrows = 1, as.is = TRUE)
  raw_data <- read.csv(datafile, skip = 3, header = FALSE) %>%
    as_tibble()
  colnames(raw_data) <- headers

  #Selects important data from the imported .csv file and calculates basic statistics by sample
  selected_data <- filter(raw_data, Content == "Sample") %>%
    select(Sample = Description, Copies = copies) %>%
    group_by(Sample) %>%
    mutate(Mean = mean(Copies)) %>%
    mutate(SD = sd(Copies)) %>%
    ungroup() %>%
    arrange(Sample)

  return(selected_data)
}
