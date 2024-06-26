% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_samples_selector.R
\name{create_samples_selector}
\alias{create_samples_selector}
\title{Create a sample selector}
\usage{
create_samples_selector(sample_selector)
}
\arguments{
\item{sample_selector}{a sample/individual selector,
a way to select one or more samples/individuals.
See \link{create_samples_selector} for all sample selectors.}
}
\value{
Nothing.
}
\description{
Create a sample selector.
This function is not meant to be used,
prefer the named specialized functions instead,
which are listed at the 'See Also' section.
}
\examples{
create_samples_selector(create_test_random_samples_selector())
create_samples_selector(create_test_single_sample_selector())
}
\seealso{
There are multiple sample selectors,
\itemize{
\item A random samples selector: \link{create_random_samples_selector}
\item A single sample selector: \link{create_single_sample_selector}
}
}
\author{
Richèl J.C. Bilderbeek
}
