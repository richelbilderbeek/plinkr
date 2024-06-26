test_that("basic use", {
  expect_silent(check_plink_args(args = "--version"))

  expect_error(
    check_plink_args(args = c()),
    "'args' must have at least one element"
  )
})

test_that("v1.7 non-existing options", {
  expect_error(
    check_plink_args(
      args = c("--allow-extra-chr", "--noweb"),
      plink_options = create_plink_v1_7_options()
    ),
    "'args' invalid: '--allow-extra-chr' did not yet exist in PLINK v1.7"
  )
  expect_error(
    check_plink_args(
      args = c("--chr-set", "--noweb"),
      plink_options = create_plink_v1_7_options()
    ),
    "'args' invalid: '--chr-set' did not yet exist in PLINK v1.7"
  )
  expect_error(
    check_plink_args(
      args = c("--ci", "--noweb"),
      plink_options = create_plink_v1_7_options()
    ),
    "'args' invalid: '--ci' did not yet exist in PLINK v1.7"
  )
})

test_that("v1.9 non-existing options", {
  expect_error(
    check_plink_args(
      args = c("--ci"),
      plink_options = create_plink_v1_9_options()
    ),
    "'args' invalid: '--ci' did not yet exist in PLINK v1.9"
  )
})

test_that("--noweb", {
  # In PLINK v1.7 --noweb is vital, as plinkr will freeze otherwise
  # In PLINK v1.9 and PLINK2 v2.0 --noweb is not longer used
  expect_error(
    check_plink_args(
      args = "--version",
      plink_options = create_plink_v1_7_options()
    ),
    "'args' must have '--noweb' for PLINK version 1.7"
  )

  expect_error(
    check_plink_args(
      args = c("--version", "--noweb"),
      plink_options = create_plink_v1_9_options()
    ),
    "'args' must not have '--noweb' for PLINK version above v1.7"
  )
  expect_error(
    check_plink_args(
      args = c("--version", "--noweb"),
      plink_options = create_plink_v2_0_options()
    ),
    "'args' must not have '--noweb' for PLINK version above v1.7"
  )
})

test_that("detect invalid combinations of commands", {
  clear_plinkr_cache()
  # From https://zzz.bwh.harvard.edu/plink/data.shtml#covar
  #
  # Not all commands accept covariates, and PLINK will not always give you
  # an error or warning. The basic association (--assoc, --mh, --model, --tdt,
  # --dfam, and --qfam) do not accept covariates, neither do the basic
  # haplotype association methods (--hap-assoc, --hap-tdt).
  expect_error(
    check_plink_args(args = c("--assoc", "--covar")),
    "'--assoc' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--mh", "--covar")),
    "'--mh' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--model", "--covar")),
    "'--model' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--tdt", "--covar")),
    "'--tdt' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--dfam", "--covar")),
    "'--dfam' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--qfam", "--covar")),
    "'--qfam' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--hap-assoc", "--covar")),
    "'--hap-assoc' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--hap-tdt", "--covar")),
    "'--hap-tdt' does not accept covariates"
  )
  expect_silent(check_empty_plinkr_folder())
})
