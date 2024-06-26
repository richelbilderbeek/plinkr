% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_sample_selector.R
\name{is_sample_selector}
\alias{is_sample_selector}
\title{Determine if this is a sample selector}
\usage{
is_sample_selector(sample_selector, verbose = FALSE)
}
\arguments{
\item{sample_selector}{a sample/individual selector,
a way to select one or more samples/individuals.
See \link{create_samples_selector} for all sample selectors.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
\link{TRUE} if this is a sample selector
}
\description{
Determine if this is a sample selector
}
\examples{
is_sample_selector(create_test_random_samples_selector())
is_sample_selector(create_test_single_sample_selector())

is_sample_selector("nonsense")
}
\seealso{
use \link{is_snp_selector} to determine if a selector
is a SNP selector
}
\author{
Richèl J.C. Bilderbeek
}
