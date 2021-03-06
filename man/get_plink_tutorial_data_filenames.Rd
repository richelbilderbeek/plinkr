% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_plink_tutorial_data_filenames.R
\name{get_plink_tutorial_data_filenames}
\alias{get_plink_tutorial_data_filenames}
\title{Install the \code{PLINK} tutorial data}
\usage{
get_plink_tutorial_data_filenames(plink_folder = get_plink_folder())
}
\arguments{
\item{plink_folder}{folder where \code{PLINK} is installed}
}
\value{
Nothing. Will \link{stop} if the tutorial data is already installed
}
\description{
Install the \code{PLINK} tutorial data.
}
\details{
The data will be downloaded in the \code{plink_folder}
and extracted in the \code{plink_tutorial} subfolder.

The \code{PLINK} tutorial can be found at
\url{http://zzz.bwh.harvard.edu/plink/tutorial.shtml}
and is done in the \code{plink_tutorial} vignette
}
\seealso{
use \link{uninstall_plink_tutorial_data} to uninstall
the \code{PLINK} tutorial data
}
\author{
Richèl J.C. Bilderbeek
}
