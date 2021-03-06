% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_plink_text_data_to_plink2_bin_data.R
\name{convert_plink_text_data_to_plink2_bin_data}
\alias{convert_plink_text_data_to_plink2_bin_data}
\title{Convert the \code{PLINK} text data to \code{PLINK} binary data}
\usage{
convert_plink_text_data_to_plink2_bin_data(
  plink_text_data,
  base_output_plink1_filename = plinkr::get_plinkr_tempfilename(fileext = ""),
  base_output_plink2_filename = plinkr::get_plinkr_tempfilename(fileext = ""),
  plink1_options = create_plink_v1_9_options(),
  plink2_options = create_plink_v2_0_options(),
  verbose = FALSE
)
}
\arguments{
\item{plink_text_data}{the genetic and phenotypic data for \code{PLINK} to work
on, in \code{PLINK} text format, as created by \link{create_plink_text_data}.}

\item{base_output_plink1_filename}{temporary folder to create the \code{PLINK}
binary files in}

\item{base_output_plink2_filename}{temporary folder to create the \code{PLINK2}
binary files in}

\item{plink1_options}{the \code{PLINK} version,
as created by \link{create_plink_options},
for any version of \code{PLINK}}

\item{plink2_options}{the \code{PLINK2} version,
as created by \link{create_plink_options},
for any version of \code{PLINK2}}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
the same \link{list} that was used as input,
except that the following elements
\itemize{
\item \code{ped_table} (see \link{check_ped_table})
\item \code{map_table} (see \link{check_map_table})
}

are replaced by:
\itemize{
\item \code{pgen_table} (see \link{check_pgen_table})
\item \code{psam_table} (see \link{check_psam_table})
\item \code{pvar_table} (see \link{check_pvar_table})
}

The other list elements are left as-is.
}
\description{
Convert the \code{PLINK} text data to \code{PLINK} binary data.
}
\seealso{
these are the functions to convert between the \code{PLINK} and
\code{PLINK2} formats:
\itemize{
\item To convert from PLINK1 text data
\itemize{
\item to PLINK1 binary data:
use \link{convert_plink_text_data_to_plink_bin_data}
\item to PLINK2 binary data,
use \link{convert_plink_text_data_to_plink2_bin_data}
}
\item To convert from PLINK1 binary data
\itemize{
\item to PLINK text data,
use \link{convert_plink_bin_data_to_plink_text_data}
\item to PLINK2 binary data,
use \link{convert_plink_bin_data_to_plink2_bin_data}
}
\item To convert from PLINK2 binary data
\itemize{
\item to PLINK text data,
use \link{convert_plink2_bin_data_to_plink_text_data}
\item to PLINK binary data,
use \link{convert_plink2_bin_data_to_plink_bin_data}
}
}
}
\author{
Richèl J.C. Bilderbeek
}
