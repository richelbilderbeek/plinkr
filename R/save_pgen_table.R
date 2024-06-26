#' Save a \code{.pgen} table to file.
#'
#' Save a \code{.pgen} table to file
#' @inheritParams default_params_doc
#' @examples
#' pgen_table <- get_test_pgen_table()
#' pgen_filename <- get_plinkr_tempfilename(fileext = ".pgen")
#' if (1 == 2) {
#'   save_pgen_table(
#'     pgen_table = pgen_table,
#'     pgen_filename = pgen_filename
#'   )
#'   file.remove(pgen_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
save_pgen_table <- function(
  pgen_table,
  pgen_filename,
  verbose = FALSE
) {
  plinkr::check_pgen_table(pgen_table)
  stop("Need help of 'pgenlibr' to save a .pgen file")

  dir.create(dirname(pgen_filename), showWarnings = FALSE, recursive = TRUE)

  #
  # Save file here
  #

  testthat::expect_true(file.exists(pgen_filename))
  invisible(pgen_table)
}
