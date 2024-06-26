#' Internal function
#'
#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis, when
#' `PLINK` text data is used
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @seealso see \link{create_assoc_qt_args} for all the specialized
#' functions to create the `PLINK`/`PLINK2` command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args_on_plink_text_data <- function( # nolint indeed a long function name
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_data(assoc_qt_data)
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink1_versions()
  )
  args <- c(
    "--map", paste0(assoc_qt_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_qt_params$base_input_filename, ".ped"),
    "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
    "--all-pheno",
    "--assoc",
    "--maf", assoc_qt_params$maf,
    "--out", assoc_qt_params$base_output_filename
  )
  if (plink_options$plink_version == "1.7") {
    args <- c(args, "--noweb")
  }
  if (plink_options$plink_version == "1.9") {
    args <- c(args, "--allow-extra-chr", "--chr-set", 95)
  }
  if (plink_options$plink_version == "2.0") {
    if (!is.na(assoc_qt_params$confidence_interval)) {
      args <- c(args, "--ci", assoc_qt_params$confidence_interval)
    }
  }
  if (assoc_qt_params$allow_no_sex) {
    args <- c(args, "--allow-no-sex")
  }
  args
}
