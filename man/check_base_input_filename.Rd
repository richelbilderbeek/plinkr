% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_base_input_filename.R
\name{check_base_input_filename}
\alias{check_base_input_filename}
\title{Check if the \code{base_input_filename} is valid.
Check if the \code{base_input_filename},
which is a filename without an extension}
\usage{
check_base_input_filename(base_input_filename)
}
\arguments{
\item{base_input_filename}{the base of the filenames that are
used as input for \code{PLINK}/\code{PLINK2}}
}
\value{
Nothing. Will \link{stop} if the input
is a filename
}
\description{
Will \link{stop} if not
}
\author{
Richèl J.C. Bilderbeek
}
