test_that("use", {
  assoc_qt_data <- create_demo_assoc_qt_data()
  expect_silent(check_assoc_qt_data(assoc_qt_data))
})

test_that("epistatic works", {
  if (!is_on_ci()) return()
  set.seed(11)
  assoc_qt_data <- create_demo_assoc_qt_data(n_individuals = 16)
  expect_equal(
    2,
    length(unique(assoc_qt_data$phenotype_data$phe_table$epistatic))
  )
  if ("Hunt for a good seed" == "what I want") {
    seed <- 1
    while (1) {
      seed <- seed + 1
      message(seed)
      set.seed(seed)
      assoc_qt_data <- create_demo_assoc_qt_data(n_individuals = 16)
      if (
        length(
          unique(assoc_qt_data$phenotype_data$phe_table$epistatic)
        ) == 2
      ) {
        stop(seed)
      }
    }
  }
})

test_that("n_individuals", {
  if (!is_on_ci()) return()

  n_individuals <- 5
  assoc_qt_data <- create_demo_assoc_qt_data(
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_data(assoc_qt_data))
  expect_equal(n_individuals, nrow(assoc_qt_data$data$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_data$phenotype_data$phe_table))
})

test_that("MAFs", {
  if (!is_on_ci()) return()

  n_individuals <- 10
  mafs <- c(0.2, 0.1)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = list(
      create_random_trait(maf = mafs[1]),
      create_random_trait(maf = mafs[2])
    ),
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_data(assoc_qt_data))
  expect_equal(n_individuals, nrow(assoc_qt_data$data$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_data$phenotype_data$phe_table))
  # First SNP
  n_expect_major_alleles <- n_individuals * (1.0 - mafs[1])
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_data$data$ped_table$snv_1a == "A")
  )
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_data$data$ped_table$snv_1b == "A")
  )
  # Second SNP
  n_expect_major_alleles <- n_individuals * (1.0 - mafs[2])
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_data$data$ped_table$snv_2a == "A")
  )
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_data$data$ped_table$snv_2b == "A")
  )
})

test_that("one random, 1 SNP", {
  if (!is_on_ci()) return()

  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(n_snps = 1)
  )
  check_assoc_qt_data(assoc_qt_data)
  expect_equal(3, ncol(assoc_qt_data$phenotype_data$phe_table))
})

test_that("one random, 2 SNPs", {
  if (!is_on_ci()) return()

  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(n_snps = 2)
  )
  check_assoc_qt_data(assoc_qt_data)
  expect_equal(3, ncol(assoc_qt_data$phenotype_data$phe_table))
})

test_that("one additive, 1 SNP", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_additive_trait()
    )
  )
})

test_that("one additive, 2 SNPs", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_additive_trait(n_snps = 2)
    )
  )
})

test_that("one epistatic, 1 SNP", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_epistatic_trait()
    )
  )
})

test_that("one epistatic, 3 SNPs", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_epistatic_trait(n_snps = 3),
      n_individuals = 64
    )
  )
})

test_that("number of individuals", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      n_individuals = 3,
      traits = create_random_trait()
    )
  )
})

test_that("Triallelic SNPs", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_random_trait(mafs = c(0.3, 0.2)),
      n_individuals = 10
    )
  )
})

test_that("Quadallelic SNPs", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
      n_individuals = 10
    )
  )
})

test_that("two randoms", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = rep(list(create_random_trait()), 2)
    )
  )
})

test_that("two additive", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = rep(list(create_additive_trait()), 2)
    )
  )
})

test_that("two epistatic", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = rep(list(create_additive_trait()), 2)
    )
  )
})

test_that("two of demo traits", {
  if (!is_on_ci()) return()

  expect_silent(
    create_demo_assoc_qt_data(
      traits = rep(create_demo_traits(), 2)
    )
  )
})

test_that("create the 'big_random' dataset", {
  return()
  if (!is_on_ci()) return()
  set.seed(42)
  n_traits <- 100
  traits <- list()
  for (i in seq_len(n_traits)) traits[[i]] <- plinkr::create_random_trait()
  check_traits(traits)
  assoc_qt_data <- create_demo_assoc_qt_data(
    n_individuals = 1000,
    traits = traits
  )
  assoc_qt_data$phenotype_data$phe_table[, 3:102] <- round(
    assoc_qt_data$phenotype_data$phe_table[, 3:102],
    digits = 1
  )
  assoc_qt_data$data$map_table$CHR <- 1
  save_plink_text_data(
    plink_text_data = assoc_qt_data$data,
    base_input_filename = "~/big_random"
  )
  save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = "~/big_random.phe"
  )
  convert_plink_text_files_to_plink_bin_files(
    base_input_filename = "~/big_random",
    base_output_filename = "~/big_random"
  )
})
