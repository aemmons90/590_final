% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repsout.R
\name{repsout}
\alias{repsout}
\title{Remove outliers}
\usage{
repsout(df, x = 1)
}
\arguments{
\item{df}{a data frame created from any of the following: load_biorad2(), load_bioradcfx(),load_quantmasterviaa7()}

\item{x}{a numeric value}
}
\value{
A data frame including Sample, Mean.Copies, and SD after removing outliers.
}
\description{
This function takes a data frame and evaluates each technical replicate by the standard deviation
to eliminate outliers. Outliers can be removed based on any inputed number of standard
deviations. For example, if x is set to 1, then only values within one standard deviation
of the mean will be included in the data set. This gives the user control over outlier removal.
}
\examples{
repsout(quant, 2)
repsout(quant, 1)
}
