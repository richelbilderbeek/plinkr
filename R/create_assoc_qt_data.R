#' Create the data needed for the \link{assoc_qt} function
#'
#' Create the data needed (in this case, 'regular' data and phenotype
#' data) to detect associations with quantitative traits,
#' as used by \link{assoc_qt}.
#' @inheritParams default_params_doc
#' @return an `assoc_qt_data` structure
#' @examples
#' create_assoc_qt_data(
#'   data = create_test_plink_text_data(),
#'   phenotype_data = create_test_phenotype_data_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_data <- function(
  data,
  phenotype_data
) {
  plinkr::check_data(data = data)
  plinkr::check_phenotype_data(phenotype_data)
  list(
    data = data,
    phenotype_data = phenotype_data
  )
}
