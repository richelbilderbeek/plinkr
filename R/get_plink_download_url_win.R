#' Get the URL to download a 64-bit Windows version of PLINK
#' @inheritParams default_params_doc
#' @return a URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_download_url_win <- function(
  plink_version = get_default_plink_version()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "1.7") {
    return(
      "http://zzz.bwh.harvard.edu/plink/dist/plink-1.07-dos.zip"
    )
  }
  else if (plink_version == "1.9") {
    return(
      "https://s3.amazonaws.com/plink1-assets/plink_win64_20210528.zip"
    )
  }
  testthat::expect_true(plink_version == "2.0")
  "https://s3.amazonaws.com/plink2-assets/alpha2/plink2_win64.zip"
}
