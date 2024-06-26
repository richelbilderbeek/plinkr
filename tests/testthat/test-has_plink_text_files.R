test_that("use", {

  expect_true(
    has_plink_text_files(
      tools::file_path_sans_ext(
        get_plinkr_filename("test_v1_7.map")
      )
    )
  )
  expect_false(
    has_plink_text_files(
      tools::file_path_sans_ext(
        get_plinkr_filename("test_v1_7_after_make-bed.bed")
      )
    )
  )
  expect_false(
    has_plink_text_files(
      base_input_filename = tools::file_path_sans_ext(
        get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
      )
    )
  )

})
