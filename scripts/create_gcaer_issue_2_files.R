# Needed for https://github.com/richelbilderbeek/gcaer/issues/2
#
# Output must be in PLINK binary format
#
base_input_filename <- "~/gcaer_issue_2_bin"
phe_filename <- paste0(base_input_filename, ".phe")

# Simulate data in PLINK1 text format
set.seed(42)
assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
  n_individuals = 10,
  traits = plinkr::create_demo_traits()
)

# Convert PLINK1 text format to PLINK1 binary format
assoc_qt_data$data <- plinkr::convert_plink_text_data_to_plink_bin_data(
  assoc_qt_data$data
)

plinkr::save_plink_bin_data(
  plink_bin_data = assoc_qt_data$data,
  base_input_filename = base_input_filename
)
plinkr::save_phe_table(
  phe_table = assoc_qt_data$phenotype_data$phe_table,
  phe_filename = phe_filename
)
