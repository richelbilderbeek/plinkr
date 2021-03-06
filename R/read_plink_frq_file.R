#' Read a PLINK \code{.frq} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{CHR} ?
#'   * \code{SNP} ?
#'   * \code{A1} ?
#'   * \code{A2} ?
#'   * \code{MAF} ?
#'   * \code{NCHROBS} ?
#'
#' These column names are the names used by \code{PLINK}.
#' @examples
#' frq_filename <- get_plinkr_filename("miss_stat.frq")
#' read_plink_frq_file(frq_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_frq_file <- function(frq_filename) {
  table <- stringr::str_split(
    string = stringr::str_trim(
      readr::read_lines(
        file = frq_filename,
        skip_empty_rows = TRUE
      )
    ),
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <- tibble::as_tibble(table[-1, ], .name_repair = "minimal")
  names(t) <- table[1, ]
  expected_names <- c(
    "CHR",
    "SNP",
    "A1",
    "A2",
    "MAF",
    "NCHROBS"
  )
  testthat::expect_equal(expected_names, names(t))

  t$CHR <- as.numeric(t$CHR) # nolint use PLINK notation
  t$A1 <- as.character(t$A1) # nolint use PLINK notation
  t$A2 <- as.character(t$A2) # nolint use PLINK notation
  t$MAF <- as.numeric(t$MAF) # nolint use PLINK notation
  t$NCHROBS <- as.numeric(t$NCHROBS) # nolint use PLINK notation
  t
}
