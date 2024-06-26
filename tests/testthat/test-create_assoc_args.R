test_that("minimal use", {

  clear_plinkr_cache()

  expect_silent(
    create_assoc_args(
      assoc_data = create_test_assoc_data(),
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_7_options()
    )
  )
  expect_silent(
    create_assoc_args(
      assoc_data = create_test_assoc_data(),
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_9_options()
    )
  )
  expect_silent(
    create_assoc_args(
      assoc_data = create_test_assoc_data(
        data = create_test_plink2_bin_data()
      ),
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v2_0_options()
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("v1.7", {

  clear_plinkr_cache()

  assoc_params <- create_test_assoc_params()
  created <- create_assoc_args(
    assoc_data = create_test_assoc_data(),
    assoc_params = assoc_params,
    plink_options = create_plink_v1_7_options()
  )
  expected <- c(
    "--map", paste0(assoc_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_params$base_input_filename, ".ped"),
    "--assoc",
    "--maf", assoc_params$maf,
    "--out", assoc_params$base_output_filename,
    "--noweb"
  )
  expect_equal(created, expected)

  # This does an association
  expect_true("--assoc" %in% created)

  # PLINK v1.7 does not support these
  expect_false("--allow-extra-chr" %in% created)
  expect_false("--chr-set" %in% created)

  expect_silent(check_empty_plinkr_folder())
})

test_that("v1.9, allow 95 chromosome", {

  clear_plinkr_cache()

  assoc_params <- create_test_assoc_params()
  created <- create_assoc_args(
    assoc_data = create_test_assoc_data(),
    assoc_params = assoc_params,
    plink_options = create_plink_v1_9_options()
  )
  expected <- c(
    "--map", paste0(assoc_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_params$base_input_filename, ".ped"),
    "--assoc",
    "--chr-set", 95,
    "--maf", assoc_params$maf,
    "--out", assoc_params$base_output_filename
  )
  expect_equal(created, expected)

  # This does an association
  expect_true("--assoc" %in% created)

  # PLINK v1.9 does not support these
  expect_false("--noweb" %in% created)

  expect_silent(check_empty_plinkr_folder())
})

test_that("v2.0", {
  args <- create_assoc_args(
    assoc_data = create_test_assoc_data(
      data = create_test_plink2_bin_filenames()
    ),
    assoc_params = create_test_assoc_params(),
    plink_options = create_plink_v2_0_options()
  )
  # No idea yet
  expect_true("--glm" %in% args)

  # PLINK v2.0 does not support this
  expect_false("--assoc" %in% args)
  expect_false("--noweb" %in% args)
  expect_silent(check_empty_plinkr_folder())
})
