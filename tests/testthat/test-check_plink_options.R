test_that("use", {
  expect_silent(check_plink_options(create_plink_options()))
  expect_silent(check_plink_options(create_plink_v1_7_options()))
  expect_silent(check_plink_options(create_plink_v1_9_options()))
  expect_silent(check_plink_options(create_custom_plink_options("mypath")))
  expect_error(check_plink_options("nonsense"))
  expect_error(check_plink_options(""))
  expect_error(check_plink_options(c()))
  expect_error(check_plink_options(NA))
  expect_error(check_plink_options(NULL))
  expect_error(check_plink_options(Inf))
  expect_error(check_plink_options(42))
  expect_error(check_plink_options(3.14))
})
