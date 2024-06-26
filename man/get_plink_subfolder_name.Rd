% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_plink_subfolder_name.R
\name{get_plink_subfolder_name}
\alias{get_plink_subfolder_name}
\title{Get the path to the default \code{PLINK} subfolder as used by \link{plinkr}}
\usage{
get_plink_subfolder_name(
  plink_version = get_default_plink_version(),
  os = get_os()
)
}
\arguments{
\item{plink_version}{version of PLINK, e.g. \code{"1.7"}
Use \link{get_plink_version} to get the \code{PLINK} version.
Use \link{get_plink_versions} to get all the supported \code{PLINK} versions.}

\item{os}{name of the operating system,
as returned by \link[rappdirs]{app_dir}}
}
\value{
path to the default PLINK executable  as used by plinkr
}
\description{
Get the path to the default \code{PLINK} subfolder as used by \link{plinkr}.
}
\details{
\link{plinkr} installs all versions of \code{PLINK} in
a default \code{PLINK} folder,
as can be obtained by \link{get_plink_folder}.

In that \code{PLINK} folder, there are different subfolders for the
different version of \code{PLINK}.
The subfolders are named \code{plink_[version]_[os]},
where \code{[version]} denotes the \code{PLINK} version (where
the periods are replaced by underscores) and \code{[os]}
denotes the operating system, as obtained by \link{get_os}.
Examples are
\code{plink_1_7_unix}, \code{plink_1_9_mac} and \code{plink_2_0_win}.
}
\author{
Richèl J.C. Bilderbeek
}
