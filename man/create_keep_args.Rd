% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_keep_args.R
\name{create_keep_args}
\alias{create_keep_args}
\title{Create the CLI arguments to call \code{PLINK} with the \code{--keep} flag}
\usage{
create_keep_args(bfile, sample_ids_filename, base_output_filename)
}
\arguments{
\item{bfile}{the base filename of the binary files (i.e.
a \code{.bed}, \code{.bim} and \code{.fam} file).
This parameter is named after the \code{PLINK}
\code{--bfile} flag}

\item{sample_ids_filename}{name of a file to store \code{sample_ids}
(see \link{check_sample_ids}) to}

\item{base_output_filename}{the base of the filenames that are
used as output for \code{PLINK}/\code{PLINK2}}
}
\value{
the CLI arguments
}
\description{
Create the CLI arguments to call \code{PLINK} with the \code{--keep} flag
}
\author{
Richèl J.C. Bilderbeek
}
