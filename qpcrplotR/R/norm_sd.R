#' Normalize a subset of samples by the dilution factor
#'
#' This function takes a data frame and normalizes a subset of Mean.Copies by the dilution factor.
#' The dilution factor (y) is user defined and the default is set to 1 (indicating no dilution).
#' A vector including Samples that were diluted needs to be created prior to using this function.
#'
#' @param df a data frame
#' @param x a numeric value
#' @param y a numeric value
#' @return A data frame including Sample, Mean.Copies, and SD after correcting for dilutions.
#'
#' @examples
#' x<-c('1101-0001|1101-0002|1101-0003')
#' norm_sd(quant1, x, 10)
#' @export
norm_sd<-function(df, row.names=x, y){
  quant<-dplyr::filter(df, grepl(x, Sample))
  quant[["Mean.Copies"]] <- (quant[["Mean.Copies"]]*y)
  quant[["SD"]] <- (quant[["SD"]]*y)
  df[["Mean.Copies"]][match(quant[["Sample"]],df[["Sample"]])] <- quant[["Mean.Copies"]]
  df[["SD"]][match(quant[["Sample"]],df[["Sample"]])] <- quant[["SD"]]
  return(df)
}


