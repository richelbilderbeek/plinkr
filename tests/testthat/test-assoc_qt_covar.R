test_that("use", {
  expect_silent(check_empty_plinkr_folder())

  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_test_assoc_qt_covar_data()
  expect_silent(
    assoc_qt_covar(
      assoc_qt_covar_data = assoc_qt_covar_data
    )
  )
})

test_that("use", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_test_assoc_qt_covar_data()
  assoc_qt_covar_result <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  expect_true(tibble::is_tibble(assoc_qt_covar_result))
  expect_true("CHR" %in% names(assoc_qt_covar_result))
  expect_true("SNP" %in% names(assoc_qt_covar_result))
  expect_true("BP" %in% names(assoc_qt_covar_result))
  expect_true("NMISS" %in% names(assoc_qt_covar_result))
  expect_true("BETA" %in% names(assoc_qt_covar_result))
  expect_true("SE" %in% names(assoc_qt_covar_result))
  expect_true("R2" %in% names(assoc_qt_covar_result))
  expect_true("T" %in% names(assoc_qt_covar_result))
  expect_true("P" %in% names(assoc_qt_covar_result))
})

test_that("default demo", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data()
  assoc_qt_covar_results <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  # three traits times four SNPs = 12 association
  expect_equal(12, nrow(assoc_qt_covar_results))
})

test_that("demo on random only", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = create_random_trait()
  )
  assoc_qt_covar_results <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_covar_results), 1)
})

test_that("demo on two randoms", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_qt_covar_results <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  # 2 trait times 2 SNP = 4 association
  expect_equal(nrow(assoc_qt_covar_results), 4)
})

test_that("number of individuals", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    n_individuals = 3,
    traits = create_random_trait()
  )
  assoc_qt_covar_results <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_qt_covar_results))
})

test_that("demo on additive only", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = create_additive_trait()
  )
  assoc_qt_covar_results <- assoc_qt_covar(
    assoc_qt_covar_data = assoc_qt_covar_data
  )
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_covar_results), 1)
})

test_that("use quantitative traits that are either 1 or 2", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  assoc_qt_covar_data <- create_test_assoc_qt_covar_data()
  n_individuals <- nrow(assoc_qt_covar_data$phe_table)
  assoc_qt_covar_data$phe_table$case_control_code <- NULL
  assoc_qt_covar_data$phe_table$special_phenotype <- sample(
    c(1, 2), size = n_individuals, replace = TRUE)
  expect_error(
    assoc_qt_covar(
      assoc_qt_covar_data = assoc_qt_covar_data
    )
  )
})



test_that("PLINK cannot handle triallelic SNPs", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = create_random_trait(mafs = c(0.3, 0.2)),
    n_individuals = 10
  )
  expect_warning(
    assoc_qt_covar(
      assoc_qt_covar_data = assoc_qt_covar_data
    ),
    "Variant 1 triallelic; setting rarest alleles missing."
  )
})

test_that("PLINK cannot handle quadallelic SNPs", {
  skip("No covariates yet")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  expect_warning(
    assoc_qt_covar(
      assoc_qt_covar_data = assoc_qt_covar_data
    ),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
})

test_that("95 chromosome numbers work", {
  expect_silent(check_empty_plinkr_folder())

  skip("No covariates yet")
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data(
    traits = create_random_trait(n_snps = 95),
    n_individuals = 10
  )
  expect_silent(assoc_qt_covar(assoc_qt_covar_data = assoc_qt_covar_data))
  expect_silent(check_empty_plinkr_folder())
})
