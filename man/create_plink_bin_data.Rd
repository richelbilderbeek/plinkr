% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_plink_bin_data.R
\name{create_plink_bin_data}
\alias{create_plink_bin_data}
\title{Create a set of \code{PLINK} binary data}
\usage{
create_plink_bin_data(bim_table, fam_table, bed_table)
}
\arguments{
\item{bim_table}{a tibble of the genetic mapping,
with as many rows as SNPs.

Each row contains:
\itemize{
\item \code{chr}: the chromosome number
\item \code{id}: the SNP ID
\item \code{posg}: the position
\item \code{pos}: the position
\item \code{ref}: something
\item \code{alt}: something
}

Use \link{get_test_bim_table} to get a \code{.bim} table as used in testing.
Use \link{read_plink_bim_file} to read a \code{PLINK} \code{.bim} file.
Use \link{check_bim_table} to test if a \code{.bim} table is valid.}

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

\item{bed_table}{a table that maps the SNPs to the individuals,
of which the column names are the names of the individuals,
the row names are the names of the SNPs,
and the values are the SNP variant.
Use \link{get_test_bed_table} to get a \code{.bed} table as used in testing.
Use \link{read_plink_bed_file} to read a \code{PLINK} \code{.bed} file.
Use \link{check_bed_table} to test if a \code{.bed} table is valid.
See also the \code{bed} file format reference at
\url{https://www.cog-genomics.org/plink2/formats#bed}}
}
\description{
Create a set of \code{PLINK} binary data
}
\examples{
create_plink_bin_data(
  bim_table = get_test_bim_table(),
  fam_table = get_test_fam_table(),
  bed_table = get_test_bed_table()
)
}
\seealso{
use \link{create_test_plink_bin_data} to create a set
of \code{PLINK} binary data to be used in testing
}
\author{
Richèl J.C. Bilderbeek
}
