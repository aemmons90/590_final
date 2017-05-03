#' Normalize a subset of samples by the dilution factor and the entire set by pipette volume
#'
#' This function takes a data frame and normalizes a subset of Mean.Copies by the dilution factor.
#' This function must be used after repsout.
#' The dilution factor (y) is user defined and the default is set to 1 (indicating no dilution).
#' A vector including Samples that were diluted needs to be created prior to using this function.
#' This function also normalizes based on the pipette volume (z) per PCR reaction. Therefore, there is no need to use
#' norm_pd following this function.
#'
#' @param df a data frame resulting from repsout()
#' @param x a numeric value
#' @param y a numeric value
#' @param z a numeric value
#' @return A data frame including Sample, Mean.Copies, and SD after correcting for dilutions.
#' @import dplyr
#' @examples
#' x<-c('1101-0001|1101-0002|1101-0003')
#' norm_sd(quant1, x, 10)
#' @export
norm_sd<-function(df, row.names=x, y=1, z=1){
  quant<-dplyr::filter(df, grepl(x, Sample))
  quant[["Mean.Copies"]] <- (quant[["Mean.Copies"]]*y)
  quant[["SD"]] <- (quant[["SD"]]*y)
  df[["Mean.Copies"]][match(quant[["Sample"]],df[["Sample"]])] <- quant[["Mean.Copies"]]
  df[["SD"]][match(quant[["Sample"]],df[["Sample"]])] <- quant[["SD"]]
  df[["Mean.Copies"]] <- (df[["Mean.Copies"]]/z)
  df[["SD"]] <- (df[["SD"]]/z)
  colnames(df) <- c("Sample", "Mean.Copies.ul", "SD")
  return(df)
}


