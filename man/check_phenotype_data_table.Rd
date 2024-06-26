% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_phenotype_data_table.R
\name{check_phenotype_data_table}
\alias{check_phenotype_data_table}
\title{Check if the \code{phenotype_data_table} is valid.}
\usage{
check_phenotype_data_table(phenotype_data_table)
}
\arguments{
\item{phenotype_data_table}{phenotype data
(as checked by \link{check_phenotype_data}))
in the form of a \link{list} with an in-memory phenotype table}
}
\value{
nothing
}
\description{
Check if the \code{phenotype_data_table} is valid.
Will \link{stop} if not.
}
\author{
Richèl J.C. Bilderbeek
}
