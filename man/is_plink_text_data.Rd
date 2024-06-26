% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_plink_text_data.R
\name{is_plink_text_data}
\alias{is_plink_text_data}
\title{Determine if the \code{plink_text_data} is indeed \code{PLINK} text data}
\usage{
is_plink_text_data(plink_text_data)
}
\arguments{
\item{plink_text_data}{the genetic and phenotypic data for \code{PLINK} to work
on, in \code{PLINK} text format, as created by \link{create_plink_text_data}.}
}
\value{
\link{TRUE} if the \code{plink_text_data} is indeed \code{PLINK} text data
}
\description{
Determine if the \code{plink_text_data} is indeed \code{PLINK} text data
}
\examples{
plink_text_data <- create_plink_text_data(
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table()
)
is_plink_text_data(plink_text_data)
}
\seealso{
\code{plinkr} has multiple functions to test if a type of data is valid:
\itemize{
\item \code{PLINK} text data: use \link{is_plink_text_data}
\item \code{PLINK} binary data: use \link{is_plink_bin_data}
\item \code{PLINK2} binary data: use \link{is_plink2_bin_data}
\item any type of \code{PLINK}/\code{PLINK2} data: use \link{is_data}
\item associative trait analysis data: use \link{is_assoc_qt_data}
}
}
\author{
Richèl J.C. Bilderbeek
}
