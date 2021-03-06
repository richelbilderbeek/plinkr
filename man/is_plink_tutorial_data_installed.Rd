% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_plink_tutorial_data_installed.R
\name{is_plink_tutorial_data_installed}
\alias{is_plink_tutorial_data_installed}
\title{Determine if the \code{PLINK} tutorial data is installed.}
\usage{
is_plink_tutorial_data_installed(plink_folder = get_plink_folder())
}
\arguments{
\item{plink_folder}{folder where \code{PLINK} is installed}
}
\value{
\code{TRUE} if the \code{PLINK} tutorial data
is installed, \code{FALSE} otherwise
}
\description{
Determine if the \code{PLINK} tutorial data is installed.
The \code{PLINK} tutorial can be found at
\url{http://zzz.bwh.harvard.edu/plink/tutorial.shtml}
and is done in the \code{plink_tutorial} vignette
}
\examples{
is_plink_tutorial_data_installed()
is_plink_tutorial_data_installed(plink_folder = "absent_folder")
}
\author{
Richèl J.C. Bilderbeek
}
