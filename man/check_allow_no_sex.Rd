% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_allow_no_sex.R
\name{check_allow_no_sex}
\alias{check_allow_no_sex}
\title{Check if the \code{allow_no_sex} is valid.
Check if the \code{allow_no_sex} is valid,
which is when it is either \link{TRUE} or \link{FALSE}.}
\usage{
check_allow_no_sex(allow_no_sex)
}
\arguments{
\item{allow_no_sex}{set this to \link{TRUE}
to retain phenotype values for missing-sex samples.
This parameter is named after the \code{PLINK} \code{--allow-no-sex} flag}
}
\value{
Nothing. Will \link{stop} if the input
is not either \link{TRUE} or \link{FALSE}.
}
\description{
Will \link{stop} if not
}
\examples{
check_allow_no_sex(allow_no_sex = TRUE)
check_allow_no_sex(allow_no_sex = FALSE)
}
\author{
Richèl J.C. Bilderbeek
}
