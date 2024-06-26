% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_n_samples.R
\name{get_n_samples_from_map_table}
\alias{get_n_samples_from_map_table}
\title{Get the number of samples from a \code{.map} table}
\usage{
get_n_samples_from_map_table(map_table)
}
\arguments{
\item{map_table}{a genetic mapping table.

A \code{map_table} is a \link[tibble]{tibble} with the following columns:
\itemize{
\item \code{CHR}: the chromosome code or contig name.
The chromosome number cannot exceed 95
(\url{https://www.cog-genomics.org/plink/1.9/input#chr_set})
\item \code{SNP}: Variant identifier
\item \code{position_cm}: Position in morgans or centimorgans.
This value is optional. Zeroes denote it is unused
\item \code{BP}: Base-pair coordinat
}

Use \link{read_plink_map_file} to read a \code{PLINK} \code{.map} file.
Use \link{check_map_table} to test if a genetic mapping table is valid.}
}
\value{
the number of samples
}
\description{
Get the number of samples from a \code{.map} table
}
