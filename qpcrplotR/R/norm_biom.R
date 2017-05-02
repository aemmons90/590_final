#' Normalize by extraction elution volume and biomass input
#'
#' This function takes a data frame and normalizes Mean.Copies.ul by the quantity of biomass in
#' the original extract. The function multiplies mean copies by the volume of the final elutant
#' following DNA extraction. For example, if an extraction results in a final elution volume of
#' 100 microliters, x would equal 100 and the resulting normalization would represent the mean
#' copies of DNA in the elution volume. y can then be used to normalize copy number for a particular
#' unit of mass or volume of the input material for the DNA extraction. For example, if DNA was
#' extracted from 0.25g of soil, y would equal 0.25, and the resulting normalization would be
#' mean copies per gram of soil; Z is used to define these final units and name the resulting column.
#' This function should only be used after norm_pd or norm_sd.
#'
#' @param df a data frame
#' @param x a numeric value
#' @param y a numeric value
#' @param z a column name; include in quotes
#' @return A data frame including Sample, Mean.Copies, and SD after correcting for total elution volume and biomass input.
#'
#' @examples
#' norm_biom(quant2, 100, 0.25, "Mean.Copies/g")
#' @export
norm_biom<- function(df, x=1, y=1, z){
  df[[z]] <- ((df[["Mean.Copies.ul"]]*x)/y)
  df[["Mean.Copies.ul"]]<- NULL
  df[["SD"]] <- ((df[["SD"]]*x)/y)
  df2<-df[ ,c(1, 3, 2)]
  return(df2)
}


