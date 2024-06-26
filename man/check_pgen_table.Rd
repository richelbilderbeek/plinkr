% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_pgen_table.R
\name{check_pgen_table}
\alias{check_pgen_table}
\title{Check if a \code{.pgen} table is valid.}
\usage{
check_pgen_table(pgen_table)
}
\arguments{
\item{pgen_table}{an \link{array} that maps the individuals
to their SNPs, with as much rows as individuals, and as much
SNPs as columns. Optionally, the row names are the individuals' IDs,
where the column names are the SNP ID's}
}
\value{
a checked \code{pgen_table}, now of class \code{pgen_table}
}
\description{
Check if a \code{.pgen} table is valid.
Will \link{stop} if not
}
\examples{
check_pgen_table(get_test_pgen_table())
}
\author{
Richèl J.C. Bilderbeek
}
