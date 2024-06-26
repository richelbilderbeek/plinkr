#' Check if the \code{assoc_params} are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_params <- function(assoc_params) {
  testthat::expect_true(is.list(assoc_params))
  testthat::expect_true("maf" %in% names(assoc_params))
  testthat::expect_true("base_input_filename" %in% names(assoc_params))
  testthat::expect_true("base_output_filename" %in% names(assoc_params))
  testthat::expect_silent(
    plinkr::check_base_input_filename(assoc_params$base_input_filename)
  )
  testthat::expect_silent(
    plinkr::check_base_output_filename(assoc_params$base_output_filename)
  )
  invisible(assoc_params)
}
