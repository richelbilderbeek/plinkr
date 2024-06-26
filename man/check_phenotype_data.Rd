% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_phenotype_data.R
\name{check_phenotype_data}
\alias{check_phenotype_data}
\title{Check if the \code{phenotype_data} is valid}
\usage{
check_phenotype_data(phenotype_data)
}
\arguments{
\item{phenotype_data}{phenotype data in the form of either
a filename to a phenotype file (\code{phenotype_data_filename})
or a list with a phenotype table (\code{phenotype_data_table})}
}
\description{
Check if the \code{phenotype_data} is valid.
The \code{phenotype_data} can be a filename (\code{phe_filename})
or a \link[tibble]{tibble} (\code{phe_table})
}
\details{
Will \link{stop} if the data is not in any of these formats
}
\examples{
check_phenotype_data(phenotype_data = create_test_phenotype_data_table())
check_phenotype_data(phenotype_data = create_test_phenotype_data_filename())
}
\author{
Richèl J.C. Bilderbeek
}
