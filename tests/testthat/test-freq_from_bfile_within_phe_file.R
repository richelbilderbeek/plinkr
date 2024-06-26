test_that("use", {
  if (!is_plink_installed()) return()
  if (!is_plink_tutorial_data_installed()) return()

  # Work in a temporary folder
  plinkr_folder <- get_plinkr_tempfilename()

  # Convert to bfile
  tutorial_data_filenames <- get_plink_tutorial_data_filenames()
  hapmap1_map_filename <- stringr::str_subset(
    tutorial_data_filenames, "hapmap1.map"
  )
  phe_filename <- stringr::str_subset(
    tutorial_data_filenames, "pop.phe"
  )

  hapmap1_base_filename <- tools::file_path_sans_ext(hapmap1_map_filename)

  base_binary_filenames <- file.path(plinkr_folder, "hapmap1")
  base_miss_stat_filenames <- file.path(plinkr_folder, "miss_stat")

  binary_filenames <- make_bed(
    base_input_filename = hapmap1_base_filename,
    base_output_filename = base_binary_filenames
  )

  freq_within_result <- freq_from_bfile_within_phe_file(
    bfile = base_binary_filenames,
    phe_filename = phe_filename,
    out = base_miss_stat_filenames
  )

  expect_true("frq_strat_table" %in% names(freq_within_result))
  expect_true("log" %in% names(freq_within_result))
  list.files(dirname(base_miss_stat_filenames), full.names = TRUE)
  unlink(plinkr_folder, recursive = TRUE)
  check_empty_plinkr_folder()
})
