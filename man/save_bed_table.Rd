% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_bed_table.R
\name{save_bed_table}
\alias{save_bed_table}
\title{Save a \code{.bed} table to file.}
\usage{
save_bed_table(bed_table, bed_filename, verbose = FALSE)
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

\item{bed_filename}{name of a \code{PLINK} \code{.bed} file
Use \link{read_plink_bed_file} to read a \code{PLINK} \code{.bed} file.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\description{
Save a \code{.bed} table to file
}
\examples{
bed_table <- get_test_bed_table()
bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
save_bed_table(
  bed_table = bed_table,
  bed_filename = bed_filename
)
file.remove(bed_filename)
}
\author{
Richèl J.C. Bilderbeek
}
