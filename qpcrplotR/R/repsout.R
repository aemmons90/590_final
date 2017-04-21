#' Remove outliers
#'
#' This function takes a data frame and evaluates each technical replicate by the standard deviation
#' to eliminate outliers. Outliers can be removed based on any inputed number of standard
#' deviations. For example, if x is set to 1, than only values within one standard deviation
#' of the mean will be included in the data set. This gives the user control over outlier removal.
#'
#' @param df a data frame
#' @param x a numeric value
#' @return A data frame including Sample, Mean.Copies, and SD after removing outliers.
#'
#' @examples
#' quant2<-repsout(quant, 2)
#' quant3<-repsout(quant, 1)
#' @export
repsout<- function(df, x){
quant1<- df %>%
    dplyr::filter(Copies, SD!= 0 & Copies < (Mean + x*SD) & Copies > (Mean - x*SD)) %>%
    dplyr::select(Sample, Copies) %>%
    dplyr::group_by(Sample) %>%
    dplyr::summarise(Mean.Copies = mean(Copies, na.rm = TRUE), SD = sd(Copies, na.rm = TRUE))
return(quant1)
}


