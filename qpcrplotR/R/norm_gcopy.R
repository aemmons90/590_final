#'Normalize 16SrRNA qPCR data by gene copy number to obtain cells/mL
#'
#'This function uses a four-column dataframe containing "Samples", "Copies",
#'"Mean", and "SD" that has already been processed to remove outliers.
#'It normalizes "Mean.Copies" by the organism's gene copy number to provide a 
#'cell concentration (cells/ml). This fuction is applicable for axenic cultures.
#'
#'This method derives from Ritalahti et al. 2006 in AEM, using the equation: 
#'i) Gene Copies per mL = ((gene copies per reaction mix) x (volume of DNA[ul]) / (3 ul DNA per reaction mix) x (ml sample used))
#'ii) Cells per mL = Gene Copies per mL / Gene Copies per Genome
#'
#'@param df The input dataframe
#'@param x Elution volume of the extracted DNA in microliters
#'@param y Template volume of DNA in the PCR reaction in microliters
#'@param z Sample volume subjected to DNA extraction in milliliters
#'@param n Number of 16SrRNA gene copies in the genome
#'
#'@return A dataframe including Sample, Mean.Conc, SD.Conc
#'
#'@examples
#'norm_gcopy(yourfile, 50, 2, 1.8, 2)
#'
#'@export

norm_gcopy <- function(df, x=1, y=1, z=1, n=1){
  #Combine the two equations from Ritalahti to get cells/mL
  df[["Cells.mL"]] <- (((df[["Mean.Copies"]]*x)/(y*z))/n)
  df[["Stdev"]] <- (((df[["SD"]]*x)/(y*z))/n)
  #Remove the old columns
  df[["Mean.Copies"]] <- NULL
  df[["SD"]] <- NULL
  #Arrange the rows by sample name so grouped similarly
  arrange(df, Sample)
return(df)
}
