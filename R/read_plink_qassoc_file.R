#' Read a PLINK \code{.qassoc} file
#' @inheritParams default_params_doc
#' @return a tibble
#' @examples
#' read_plink_qassoc_file(
#'   qassoc_filename = get_plinkr_filename("run1.qassoc")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_qassoc_file <- function(
  qassoc_filename
) {
  if (!file.exists(qassoc_filename)) {
    stop(".qassoc file with path '", qassoc_filename, "' not found")
  }
  text_lines_raw <- readr::read_lines(
    qassoc_filename
  )
  # There is whitespace at start and end
  text_lines <- stringr::str_trim(text_lines_raw)

  # Remove empty lines (added by PLINK v1.7)
  text_lines <- text_lines[text_lines != ""]

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )

  if (nrow(text_matrix) > 2) {
    t <- tibble::as_tibble(
      text_matrix[-1, ],
      .name_repair = "minimal"
    )
  } else {
    testthat::expect_equal(2, nrow(text_matrix))
    # else, tibble will create a 1-column table
    t <- tibble::as_tibble_row(
      text_matrix[-1, ],
      .name_repair = "minimal"
    )
  }
  names(t) <- text_matrix[1, ]
  # The suppressWarnings are there when values can be NA
  t$CHR <- as.numeric(t$CHR) # nolint PLINK coding style
  t$BP <- as.numeric(t$BP) # nolint PLINK coding style
  t$NMISS <- as.numeric(t$NMISS) # nolint PLINK coding style
  t$BETA <- suppressWarnings(as.numeric(t$BETA)) # nolint PLINK coding style
  t$SE <- suppressWarnings(as.numeric(t$SE)) # nolint PLINK coding style
  t$R2 <- suppressWarnings(as.numeric(t$R2)) # nolint PLINK coding style
  t$T <- suppressWarnings(as.numeric(t$T)) # nolint PLINK coding style
  t$P <- suppressWarnings(as.numeric(t$P)) # nolint PLINK coding style
  t
}
