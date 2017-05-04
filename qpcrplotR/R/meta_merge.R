#' Combine qPCR and metadata
#'
#' This function loads comma delimited file containing metadata associated with qPCR data
#' and combines it with qPCR data by the column Sample. The Sample names and column header
#' "Sample" must be the same in both combined data sets.
#'
#' @param file a specified comma delimited file containing metadata associated with qPCR Sample data
#' @param df a data frame including qPCR data following normalization
#' @return A merged data frame including combined qPCR and metadata
#' @example meta_merge("../data/test_metadata.csv", quant3)
#' @import dplyr
#' @export
meta_merge<- function(file, df){
  df1<-read.csv(file, header=TRUE, check.names = TRUE)
  df2<-dplyr::left_join(df, df1)
  return(df2)
}

