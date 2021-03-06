#' Create a random SNP selector
#'
#' Create a random SNP selector
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_random_snps_selector} to
#' create a random SNP selector to be used in testing.
#'
#' There are multiple SNP selectors,
#' see \link{create_snps_selector} for an overview
#' @examples
#' create_random_snps_selector(
#'   n_snps = 42
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_random_snps_selector <- function(
  n_snps
) {
  plinkr::check_n_snps(n_snps)
  if (n_snps == 0) {
    stop(
      "'random_snps_selector' must select at least 1 base pair. \n",
      "Tip: set 'n_snps' to 1 to select 1 base pair"
    )
  }
  list(
    n_snps = n_snps
  )
}
