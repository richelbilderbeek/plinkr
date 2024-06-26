#' Save `PLINK` text data to files.
#'
#' Save `PLINK` text data to files.
#' @inheritParams default_params_doc
#' @return the full paths to the `.bed`, `.bim` and `.fam` files created
#' @seealso to save `PLINK`/`PLINK2` data use:
#'
#'  * \link{save_plink_text_data}: to save `PLINK` text data
#'  * \link{save_plink_bin_data}: to save `PLINK` binary data
#'  * \link{save_plink2_bin_data}: to save `PLINK2` binary data
#'
#' @examples
#' #
#' # Example 1: using plinkr::create_test_plink_text_data
#' #
#'
#' # Folder and base filename to save to
#' base_input_filename <- file.path(
#'   get_plinkr_tempfilename(),
#'   "save_plink_text_data"
#' )
#'
#' # Create PLINK text data
#' plink_text_data <- create_test_plink_text_data()
#'
#' # Save. Convenient: filenames are returned!
#' plink_text_filenames <- save_plink_text_data(
#'   plink_text_data = plink_text_data,
#'   base_input_filename = base_input_filename
#' )
#'
#' # Cleanup
#' file.remove(plink_text_filenames$map_filename)
#' file.remove(plink_text_filenames$ped_filename)
#' unlink(dirname(base_input_filename), recursive = TRUE)
#'
#' #
#' # Example 2: using plinkr::create_demo_assoc_qt_data
#' #
#'
#' # Folder and base filename to save to
#' base_input_filename <- file.path(
#'   get_plinkr_tempfilename(),
#'   "save_plink_text_with_demo_assoc_qt_data"
#' )
#'
#' # Create PLINK text data
#' assoc_qt_data <- create_demo_assoc_qt_data()
#'
#' # Save. Convenient: filenames are returned!
#' plink_text_filenames <- save_plink_text_data(
#'   plink_text_data = create_test_plink_text_data(),
#'   base_input_filename = base_input_filename
#' )
#'
#' # Cleanup
#' file.remove(plink_text_filenames$map_filename)
#' file.remove(plink_text_filenames$ped_filename)
#' unlink(dirname(base_input_filename), recursive = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
save_plink_text_data <- function(
  plink_text_data,
  base_input_filename = get_plinkr_tempfilename(),
  verbose = FALSE
) {
  plinkr::check_plink_text_data(plink_text_data)
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_verbose(verbose)
  map_filename <- paste0(base_input_filename, ".map")
  ped_filename <- paste0(base_input_filename, ".ped")
  plinkr::save_map_table(
    map_table = plink_text_data$map_table,
    map_filename = map_filename
  )
  plinkr::save_ped_table(
    ped_table = plink_text_data$ped_table,
    ped_filename = ped_filename
  )
  if (1 == 1) {
    # Double-check if the files can be read
    plinkr::check_map_table(plinkr::read_plink_map_file(map_filename))
    plinkr::check_ped_table(plinkr::read_plink_ped_file(ped_filename))
  }
  plinkr::create_plink_text_filenames(
    map_filename = map_filename,
    ped_filename = ped_filename
  )
}
