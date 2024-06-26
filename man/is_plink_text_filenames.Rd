% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_plink_text_filenames.R
\name{is_plink_text_filenames}
\alias{is_plink_text_filenames}
\title{Determine if the \code{plink_text_files} is indeed a set of \code{PLINK}
text files' names}
\usage{
is_plink_text_filenames(plink_text_filenames, verbose = FALSE)
}
\arguments{
\item{plink_text_filenames}{the text data files' names for \code{PLINK}
to work on,
as created by \link{create_plink_text_filenames}.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
\link{TRUE} if the \code{plink_text_files} is indeed a set of \code{PLINK}
text files' names
}
\description{
Determine if the \code{plink_text_files} is indeed a set of \code{PLINK}
text files' names.
}
\note{
the singular verb \code{is} is used to indicate it is one data structure.
}
\examples{
is_plink_text_filenames(create_test_plink_text_filenames())
}
\seealso{
\code{plinkr} has multiple functions to test if a set of files is valid:
\itemize{
\item \code{PLINK} text files: use \link{is_plink_text_filenames}
\item \code{PLINK} binary files: use \link{is_plink_bin_filenames}
\item \code{PLINK2} binary files: use \link{is_plink2_bin_filenames}
}
}
\author{
Richèl J.C. Bilderbeek
}
