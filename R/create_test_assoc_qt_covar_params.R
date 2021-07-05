#' Create testing parameters for the \link{assoc_qt} function
#'
#' Create parameters (as created by \link{create_assoc_qt_params})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_covar_params <- function( # nolint indeed a long function name
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table(),
  phe_table = plinkr::create_phe_table_from_ped_table(
    ped_table = ped_table
  ),
  cov_table = plinkr::create_cov_table_from_ped_table(
    ped_table = ped_table
  ),
  maf = get_lowest_maf()
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_phe_table(phe_table = phe_table)
  plinkr::check_cov_table(cov_table = cov_table)
  plinkr::check_maf(maf = maf)
  phe_table[, 3] <- 0.1 * seq_len(nrow(phe_table))
  cov_table[, 3] <- 0.2 * seq_len(nrow(cov_table))
  plinkr::create_assoc_qt_covar_params(
    ped_table = ped_table,
    map_table = map_table,
    phe_table = phe_table,
    cov_table = cov_table,
    maf = maf
  )
}