test_that("use", {
  expect_silent(create_runif_trait())
  expect_silent(create_runif_trait(mafs = 0.01))
  expect_silent(create_runif_trait(mafs = c(0.3, 0.2, 0.1)))
  expect_silent(create_runif_trait(n_snps = 2))
})
