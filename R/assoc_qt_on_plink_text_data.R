#' Let PLINK detect an association with one or more quantitative traits
#' with data in PLINK text format.
#'
#' Let PLINK detect an association with one or more quantitative traits.
#' with data in PLINK text format.
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble} with the detected associations.
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' If the `assoc_qt_params` used PLINK1 text or PLINK1 binary data,
#' the \link[tibble]{tibble} has the following columns:
#'
#'   * \code{trait_name}: name of the quantitive trait,
#'     taken from the phenotype table column name
#'   * \code{CHR}: Chromosome number
#'   * \code{SNP}: SNP identifier
#'   * \code{BP}: Physical position (base-pair)
#'   * \code{NMISS}: Number of non-missing genotypes
#'   * \code{BETA}: Regression coefficient
#'   * \code{SE}: Standard error
#'   * \code{R2}: Regression r-squared
#'   * \code{T}: Wald test (based on t-distribution)
#'   * \code{P}: Wald test asymptotic p-value
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @examples
#' if (is_plink_installed()) {
#'   assoc_qt(
#'     assoc_qt_data = create_demo_assoc_qt_data(),
#'     assoc_qt_params = create_test_assoc_qt_params()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_text_data <- function(
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_data(assoc_qt_data)
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )
  if (!plinkr::is_plink_text_data(assoc_qt_data$data)) {
    stop(
      "'assoc_qt_data$data' is not PLINK text data. \n",
      "Tip 1: use 'assoc_qt' to let plinkr detect the type of PLINK data. \n",
      "Tip 2: If the data is in PLINK binary format, ",
        "use 'assoc_qt_on_plink_bin_data'. \n",
      "Tip 3: If the data is in PLINK2 binary format, ",
      "use 'assoc_qt_on_plink2_bin_data'. \n"
    )
  }
  if (plinkr::is_phenotype_data_table(assoc_qt_data$phenotype_data)) {
    plinkr::check_phe_table_ok_for_qt(
      phe_table = assoc_qt_data$phenotype_data$phe_table
    )
  } else {
    testthat::expect_true(
      plinkr::is_phenotype_data_filename(assoc_qt_data$phenotype_data)
    )
    plinkr::check_phe_file_ok_for_qt(assoc_qt_data$phenotype_data$phe_filename)
  }
  assoc_qt_data$phenotype_data$phe_table

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  phe_filename <- paste0(base_input_filename, ".phe")
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # Convert data from in-memory to saved files
  # Regular data
  assoc_qt_data$data <- plinkr::save_plink_text_data(assoc_qt_data$data)
  testthat::expect_true(file.exists(assoc_qt_data$data$map_filename))
  testthat::expect_true(file.exists(assoc_qt_data$data$ped_filename))

  qassoc_result <- plinkr::assoc_qt_on_plink_text_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options,
    verbose = verbose
  )
  qassoc_filenames <- qassoc_result$qassoc_filenames
  log_filename <- qassoc_result$log_filename

  qassoc_table <- plinkr::read_plink_qassoc_files(
    qassoc_filenames = qassoc_filenames
  )
  log <- plinkr::read_plink_log_file(
    log_filename = log_filename
  )

  file.remove(assoc_qt_data$data$map_filename)
  file.remove(assoc_qt_data$data$ped_filename)
  file.remove(phe_filename)
  for (qassoc_filename in qassoc_filenames) file.remove(qassoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(
    dirname(assoc_qt_params$base_input_filename),
    recursive = TRUE
  )
  unlink(
    dirname(assoc_qt_params$base_output_filename),
    recursive = TRUE
  )
  assoc_qt_result <- list(
    qassoc_table = qassoc_table,
    log = log
  )
  plinkr::check_assoc_qt_result(assoc_qt_result)
  assoc_qt_result
}
