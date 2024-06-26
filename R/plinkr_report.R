#' Create a \link{plinkr} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' plinkr_report()
#' @author Richèl J.C. Bilderbeek
#' @export
plinkr_report <- function(plink_optionses = plinkr::create_plink_optionses()) {
  message("OS: ", rappdirs::app_dir()$os)
  for (plink_options in plink_optionses) {
    message(
      paste0("PLINK version (plinkr versioning scheme) '",
        plink_options$plink_version, "' installed: ",
        plinkr::is_plink_installed(plink_options)
      )
    )
    if (plinkr::is_plink_installed(plink_options)) {
      message(
        paste0(
          "PLINK version (PLINK versioning scheme): ",
          plinkr::get_plink_version(plink_options)
        )
      )
    }
  }
  message(paste0(devtools::session_info(), collapse = "\n"))
}
