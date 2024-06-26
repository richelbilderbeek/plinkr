% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_on_ci.R
\name{is_on_github_actions}
\alias{is_on_github_actions}
\title{Determines if the environment is GitHub Actions}
\usage{
is_on_github_actions()
}
\value{
\link{TRUE} if run on GitHub Actions, \link{FALSE} otherwise
}
\description{
Determines if the environment is GitHub Actions
}
\note{
It is possible to fake being on GitHub Actions, using:\if{html}{\out{<div class="sourceCode r">}}\preformatted{Sys.setenv(GITHUB_ACTIONS = "I fake being on GitHub Actions")
is_on_github_actions() # Will be true
}\if{html}{\out{</div>}}

To undo this, do\if{html}{\out{<div class="sourceCode r">}}\preformatted{Sys.setenv(GITHUB_ACTIONS = "")
is_on_github_actions() # Will be false
}\if{html}{\out{</div>}}
}
\examples{
if (is_on_github_actions()) {
  message("Running on GitHub Actions")
}
}
\author{
Richèl J.C. Bilderbeek
}
