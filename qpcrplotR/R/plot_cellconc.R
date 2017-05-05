#' Plots cell concentration from qPCR data.  This should only be used after meta_merg() that has
#' added a column for Organism and Time, resulting in five total columns.
#'
#' This function plots a numeric value (cells/mL) by sample from a specified data frame.
#'
#' @param df a dataframe with five columns
#' @param a title for the graph in quotes
#' @param b title for x axis in quotes, default is Time(hrs) if not defined
#' @return A plot of cell concentration versus time, faceted by organism
#' 
#' @example plot_cellconc(ProcessedData, "Graph.Title", "Time(days)")
#' 
#' @export

plot_cellconc<- function(df, a, b){
  if(missing(b)){graph<-ggplot(df, aes(x=Time, y=Cells.mL, color = Organism)) +
    geom_point() +
    geom_line(aes(color = Organism), size =1) +
    facet_wrap(~Organism, scales = "free") +
    theme(legend.position="none") +
    labs(title=a, x="Time(hrs)", y= "Cells/mL") +
    geom_errorbar(aes(ymin= Cells.mL - Stdev, ymax= Cells.mL + Stdev))}
  
  else{graph<-ggplot(df, aes(x=Time, y=Cells.mL, color = Organism)) +
    geom_point() +
    geom_line(aes(color = Organism), size =1) +
    facet_wrap(~Organism, scales = "free") +
    theme(legend.position="none") +
    labs(title=a, x=b, y="Cells/mL") +
    geom_errorbar(aes(ymin= Cells.mL - Stdev, ymax= Cells.mL + Stdev))}
  
  return(graph)
}


#Original code not in function format
#ggplot(SamProcessedData, aes(x=Time, y=Cells.mL, color = Organism)) +
  #geom_point() +
  #geom_line(aes(color = Organism), size =1) +
  #facet_wrap(~Organism, scales="free") +
  #theme(legend.position="none") +
  #labs(title = "Bacterial Candidates for Uranium Bioremediation", x = "Time (hrs)", y = "Cells/mL") +
  #geom_errorbar(aes(ymin= Cells.mL - Stdev, ymax= Cells.mL + Stdev))



