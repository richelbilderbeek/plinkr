#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` binary format.
#'
#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` binary format.
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'
#'  * `qassoc_filenames`: names of the created association files
#'  * `log_filename`: name of the PLINK log file
#'
#' @seealso use \link{assoc_qt_on_plink_bin_data} to work on data directly
#' @note This function is named after the `--assoc` flag used by PLINK.
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_bin_files <- function(
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_data(assoc_qt_data)
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_bin_filenames(assoc_qt_data$data)

  # Phenotype data: save if in-memory
  if (plinkr::is_phenotype_data_table(assoc_qt_data$phenotype_data)) {

    phe_filename <- paste0(assoc_qt_params$base_input_filename, ".phe")
    plinkr::check_phe_filename(phe_filename)

    assoc_qt_data$phenotype_data <- plinkr::save_phenotype_data_table(
      phenotype_data_table = assoc_qt_data$phenotype_data,
      phe_filename = phe_filename
    )
    testthat::expect_true(file.exists(phe_filename))
    testthat::expect_equal(
      assoc_qt_data$phenotype_data$phe_filename,
      phe_filename
    )
  } else {
    testthat::expect_true(
      plinkr::is_phenotype_data_filename(assoc_qt_data$phenotype_data)
    )
  }
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(assoc_qt_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- plinkr::create_assoc_qt_args(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  qassoc_filenames <- list.files(
    path = dirname(assoc_qt_params$base_output_filename),
    pattern = "\\..*\\.qassoc",
    full.names = TRUE
  )
  testthat::expect_true(all(file.exists(qassoc_filenames)))
  testthat::expect_true(file.exists(log_filename))
  list(
    qassoc_filenames = qassoc_filenames,
    log_filename = log_filename
  )
}
