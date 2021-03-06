#' Create a single-phenotype table from pedigree (\code{.ped}) table
#' within the PLINK text files.
#'
#' Create a single-phenotype table from pedigree (\code{.ped}) table
#' within the PLINK text files.
#' The individuals' family and within-family ID's are copied.
#' The \code{case_control_code} is copied as well, but
#' renamed to \code{trait} and divided by then.
#' In this way, PLINK treats the phenotype table as having quantitative
#' traits.
#' @inheritParams default_params_doc
#' @return a single-phenotype \link[tibble]{tibble}, with columns:
#'
#' * \code{FID} the family ID
#' * \code{IID} the within-family ID
#' * \code{P1} the phenotype
#'
#' The column names match the PLINK names, see
#' \url{https://www.cog-genomics.org/plink/1.9/input#pheno}
#' @author Richèl J.C. Bilderbeek
#' @export
create_phe_table_from_plink_text_filenames <- function(plink_text_filenames) { # nolint indeed a long function name
  plinkr::check_plink_text_filenames(plink_text_filenames)
  stop("TODO")
}
