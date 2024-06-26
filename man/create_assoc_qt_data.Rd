% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_assoc_qt_data.R
\name{create_assoc_qt_data}
\alias{create_assoc_qt_data}
\title{Create the data needed for the \link{assoc_qt} function}
\usage{
create_assoc_qt_data(data, phenotype_data)
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

\item{phenotype_data}{phenotype data in the form of either
a filename to a phenotype file (\code{phenotype_data_filename})
or a list with a phenotype table (\code{phenotype_data_table})}
}
\value{
an \code{assoc_qt_data} structure
}
\description{
Create the data needed (in this case, 'regular' data and phenotype
data) to detect associations with quantitative traits,
as used by \link{assoc_qt}.
}
\examples{
create_assoc_qt_data(
  data = create_test_plink_text_data(),
  phenotype_data = create_test_phenotype_data_table()
)
}
\author{
Richèl J.C. Bilderbeek
}
