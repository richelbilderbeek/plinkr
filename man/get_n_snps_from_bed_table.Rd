% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_n_snps.R
\name{get_n_snps_from_bed_table}
\alias{get_n_snps_from_bed_table}
\title{Get the number of SNPs from a \code{.bed} table}
\usage{
get_n_snps_from_bed_table(bed_table)
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
}
\value{
the number of SNPs
}
\description{
Get the number of SNPs from a \code{.bed} table
}
