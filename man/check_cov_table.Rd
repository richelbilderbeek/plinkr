% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_cov_table.R
\name{check_cov_table}
\alias{check_cov_table}
\title{Check if a covariate table is valid.}
\usage{
check_cov_table(cov_table)
}
\arguments{
\item{cov_table}{a table of covariates.

A \code{cov_table} is a \link[tibble]{tibble} with these columns:
\itemize{
\item \code{FID} The family ID
\item \code{IID} Within-family ID (cannot be zero)
\item One or more columns of covariate values,
columns can have any name
}

These names match the PLINK column
names (\url{https://www.cog-genomics.org/plink/1.9/input#pheno}).
Use \link{read_plink_cov_file} to read a covariates file.
Use \link{check_cov_table} to test if a covariates table is valid.}
}
\value{
Nothing. Will \link{stop} if the \code{cov_table} is invalid
}
\description{
Check if a covariate table is valid.
Will \link{stop} if not
}
\author{
Richèl J.C. Bilderbeek
}
