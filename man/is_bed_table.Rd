% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_bed_table.R
\name{is_bed_table}
\alias{is_bed_table}
\title{Determine if a \code{.bed} table is valid.}
\usage{
is_bed_table(bed_table, verbose = FALSE)
}
\arguments{
\item{bed_table}{a table that maps the SNPs to the individuals,
of which the column names are the names of the individuals,
the row names are the names of the SNPs,
and the values are the SNP variant.
Use \link{get_test_bed_table} to get a \code{.bed} table as used in testing.
Use \link{read_plink_bed_file} to read a \code{PLINK} \code{.bed} file.
Use \link{check_bed_table} to test if a \code{.bed} table is valid.
See also the \code{bed} file format reference at
\url{https://www.cog-genomics.org/plink2/formats#bed}}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
\link{TRUE} if the table is a valid \code{.bed} table
}
\description{
Determine if a \code{.bed} table is valid.
}
\examples{
is_bed_table(get_test_bed_table())
is_bed_table("nonsense")
}
\seealso{
use \link{check_bed_table} to check if a table
is a valid \code{.bed} table (i.e. \link{stop} if it is not)
}
\author{
Richèl J.C. Bilderbeek
}
