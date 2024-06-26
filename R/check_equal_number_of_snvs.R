#' Internal function
#'
#' Check if the data has the same number of
#' SNVs in its tables.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @examples
#' check_equal_number_of_snvs(create_test_plink_text_data())
#' check_equal_number_of_snvs(create_test_plink_bin_data())
#' check_equal_number_of_snvs(create_test_plink2_bin_data())
#' @author Richèl J.C. Bilderbeek
#' @export
check_equal_number_of_snvs <- function(
  data
) {
  # Do not use 'check_data' as this results in recursion
  # plinkr::check_data(data) # nolint indeed, that code :-)

  # Do not use 'is_plink_text_data' or the others,
  # as this results in recursion:
  # testthat::expect_true(plinkr::is_plink_text_data(data) || plinkr::is_plink_bin_data(data) || plinkr::is_plink2_bin_data(data)) # nolint never run this code!
  if ("ped_table" %in% names(data)) {
    testthat::expect_true("map_table" %in% names(data))
    n_snvs_in_ped_table <- plinkr::get_n_snps_from_ped_table(data$ped_table)
    n_snvs_in_map_table <- plinkr::get_n_snps_from_map_table(data$map_table)
    if (n_snvs_in_ped_table != n_snvs_in_map_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.map) table \n",
        "and the pedigree (.tab) table \n",
        "Number of SNVs in genetic mapping (.map) table: ",
        n_snvs_in_map_table, " \n",
        "Number of SNVs in pedigree (.ped) table: ", n_snvs_in_ped_table
      )
    }
  } else if ("bed_table" %in% names(data)) {
    testthat::expect_true("bim_table" %in% names(data))
    n_snvs_in_bed_table <- plinkr::get_n_snps_from_bed_table(data$bed_table)
    n_snvs_in_bim_table <- plinkr::get_n_snps_from_bim_table(data$bim_table)
    if (n_snvs_in_bed_table != n_snvs_in_bim_table) {
      stop(
        "Different number of SNVs in the genotype (.bed) table \n",
        "and the genetic mapping (.bim) table \n",
        "Number of SNVs in genotype (.bed) table: ", n_snvs_in_bed_table, " \n",
        "Number of SNVs in genetic mapping (.bim) table: ",
        n_snvs_in_bim_table
      )
    }
  } else if ("pgen_table" %in% names(data)) {
    testthat::expect_true("pgen_table" %in% names(data))
    testthat::expect_true("pvar_table" %in% names(data))
    testthat::expect_true("psam_table" %in% names(data))
    n_snvs_in_pgen_table <- plinkr::get_n_snps_from_pgen_table(data$pgen_table)
    n_snvs_in_pvar_table <- plinkr::get_n_snps_from_pvar_table(data$pvar_table)
    if (n_snvs_in_pgen_table != n_snvs_in_pvar_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.pvar) table \n",
        "and the individuals' SNP mapping (.pgen) table \n",
        "Number of SNVs in genetic mapping (.pvar) table: ",
        n_snvs_in_pgen_table, " \n",
        "Number of SNVs in genotype (.pgen) table: ",
        n_snvs_in_pvar_table
      )
    }
  } else {
    testthat::expect_true("bed_filename" %in% names(data))
    testthat::expect_true("bim_filename" %in% names(data))
    testthat::expect_true("fam_filename" %in% names(data))
    bed_table <- read_plink_bed_file_from_files(
      bed_filename = data$bed_filename,
      bim_filename = data$bim_filename,
      fam_filename = data$fam_filename
    )
    bim_table <- plinkr::read_plink_bim_file(
      bim_filename = data$bim_filename
    )
    n_snvs_in_bed_table <- plinkr::get_n_snps_from_bed_table(bed_table)
    n_snvs_in_bim_table <- plinkr::get_n_snps_from_bim_table(bim_table)
    if (n_snvs_in_bed_table != n_snvs_in_bim_table) {
      stop(
        "Different number of SNVs in the genotype (.bed) table \n",
        "and the genetic mapping (.bim) table \n",
        ".bed filename: ", data$bed_filename, " \n",
        ".bim filename: ", data$bim_filename, " \n",
        ".fam filename: ", data$fam_filename, " \n",
        "Number of SNVs in genotype (.bed) table: ", n_snvs_in_bed_table, " \n",
        "Number of SNVs in genetic mapping (.bim) table: ",
        n_snvs_in_bim_table
      )
    }
  }

  invisible(data)
}
