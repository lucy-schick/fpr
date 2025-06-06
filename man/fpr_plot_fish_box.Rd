% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{fpr_plot_fish_box}
\alias{fpr_plot_fish_box}
\title{Generate boxplot for individual site showing densities of fish captured from electrofishing}
\usage{
fpr_plot_fish_box(dat = fish_abund, sit = my_site, theme = ggplot2::theme_bw())
}
\arguments{
\item{dat}{Dataframe. Defaults to fish_abund.  Must contian the columns site, species_code,
life_stage, density_100m2}

\item{sit}{Integer. ID for the site. Defaults to my_site.}

\item{theme}{Function. Theme used for the plot. Defaults to `ggplot2::theme_bw()`.}
}
\value{
Boxplot
}
\description{
Generate boxplot for individual site showing densities of fish captured from electrofishing
}
