test_that("minimal use", {
  expect_silent(create_demo_phe_table_lhs())
})

test_that("correct size", {
  ped_table <- get_test_ped_table()
  phe_table_lhs <- create_demo_phe_table_lhs(ped_table)
  expect_equal(nrow(ped_table), nrow(phe_table_lhs))
  expect_equal(2, ncol(phe_table_lhs))
})
