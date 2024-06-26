#' Let `PLINK`/`PLINK2` detect an association
#' with one or more quantitative traits.
#'
#' Let `PLINK`/`PLINK2` detect an association
#' with one or more quantitative traits.
#' @inheritParams default_params_doc
#' @return
#' A `assoc_qt_result`, which is a list
#' which is a \link{list} with elements:
#'
#'  * `qassoc_table`: the quantitative analysis results table,
#'    as can be checked by \link{check_qassoc_table}
#'  * `log`: the text from the log file created by `PLINK`/`PLINK2`
#'    when doing \link{assoc_qt}
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @seealso Use \link{assoc} to do a case-control association
#' @examples
#' if (is_plink_installed()) {
#'   # Demo data
#'   assoc_qt(
#'     assoc_qt_data = create_demo_assoc_qt_data(),
#'     assoc_qt_params = create_test_assoc_qt_params()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt <- function(
  assoc_qt_data,
  assoc_qt_params = create_assoc_qt_params(),
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  # Other inputs are checked in the specific function called
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )
  assoc_qt_result <- NULL
  if (plinkr::is_plink_text_data(assoc_qt_data$data)) {
    assoc_qt_result <- plinkr::assoc_qt_on_plink_text_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else if (plinkr::is_plink_bin_data(assoc_qt_data$data)) {
    assoc_qt_result <- plinkr::assoc_qt_on_plink_bin_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else if (plinkr::is_plink2_bin_data(assoc_qt_data$data)) {
    assoc_qt_result <- plinkr::assoc_qt_on_plink2_bin_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else if (plinkr::is_plink_text_filenames(assoc_qt_data$data)) {
    assoc_qt_result <- plinkr::assoc_qt_on_plink_text_files(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else if (plinkr::is_plink_bin_filenames(assoc_qt_data$data)) {
    assoc_qt_result <- plinkr::assoc_qt_on_plink_bin_files(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else {
    testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_qt_data$data))
    assoc_qt_result <- plinkr::assoc_qt_on_plink2_bin_files(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  }
  assoc_qt_result
}
