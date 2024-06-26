test_that("use", {
  expect_silent(check_ped_table(get_test_ped_table()))
  expect_silent(check_ped_table(ped_table = create_demo_ped_table()))
  expect_error(check_ped_table("nonsense"))
})

test_that("evil: add column", {
  ped_table <- get_test_ped_table()
  ped_table$snv_2c <- ped_table$snv_2b
  expect_error(check_ped_table(ped_table))
})
