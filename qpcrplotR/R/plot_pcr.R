#' Plots qPCR data
#'
#' This function plots a numeric value (e.g. Mean.copies) by sample from a specified data frame.
#' If used after meta_merge(), it also allows you to specify a grouping variable (k) to compare
#' types of samples by color.
#'
#' @param df a data frame
#' @param i a vector (column) of type character or factor belonging to df
#' @param j a vector (column) of type numeric belonging to df
#' @param k a vector (column) of type character or factor belonging to df
#' @return A plot of copies by sample; includes error bars with the standard deviation
#' @example plot_pcr(quant4, "Sample", "Mean.Copies/g", "Body.region")
#' @import ggplot2
#' @export

plot_pcr <- function(df, i, j, k){
  if(missing(k)){graph<-ggplot(df, aes(df[[i]], df[[j]])) +
    geom_point() +
    geom_errorbar(aes(ymin= df[[j]] - SD, ymax= df[[j]] + SD)) +
    ylab(j) + xlab("Sample")
  }
  else{graph<- ggplot(df, aes(df[[i]], df[[j]], color=df[[k]])) +
    geom_point() +
    geom_errorbar(aes(ymin= df[[j]] - SD, ymax= df[[j]] + SD)) +
    ylab(j) + xlab("Sample")
  }
  return(graph)
}


