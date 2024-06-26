% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_plink_eigenvec_file.R
\name{read_plink_eigenvec_file}
\alias{read_plink_eigenvec_file}
\title{Read a \code{PLINK}/\code{PLINK2} \code{.eigenvec} file}
\usage{
read_plink_eigenvec_file(eigenvec_filename)
}
\arguments{
\item{eigenvec_filename}{name for a \code{.eigenvec} file,
as can be read with \link{read_plink_eigenvec_file}}
}
\value{
a \link[tibble]{tibble} with the following columns:
\itemize{
\item \code{fam}: the family ID, also know as \code{FID}
\item \code{id}: the within-family ID, also know as \code{IID}
\item \code{pc_[x]}: the \verb{[x]}th principle component
}
}
\description{
Read a \code{PLINK}/\code{PLINK2} \code{.eigenvec} file.
}
\details{
By default, \link{pca} (the function to do principal
component analysis) uses 20 eigenvecues
}
\examples{
read_plink_eigenvec_file(
  eigenvec_filename = get_plinkr_filename("pca.eigenvec")
)
}
\seealso{
use \link{get_test_eigenvec_table} to get an
eigenvecue table, to be used in testing
}
\author{
Richèl J.C. Bilderbeek
}
