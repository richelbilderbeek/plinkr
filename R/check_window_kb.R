#' Check if the window size (in kilobases) is valid.

#' Check if the window size (in kilobases) is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the window
#' size (in kilobases) is invalid
#' @seealso the window size is used by:
#'  * \link{create_snp_window_selector}:
#'    to select variants of a certain window around a SNP
#' @note `PLINK` uses a CLI flag called `--window` that works with kilobases.
#' To adhere to the `PLINK` interface, the word 'window' is used, yet with
#' the unit added in the flag's name
#' @examples
#' check_window_kb(0.001) # 1 base pair
#' check_window_kb(1) # 1000 base pairs
#' @author Richèl J.C. Bilderbeek
#' @export
check_window_kb <- function(window_kb) {
  testthat::expect_equal(1, length(window_kb))
  testthat::expect_true(is.numeric(window_kb))
  testthat::expect_true(is.finite(window_kb))
  testthat::expect_true(window_kb >= 0)
  testthat::expect_equal(window_kb * 1000, as.integer(window_kb * 1000))
  invisible(window_kb)
}
