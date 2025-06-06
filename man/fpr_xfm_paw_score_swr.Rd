% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fpr_xfm_paw_score_swr.R
\name{fpr_xfm_paw_score_swr}
\alias{fpr_xfm_paw_score_swr}
\title{Transform PSCIS Assessment Worksheet Data by Calculating Stream Width Ratio Score}
\usage{
fpr_xfm_paw_score_swr(
  dat,
  col_stream_width_ratio = stream_width_ratio,
  col_stream_width_ratio_score = stream_width_ratio_score,
  risk_low_value = 1,
  risk_high_value = 1.3,
  risk_low_score = 0,
  risk_mod_score = 3,
  risk_high_score = 6
)
}
\arguments{
\item{dat}{[dataframe] A dataframe containing the PSCIS data.}

\item{col_stream_width_ratio}{[character] A column name specifying the stream width ratio, as a string or tidy-select syntax. Default is `stream_width_ratio`.}

\item{col_stream_width_ratio_score}{[character] A column name for the output SWR score, as a string or tidy-select syntax. Default is `stream_width_ratio_score`.}

\item{risk_low_value}{[numeric] A numeric value representing the lower threshold for low stream width ratio risk. Default is `1`.}

\item{risk_high_value}{[numeric] A numeric value representing the threshold for high stream width ratio risk. Default is `1.3`.}

\item{risk_low_score}{[numeric] A numeric value representing the risk score for low SWR conditions. Default is `0`.}

\item{risk_mod_score}{[numeric] A numeric value representing the risk score for moderate SWR conditions. Default is `3`.}

\item{risk_high_score}{[numeric] A numeric value representing the risk score for high SWR conditions. Default is `6`.}
}
\value{
[dataframe] A dataframe with the specified column for SWR score added or updated.
}
\description{
This function calculates the stream width ratio (SWR) score for BC Provincial Stream Crossing Inventory System (PSCIS) data based on specified thresholds.
}
\examples{
dat <- data.frame(
  stream_width_ratio = c(0.8, 1.2, 1.4, NA)
)
fpr_xfm_paw_score_swr(
  dat
)

}
\seealso{
Other xfm paw: 
\code{\link{fpr_xfm_paw_all_scores_result}()},
\code{\link{fpr_xfm_paw_barrier_result}()},
\code{\link{fpr_xfm_paw_score_cv_len}()},
\code{\link{fpr_xfm_paw_score_cv_slope}()},
\code{\link{fpr_xfm_paw_score_embed}()},
\code{\link{fpr_xfm_paw_score_final}()},
\code{\link{fpr_xfm_paw_score_outlet_drop}()},
\code{\link{fpr_xfm_paw_swr}()}
}
\concept{xfm paw}
