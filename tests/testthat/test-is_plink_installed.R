test_that("use", {
  expect_silent(is_plink_installed())
})

test_that("not installed in absent folder", {
  expect_false(
    is_plink_installed(
      create_custom_plink_options(
        plink_exe_path = "absent"
      )
    )
  )
})
