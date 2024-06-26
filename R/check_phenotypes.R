#' Check if the phenotypes are indeed phenotypes with a clear genetic setup.
#'
#' Check if the phenotypes are indeed phenotypes with a clear genetic setup.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing
#' Will \link{stop} if the phenotypes are not
#' in the supported list of phenotypes with a clear genetic setup,
#' as can be obtained with \link{get_phenotypes}
#' @author Richèl J.C. Bilderbeek
#' @export
check_phenotypes <- function(
  phenotypes
) {
  testthat::expect_true(all(is.character(phenotypes)))
  testthat::expect_true(all(nchar(phenotypes) > 0))
}
