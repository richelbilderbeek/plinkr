test_that("use", {
  if (!is_plink_installed()) return()

  base_output_filename <- file.path(
    plinkr::get_plinkr_tempfilename(),
    "base_output_filename"
  )
  plink_text_filenames <- convert_plink2_bin_files_to_plink_text_files(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
    ),
    base_output_filename = base_output_filename
  )
  # Cannot be silent, as it produces output
  plinkr::read_plink_map_file(
    map_filename = plink_text_filenames$map_filename
  )
  # Cannot be silent, as it produces output
  plinkr::read_plink_ped_file(
    ped_filename = plink_text_filenames$ped_filename
  )
})
