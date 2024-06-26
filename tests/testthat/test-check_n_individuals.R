test_that("use", {
  expect_silent(check_n_individuals(2))
  expect_silent(check_n_individuals(314))
  expect_error(check_n_individuals(1)) # Need 2 for any association
  expect_error(check_n_individuals(0))
  expect_error(check_n_individuals(-123))
  expect_error(check_n_individuals(3.14))
  expect_error(check_n_individuals(Inf))
  expect_error(check_n_individuals(NA))
  expect_error(check_n_individuals(NULL))
  expect_error(check_n_individuals(c()))
  expect_error(check_n_individuals("nonsense"))
  expect_error(check_n_individuals(c(1, 2)))
})
