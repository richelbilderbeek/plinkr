test_that("minimal use, v1.7", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  expect_silent(
    plink_assoc(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_7_options()
    )
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("minimal use, v1.9", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_silent(
    plink_assoc(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_9_options()
    )
  )
})

test_that("verbose", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_message(
    plink_assoc(assoc_params = create_test_assoc_params(), verbose = TRUE)
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("confidence interval", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_message(
    plink_assoc(create_test_assoc_params(), verbose = TRUE),
    "--ci"
  )
})

test_that("use, test", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_test_assoc_params()
  assoc_result <- plink_assoc(assoc_params = assoc_params)
  expect_true("assoc_table" %in% names(assoc_result))
  expect_true("log" %in% names(assoc_result))
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, demo", {
  if (!is_plink_installed()) return()
  set.seed(317)
  assoc_params <- create_demo_assoc_params()
  assoc_results <- assoc(assoc_params = assoc_params)
  # 1 traits times 1 SNP = 1 association
  expect_equal(1, nrow(assoc_results$assoc_table))
})

test_that("demo on random only", {
  if (!is_plink_installed()) return()
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait()
  )
  assoc_results <- plink_assoc(assoc_params = assoc_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_results$assoc_table), 1)
})

test_that("number of individuals", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    n_individuals = 5,
    trait = create_random_case_control_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_results$assoc_table))
  expect_silent(check_empty_plinkr_folder())
})

test_that("error when case-controls are not 1 or 2", {
  if (!is_plink_installed()) return()
  assoc_params <- create_test_assoc_params()
  n_individuals <- nrow(assoc_params$data$ped_table)
  assoc_params$data$ped_table$case_control_code <- 314
  expect_error(
    plink_assoc(
      assoc_params = assoc_params,
      verbose = TRUE
    )
  )
})

test_that("PLINK cannot handle triallelic SNPs", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(mafs = c(0.3, 0.2)),
    n_individuals = 10
  )
  expect_warning(
    plink_assoc(
      assoc_params = assoc_params
    ),
    "Variant 1 triallelic; setting rarest alleles missing."
  )
})

test_that("PLINK cannot handle quadallelic SNPs", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  expect_warning(
    plink_assoc(
      assoc_params = assoc_params
    ),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
})

test_that("All 95 chromosome numbers work", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()
  # Upper limit set by PLINK is 95
  # https://github.com/chrchang/plink-ng/issues/182
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(n_snps = 95),
    n_individuals = 10
  )
  plink_assoc(assoc_params = assoc_params)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})