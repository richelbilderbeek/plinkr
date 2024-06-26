% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_marker_correlation_coefficients_table.R
\name{get_marker_correlation_coefficients_table}
\alias{get_marker_correlation_coefficients_table}
\title{Get the marker correlation coefficients (also known as \code{r})
from genetic data in a table}
\usage{
get_marker_correlation_coefficients_table(
  data,
  ld_window_r2 = 0.2,
  plink_options = create_plink_options(),
  temp_folder = plinkr::get_plinkr_tempfilename(),
  verbose = FALSE
)
}
\arguments{
\item{data}{the data source, which can be:
\itemize{
\item PLINK text data, as created by \link{create_plink_text_data}.
\item PLINK binary data, as created by \link{create_plink_bin_data}.
\item PLINK2 binary data, as created by \link{create_plink2_bin_data}.
\item PLINK text filenames, as created by \link{create_plink_text_filenames}.
\item PLINK binary filenames, as created by \link{create_plink_bin_filenames}.
\item PLINK2 binary filenames, as created by \link{create_plink2_bin_filenames}.
\item data to be used by \link{assoc},
as created by \link{create_assoc_data}
\item data to be used by \link{assoc_qt},
as created by \link{create_assoc_qt_data}
}}

\item{ld_window_r2}{the minimal squared correlation coefficient (also
known as \code{r^2}) between markers. This parameter is named after the
\code{--ld_window_r2} flag, as documented at
\url{https://www.cog-genomics.org/plink/1.9/ld}.}

\item{plink_options}{options to run PLINK,
as created by \link{create_plink_options}}

\item{temp_folder}{temporary folder to store results in}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
an \code{ld_table}, see \link{read_plink_ld_file}
}
\description{
Similar to PLINK, the correlation coefficients are measured
for markers on the same chromosome
}
\examples{
if (is_plink_installed()) {
  # Create example PLINK text data
  assoc_qt_data <- create_demo_assoc_qt_data()
  # PLINK checks for LD on markers on the same chromosome
  assoc_qt_data$data$map_table$CHR <- 1

  # PLINK uses a default value of ld_window_r2 = 0.2,
  # which, in this examples, does not give a result
  get_marker_correlation_coefficients_table(
    assoc_qt_data$data
  )

  # Show all values
  get_marker_correlation_coefficients_table(
    assoc_qt_data$data,
    ld_window_r2 = 0.0
  )

  # PLINK binary data
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  get_marker_correlation_coefficients_table(
    assoc_qt_data$data,
    ld_window_r2 = 0.0
  )
}
}
\seealso{
use \link{get_marker_correlation_coefficients} to
only get the marker correlation coefficients
}
\author{
Richèl J.C. Bilderbeek
}
