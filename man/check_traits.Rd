% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_traits.R
\name{check_traits}
\alias{check_traits}
\title{Check if a list of traits is valid.}
\usage{
check_traits(traits)
}
\arguments{
\item{traits}{one or more traits
with a clear genetic architecture and a known minor allele frequency,
as, for example, created by \link{create_demo_traits}.}
}
\description{
Check if a list of traits
(each with a clear genetic architecture and a known minor allele frequency)
is valid.
Will \link{stop} if not
}
\examples{
check_traits(create_additive_trait())
check_traits(create_random_trait())
check_traits(list(create_additive_trait(), create_random_trait()))
}
\author{
Richèl J.C. Bilderbeek
}
