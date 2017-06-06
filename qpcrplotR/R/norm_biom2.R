#' Normalize by extraction elution volume and biomass input if different masses per sample
#'
#' This function takes a data frame and normalizes Mean.Copies.ul by the quantity of biomass in
#' the original extract. The function multiplies mean copies by the volume of the final elutant
#' following DNA extraction (x). For example, if an extraction results in a final elution volume of
#' 100 microliters, x would equal 100 and the resulting normalization would represent the mean
#' copies of DNA in the elution volume. df[[z]] can then be used to normalize copy number for a particular
#' unit of mass or volume of the input material for the DNA extraction. This is to be used if
#' each sample has a different mass of initial input. Z is used to define these final units and name the resulting column.
#' This function should only be used after norm_pd or norm_sd and meta_merge().
#'
#' @param df a data frame resulting from either norm_pd(), norm_sd(), or meta_merge()
#' @param x a numeric value, equal to elution volume
#' @param y a new column name; include in quotes
#' @param z a column including mass information
#' @return A data frame including Sample, Mean.Copies per biomass input, and SD after correcting for total elution volume and biomass input.
#'
#' @examples
#' norm_biom(quant4, 100, "Mean.Copies.gdw", "Soil.dw.")
#' @export

#This function takes 4 arguments, the first being the dataframe and the last three as columns
norm_biom2 <- function(df, x, y, z){

  #argument x is the final elution volume
  df[["Mean.Copies.ul"]] <- (df[["Mean.Copies.ul"]]*x)

#the z argument involves a specific column with biomass values. This is useful if every sample has a
#different biomass rather than one standard biomass value.
  df[[y]] <- (df[["Mean.Copies.ul"]]/df[[z]])


  #returns the original data frame.
  return(df)
}
