
#' load
#'
#' @import tidyverse
#function requires the following
library(tidyverse)
library(dplyr)

#' @export
#file input = quantification cq results as a .csv file from a CFX BioRad Instrument
#values of greater than 0.5 ct in difference are removed
load_bioradcfx <- function(file){
  raw_data<- read.csv(file, header=TRUE, check.names = TRUE)
  raw_data<-as_tibble(raw_data)
  quant<-select(raw_data, Sample, Cq, Starting.Quantity=Starting.Quantity..SQ.)
  quant<-filter(quant, !is.na(Cq))
  return(quant)
  }

x <-load_bioradcfx("C:/Users/Alexandra Emmons/Dropbox/590_final/test.csv")






