#' Read a \code{PLINK}/\code{PLINK2} \code{.bed} file
#' @inheritParams default_params_doc
#' @param names_loci see \link[genio]{read_bed}
#' @param names_ind see \link[genio]{read_bed}
#' @examples
#' bim <- read_plink_bim_file(get_plinkr_filename("demo_assoc.bim"))
#' fam <- read_plink_fam_file(get_plinkr_filename("demo_assoc.fam"))
#' read_plink_bed_file(
#'   bed_filename = get_plinkr_filename("demo_assoc.bed"),
#'   names_loci = bim$id,
#'   names_ind = fam$id
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_bed_file <- function(
  bed_filename,
  names_loci,
  names_ind,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(bed_filename))
  tryCatch({
    suppressWarnings(
      bed_table <- genio::read_bed(
        file = bed_filename,
        names_loci = names_loci,
        names_ind = names_ind,
        verbose = verbose
      )
    )
  }, error = function(e) {
    stop(
      "'genio::read_bed' failed", " \n",
      "bed_filename: ", bed_filename, " \n",
      "number of loci: ", length(names_loci), " \n",
      "number of samples/individuals: ", length(names_ind), " \n",
      "First loci names: ",
        paste0(utils::head(names_loci), collapse = ", "), " \n",
      "First sample/individual names: ",
      paste0(utils::head(names_ind), collapse = ", "), " \n",
      "genio error message: \n",
      e$msg
    )
  }

  )
  attributes(bed_table)$plinkr_datatype <- "bed_table"
  bed_table
}
