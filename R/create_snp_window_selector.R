#' Create a SNP window selector
#'
#' Create a SNP window selector,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_snp_window_selector} to
#' create a SNP window selector to be used in testing.
#'
#' There are multiple SNP selectors,
#' see \link{create_snps_selector} for an overview
#' @examples
#' create_snp_window_selector(
#'   snp = "my_snp",
#'   window_kb = 12.34
#' )
#'
#' if (is_plink_installed()) {
#'
#'   plink_bin_filenames <- create_plink_bin_filenames(
#'     bed_filename = get_plinkr_filename("select_snps.bed"),
#'     bim_filename = get_plinkr_filename("select_snps.bim"),
#'     fam_filename = get_plinkr_filename("select_snps.fam")
#'   )
#'
#'   # Selects a window of 3, i.e. the variant before,
#'   # and after the focal SNP
#'   snp_window_selector <- create_snp_window_selector(
#'     snp = "snp_5",
#'     window_kb = 0.003
#'   )
#'   new_plink_bin_data <- select_snps(
#'     data = plink_bin_filenames,
#'     snp_selector = snp_window_selector
#'   )
#' }
#' @export
#' @author Richèl J.C. Bilderbeek
create_snp_window_selector <- function(
  snp,
  window_kb
) {
  plinkr::check_snp(snp)
  plinkr::check_window_kb(window_kb)
  if (window_kb == 0.0) {
    stop(
      "'snp_window_selector' must select at least 1 base pair. \n",
      "Tip: set 'window_kb' to 0.001 to select 1 base pair"
    )
  }
  list(
    snp = snp,
    window_kb = window_kb
  )
}
