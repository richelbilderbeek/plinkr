% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_assoc_data.R
\name{check_assoc_data}
\alias{check_assoc_data}
\title{Check if the \code{assoc_data} are valid}
\usage{
check_assoc_data(assoc_data)
}
\arguments{
\item{assoc_data}{data to use for an association analysis
for a quantitative trait (i.e. using \link{assoc}),
as can be created by \link{create_assoc_data}}
}
\value{
Nothing.
}
\description{
Check if the \code{assoc_data} are valid, will \link{stop} otherwise
}
\note{
This function is named after the \code{--assoc} PLINK flag.
}
\examples{
check_assoc_data(create_test_assoc_data())
}
\author{
Richèl J.C. Bilderbeek
}
