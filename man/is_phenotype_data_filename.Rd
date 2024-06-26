% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_phenotype_data_filename.R
\name{is_phenotype_data_filename}
\alias{is_phenotype_data_filename}
\title{Determine if the \code{phenotype_data_filename} is
indeed phenotypic data in the form of a filename}
\usage{
is_phenotype_data_filename(phenotype_data_filename, verbose = FALSE)
}
\arguments{
\item{phenotype_data_filename}{phenotype data
(as checked by \link{check_phenotype_data}))
in the form of a \link{list} with a filename to a phenotype table}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
\link{TRUE} if the \code{phenotype_data_filename} is
indeed phenotypic data in the form of a filename
}
\description{
Determine if the \code{phenotype_data_filename} is
indeed phenotypic data in the form of a filename
}
\author{
Richèl J.C. Bilderbeek
}
