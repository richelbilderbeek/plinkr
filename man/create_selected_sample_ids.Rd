% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_selected_sample_ids.R
\name{create_selected_sample_ids}
\alias{create_selected_sample_ids}
\title{Create a table of the selected sample IDs}
\usage{
create_selected_sample_ids(plink_bin_filenames, sample_selector)
}
\arguments{
\item{plink_bin_filenames}{the binary data files' names for \code{PLINK}
to work on,
as created by \link{create_plink_bin_filenames}.}

\item{sample_selector}{a sample/individual selector,
a way to select one or more samples/individuals.
See \link{create_samples_selector} for all sample selectors.}
}
\value{
a \code{sample_ids} (see \link{check_sample_ids})
}
\description{
Create a table of the selected sample IDs
}
\author{
Richèl J.C. Bilderbeek
}
