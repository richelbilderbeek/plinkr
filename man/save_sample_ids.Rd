% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_sample_ids.R
\name{save_sample_ids}
\alias{save_sample_ids}
\title{Save a \code{sample_ids} to file.}
\usage{
save_sample_ids(sample_ids, sample_ids_filename)
}
\arguments{
\item{sample_ids}{sample IDs, which is a \link[tibble]{tibble}
with two columns: the first column holds the family ID
(called \code{fid} or \code{FID} by PLINK/PLINK2),
the second column holds the within-family ID
(called \code{iid} or \code{IID} by PLINK/PLINK2),
as can be checked by \link{check_sample_ids}}

\item{sample_ids_filename}{name of a file to store \code{sample_ids}
(see \link{check_sample_ids}) to}
}
\value{
Nothing. Will create a file
}
\description{
Save a \code{sample_ids} to file.
}
\examples{
sample_ids <- get_test_sample_ids()
sample_ids_filename <- get_plinkr_tempfilename()
save_sample_ids(
  sample_ids = sample_ids,
  sample_ids_filename = sample_ids_filename
)

# Clean up
}
\author{
Richèl J.C. Bilderbeek
}
