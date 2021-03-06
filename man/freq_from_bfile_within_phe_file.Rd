% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/freq_from_bfile_within_phe_file.R
\name{freq_from_bfile_within_phe_file}
\alias{freq_from_bfile_within_phe_file}
\title{Let \code{PLINK}/\code{PLINK2}
calculate the allele frequencies
per phenotype.}
\usage{
freq_from_bfile_within_phe_file(
  bfile,
  phe_filename,
  out,
  plink_options = create_plink_options(),
  verbose = FALSE
)
}
\arguments{
\item{bfile}{the base filename of the binary files (i.e.
a \code{.bed}, \code{.bim} and \code{.fam} file).
This parameter is named after the \code{PLINK}
\code{--bfile} flag}

\item{phe_filename}{name of a phenotype (\code{.phe}) file,
as checked by \link{check_phe_filename}.
Use \link{read_plink_phe_file} to read a raw phenotype file.}

\item{out}{the base filename of the output files.
This parameter is named after the \code{PLINK}
\code{--out} flag}

\item{plink_options}{options to run PLINK,
as created by \link{create_plink_options}}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
a \link{list} with the following elements:
\itemize{
\item \code{frq_table} table with ?
\item \code{log} the log text
}
}
\description{
Let \code{PLINK}/\code{PLINK2}
calculate the allele frequencies
per phenotype, from PLINK1 binary filenames
}
\note{
This function is named after the \code{--freq} flag
used by \code{PLINK}
}
\author{
Richèl J.C. Bilderbeek
}
