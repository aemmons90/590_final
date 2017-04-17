
#function requires the following
library(tidyverse)
library(dplyr)

#' @export
#file input = quantification cq results as a .csv file from a CFX BioRad Instrument
load_bioradcfx <- function(file){
  raw_data<- read.csv(file, header=TRUE, check.names = TRUE)
  raw_data<-as_tibble(raw_data)
  quant<-select(raw_data, Sample, Starting.Quantity=Starting.Quantity..SQ., SQ.Mean, SD=SQ.Std..Dev)
 return(quant)
}








}
