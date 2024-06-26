% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_plinkr_filenames.R
\name{get_plinkr_filenames}
\alias{get_plinkr_filenames}
\title{Get the full paths to all plinkr files}
\usage{
get_plinkr_filenames(pattern = NULL)
}
\arguments{
\item{pattern}{an optional regular expression,
as used by \link{list.files}.
Only file names which match the regular expression will be returned.}
}
\value{
the full paths to all plinkr files
}
\description{
Get the full paths to all plinkr files
}
\examples{
get_plinkr_filenames()
get_plinkr_filenames(pattern = ".ped")
}
\author{
Richèl J.C. Bilderbeek
}
