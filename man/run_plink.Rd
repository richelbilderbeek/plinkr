% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_plink.R
\name{run_plink}
\alias{run_plink}
\title{Run PLINK from arguments}
\usage{
run_plink(args, plink_options = create_plink_options(), verbose = FALSE)
}
\arguments{
\item{args}{arguments for the \code{PLINK} or \code{PLINK2} executable.
Use \link{check_plink_args} to check if these are valid}

\item{plink_options}{options to run PLINK,
as created by \link{create_plink_options}}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link{check_verbose} to detect if this argument is valid.}
}
\value{
the text that PLINK returns
}
\description{
Run PLINK from arguments
}
\examples{
# Minimal example: show the PLINK help
if (is_plink_installed(create_plink_v1_7_options())) {
  # Without '--noweb', plinkr freezes with PLINK v1.7
  run_plink(
    args = c("--help", "--noweb"),
    create_plink_v1_7_options()
  )
}

if (is_plink_installed(create_plink_v1_9_options())) {
  run_plink("--help", create_plink_v1_9_options())
}

if (is_plink_installed(create_plink_v2_0_options())) {
  run_plink("--help", create_plink_v2_0_options())
}

# Do a case-control association
# Note: using 'plinkr::assoc' is safer, easier and has a uniform
# interface accross PLINK versions
plink_options <- create_plink_v1_9_options()
if (is_plink_installed(plink_options)) {

  # Use the PLINK v1.9 example files
  ped_filename <- get_plink_example_filename(
    "toy.ped", plink_options
 )
  map_filename <- get_plink_example_filename(
    "toy.map", plink_options
  )

  run_plink(
    args = c(
     "--ped", ped_filename,
     "--map", map_filename
    ),
    plink_options
  )

  # Delete the created files
  file.remove("plink.bed")
  file.remove("plink.fam")
  file.remove("plink.log")
}
}
\author{
Richèl J.C. Bilderbeek
}
