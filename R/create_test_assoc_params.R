#' Create testing parameters for the \link{assoc} function
#'
#' Create parameters (as created by \link{create_assoc_params})
#' to detect associations with quantitative traits
#' (using \link{assoc}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_params <- function(
  confidence_interval = 0.95,
  maf = get_lowest_maf()
) {
  plinkr::check_confidence_interval(confidence_interval = confidence_interval)
  plinkr::check_maf(maf = maf)
  plinkr::create_assoc_params(
    confidence_interval = confidence_interval,
    maf = maf
  )
}
