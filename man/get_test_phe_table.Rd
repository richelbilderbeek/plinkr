% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_test_phe_table.R
\name{get_test_phe_table}
\alias{get_test_phe_table}
\title{Create a phenotype table (\code{phe_table}) to be used in testing}
\usage{
get_test_phe_table(
  phe_filename = plinkr::create_test_phenotype_data_filename()$phe_filename
)
}
\arguments{
\item{phe_filename}{name of a phenotype (\code{.phe}) file,
as checked by \link{check_phe_filename}.
Use \link{read_plink_phe_file} to read a raw phenotype file.}
}
\value{
a phenotype table
}
\description{
Create a phenotype table (\code{phe_table}) to be used in testing
}
\examples{
check_phe_table(get_test_phe_table())
}
\author{
Richèl J.C. Bilderbeek
}
