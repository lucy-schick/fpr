% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fpr_tidy_assign_site_id.R
\name{fpr_tidy_assign_site_id}
\alias{fpr_tidy_assign_site_id}
\title{Function to process site ID value from pscis_crossing_id and my_crossing_reference}
\usage{
fpr_tidy_assign_site_id(dat = NULL)
}
\arguments{
\item{dat}{A dataframe to process. Default is NULL.}
}
\value{
A processed dataframe.
}
\description{
Intended for processing field data from digital form in which only one value should be provided.
It checks to confirm the dataframe has one and only one of either a `pscis_crossing_id` or a `my_crossing_reference`.
It also uses [fpr_chk_dupes()] to issue a warning if there are duplicate values of `pscis_crossing_id`,
`my_crossing_reference` or `site_id`
}
\examples{
\dontrun{
dat_pass <- tibble(
pscis_crossing_id = c(1, 2, NA, 4),
my_crossing_reference = c(NA, NA, 3, NA),
date_time_start = Sys.time() + 0:3
)

#' dat_warn_dupe <- tibble(
pscis_crossing_id = c(1, 3, NA, 4),
my_crossing_reference = c(NA, NA, 3, NA),
date_time_start = Sys.time() + 0:3
)

fpr_tidy_assign_site_id(dat_pass)
fpr_tidy_assign_site_id(dat_warn_dupe)
}
}
\concept{tidy}
