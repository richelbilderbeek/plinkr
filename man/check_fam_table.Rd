% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_fam_table.R
\name{check_fam_table}
\alias{check_fam_table}
\title{Check if a \code{.fam} table is valid.}
\usage{
check_fam_table(fam_table)
}
\arguments{
\item{fam_table}{a tibble of the genetic mapping,
with as many rows as SNPs.

Each row contains:
\itemize{
\item \code{fam}: the family ID
\item \code{id}: the individual's ID
\item \code{pat}: ID of father
\item \code{mat}: ID of mother
\item \code{sex}: the gender
\item \code{pheno}: a phenotype
}

Use \link{get_test_fam_table} to get a \code{.fam} table as used in testing.
Use \link{read_plink_fam_file} to read a \code{PLINK} \code{.fam} file.
Use \link{check_fam_table} to test if a \code{.fam} table is valid.}
}
\value{
Nothing. Will \link{stop} if the \code{fam_table} is invalid
}
\description{
Check if a \code{.fam} table is valid.
Will \link{stop} if not
}
\examples{
check_fam_table(get_test_fam_table())
check_fam_table(read_plink_fam_file(get_plinkr_filename("toy_data.fam")))
}
\author{
Richèl J.C. Bilderbeek
}
