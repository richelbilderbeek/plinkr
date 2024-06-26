#' Create a set of `PLINK` binary data
#' @inheritParams default_params_doc
#' @seealso use \link{create_test_plink_bin_data} to create a set
#' of `PLINK` binary data to be used in testing
#' @examples
#' create_plink_bin_data(
#'   bim_table = get_test_bim_table(),
#'   fam_table = get_test_fam_table(),
#'   bed_table = get_test_bed_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_bin_data <- function(
  bim_table,
  fam_table,
  bed_table
) {
  plinkr::check_bim_table(bim_table = bim_table)
  plinkr::check_fam_table(fam_table = fam_table)
  plinkr::check_bed_table(bed_table = bed_table)
  plink_bin_data <- list(
    bed_table = bed_table,
    bim_table = bim_table,
    fam_table = fam_table
  )
  plinkr::check_plink_bin_data(plink_bin_data)
  plink_bin_data
}
