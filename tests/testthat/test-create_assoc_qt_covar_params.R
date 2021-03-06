test_that("use", {
  ped_table <- get_test_ped_table()
  map_table <- get_test_map_table()
  phe_table <- create_phe_table_from_ped_table(
    ped_table = ped_table
  )
  phe_table$phenotype_value <- 0.1 * seq_len(nrow(phe_table))
  cov_table <- create_cov_table_from_ped_table(
    ped_table = ped_table
  )

  expect_silent(
    create_assoc_qt_covar_data(
      data = create_plink_text_data(
        ped_table = ped_table,
        map_table = map_table
      ),
      phenotype_data = create_phenotype_data_table(phe_table = phe_table),
      cov_table = cov_table
    )
  )
})
