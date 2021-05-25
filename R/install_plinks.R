#' Install multiple versions of PLINK
#' @inheritParams default_params_doc
#' @export
install_plinks <- function(
  plink_versions = get_plink_versions(),
  plink_folder = get_plink_folder()
) {
  for (plink_version in plink_versions) {
    plinkr::check_plink_version(plink_version)
    plinkr::install_plink(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  }
}