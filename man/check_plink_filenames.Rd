% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_plink_filenames.R
\name{check_plink_filenames}
\alias{check_plink_filenames}
\title{Check if a \code{plink_filenames} is valid.}
\usage{
check_plink_filenames(plink_filenames)
}
\arguments{
\item{plink_filenames}{a list of filenames that
is a collection of \code{PLINK} text files, \code{PLINK} binary files
or \code{PLINK2} binary files. For example, for \code{PLINK} text files,
this list has elements \code{map_filename} and \code{ped_filename}}
}
\value{
Nothing. Will \link{stop} if the \code{plink_filenames} is invalid
}
\description{
Check if a \code{plink_filenames} is valid.
Will \link{stop} if not
}
\examples{
check_plink_filenames(create_test_plink_text_filenames())
check_plink_filenames(create_test_plink_bin_filenames())
check_plink_filenames(create_test_plink2_bin_filenames())
}
\author{
Richèl J.C. Bilderbeek
}
