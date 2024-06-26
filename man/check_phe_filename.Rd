% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_phe_filename.R
\name{check_phe_filename}
\alias{check_phe_filename}
\title{Checks that the \code{phe_filename} is valid}
\usage{
check_phe_filename(phe_filename)
}
\arguments{
\item{phe_filename}{name of a phenotype (\code{.phe}) file,
as checked by \link{check_phe_filename}.
Use \link{read_plink_phe_file} to read a raw phenotype file.}
}
\value{
nothing
}
\description{
Checks that the \code{phe_filename} is valid.
Calls \link{stop} if not
}
\examples{
check_phe_filename("a.phe")
check_phe_filename("/folder/a.phe")
check_phe_filename("~/a.phe")
}
\author{
Richèl J.C. Bilderbeek
}
