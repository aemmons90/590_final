#' Normalize by Pipette volume and dilution factor
#'
#' This function takes a data frame and normalizes Mean.Copies by the amount of extract
#' used in each pcr reaction and the dilution factor. This function can only be used following
#' repsout(). Both the pipetted quantity (x) and the dilution factor (y) are user defined and
#' the default is set to 1 (indicating no dilution). The dilution factor argument should not be
#' modified if only a subset of samples were diluted; instead, use the function norm_sd() prior
#' to this function.
#'
#' @param df a data frame
#' @param x a numeric value
#' @param y a numeric value
#' @return A data frame including Sample, Mean.Copies.ul, and SD after correcting for pippet volume and dilutions.
#' @examples
#' norm_pd(quant2, 2, 10)
#' @export
norm_pd <- function(df, x=1, y=1){
  df[["Mean.Copies"]] <- (df[["Mean.Copies"]]/x)*y
  df[["SD"]] <- (df[["SD"]]/x)*y
  colnames(df) <- c("Sample", "Mean.Copies.ul", "SD")
  return(df)
}



