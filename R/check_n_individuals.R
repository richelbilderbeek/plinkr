#' Check if the number of individual is valid.
#'
#' Check if the number of individual is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return the checked number of individuals,
#' now as a class of type `n_individuals`
#' @author Richèl J.C. Bilderbeek
#' @export
check_n_individuals <- function(n_individuals) {
  testthat::expect_equal(1, length(n_individuals))
  testthat::expect_true(is.numeric(n_individuals))
  testthat::expect_true(is.finite(n_individuals))
  testthat::expect_true(n_individuals >= 2)
  testthat::expect_equal(n_individuals, as.integer(n_individuals))
  n_individuals
}
