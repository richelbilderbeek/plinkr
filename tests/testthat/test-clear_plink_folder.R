test_that("use", {
  plink_folder <- get_plinkr_tempfilename()
  dir.create(plink_folder, showWarnings = FALSE, recursive = TRUE)
  readr::write_lines("something", file = file.path(plink_folder, "some.file"))
  expect_true(length(list.dirs(plink_folder)) > 0)
  expect_true(length(list.files(plink_folder)) > 0)
  clear_plink_folder(plink_folder = plink_folder)
  expect_equal(0, length(list.dirs(plink_folder)))
  expect_equal(0, length(list.files(plink_folder)))
  unlink(plink_folder, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
})
