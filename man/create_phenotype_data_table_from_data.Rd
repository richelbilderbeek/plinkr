% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_phenotype_data_table_from_data.R
\name{create_phenotype_data_table_from_data}
\alias{create_phenotype_data_table_from_data}
\title{Create a \code{phenotype_data} from the PLINK data.}
\usage{
create_phenotype_data_table_from_data(data)
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
}
\value{
a single-phenotype \link[tibble]{tibble}, with columns:
\itemize{
\item \code{FID} the family ID
\item \code{IID} the within-family ID
\item \code{P1} the phenotype
}

The column names match the PLINK names, see
\url{https://www.cog-genomics.org/plink/1.9/input#pheno}
}
\description{
Create a \code{phenotype_data} from the PLINK data.
The individuals' family and within-family ID's are copied.
The \code{case_control_code} is copied as well, but
renamed to \code{trait} and divided by then.
In this way, PLINK treats the phenotype table as having quantitative
traits.
}
\examples{
create_phe_table_from_data(create_test_plink_text_data())
create_phe_table_from_data(create_test_plink_bin_data())
create_phe_table_from_data(create_test_plink2_bin_data())
}
\author{
Richèl J.C. Bilderbeek
}
