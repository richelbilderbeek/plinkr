test_that("use", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  expect_silent(check_phe_table(phe_table))

  expect_error(check_phe_table(""))
  expect_error(check_phe_table(NA))
  expect_error(check_phe_table(NULL))
  expect_error(check_phe_table(Inf))
  expect_error(check_phe_table(3.14))
  expect_error(check_phe_table(42))
  expect_error(check_phe_table(c("random", "")))
})

test_that("use", {
  expect_silent(
    check_phe_table(
      create_demo_phe_table()
    )
  )
})

test_that("case-control values in first column is OK", {
  phe_table <- create_demo_phe_table()
  # All ones and twos
  phe_table$random <- 2
  phe_table$random[1] <- 1
  expect_silent(
    check_phe_table(
      phe_table
    )
  )
})
