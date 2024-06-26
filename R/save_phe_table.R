#' Save a \code{.phe} table to file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_phe_table <- function(
  phe_table,
  phe_filename
) {
  plinkr::check_phe_table(phe_table)
  plinkr::check_phe_filename(phe_filename)

  # A .phe file does not have a header
  text_matrix_header <- t(as.matrix(names(phe_table)))
  text_matrix_body <- as.matrix(phe_table)
  text_matrix <- rbind(text_matrix_header, text_matrix_body)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }

  dir.create(
    path = dirname(phe_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  tryCatch(
    suppressWarnings(
      readr::write_lines(x = text_vector, file = phe_filename)
    ),
    error = function(e) {
      stop(
        "Cannot save 'phe_table' to path '", phe_filename, "'. \n",
        "Maybe no permission to do so? \n",
        "Note that 'save_phe_table' will (try to) create ",
        "the (sub)folders needed. \n",
        "Error message: ", e$message
      )
    }
  )
  testthat::expect_true(file.exists(phe_filename))
}
