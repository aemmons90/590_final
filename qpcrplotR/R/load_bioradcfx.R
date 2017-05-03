#' Load a qPCR file from an BioRad CFX 96 well machine
#'
#' This function loads a .csv file as a tibble table. You must first convert your .xlsx file into a .csx file before using. It assumes that the first row of each column
#' contains the column names and that each row corresponds to a well run. It also assumes that the format of the .csv file has the following column names:
#' Well, Fluor, Target, Content, Sample, Biological Set Name,	Cq,	Cq Mean,	Cq Std. Dev,	Starting Quantity (SQ),
#' Log Starting Quantity	SQ, Mean	SQ, Std. Dev,	Set Point,	Well Note. If these are not the header names, the file may not
#' download properly.
#'
#'
#' @param the file Path in quotes
#' @return A tibble table of the input file. This inlcudes columns with the sample designation, starting quantity (copy number), mean, and standard deviation.
#' @example
#' load_bioradcfx("./data/test.csv")
#' @export
load_bioradcfx <- function(file){
  raw_data<- read.csv(file, header=TRUE, check.names = TRUE)
  raw_data<-tibble::as_tibble(raw_data)
  quant<-dplyr::select(raw_data, Sample, Copies=Starting.Quantity..SQ., Mean=SQ.Mean, SD=SQ.Std..Dev)
  quant<-dplyr::filter(quant, !is.na(Copies))
  return(quant)
}



