% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_fids.R
\name{check_fids}
\alias{check_fids}
\title{Check if one or more family IDs are valid}
\usage{
check_fids(fids)
}
\arguments{
\item{fids}{one or more family IDs (which are called \code{FID}s in \code{PLINK}).
Use \link{check_fids} to check if the elements of \code{fids} are valid.}
}
\value{
nothing
}
\description{
Check if one or more family IDs are valid
Will \link{stop} if not.
}
\examples{
check_fids("1")
check_fids("Doe")
}
\author{
Richèl J.C. Bilderbeek
}
