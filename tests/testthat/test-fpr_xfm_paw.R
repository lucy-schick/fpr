# path <- system.file("extdata", "pscis_phase1.xlsm", package = "fpr")


paths <- c(
  "~/Projects/repo/fpr/inst/extdata/pscis_phase1.xlsm",
  "~/Projects/repo/fpr/inst/extdata/pscis_phase1_peace_2023.xlsm",
  "~/Projects/repo/fpr/inst/extdata/pscis_phase1_skeena_2021.xlsm",
  "~/Projects/repo/fpr/inst/extdata/pscis_phase2_skeena_2021.xlsm"
)

xl_raw <- paths |>
  purrr::map(
    ~ fpr::fpr_import_pscis(
      dir_root = fs::path_dir(.x)
    ) |>
      dplyr::mutate(filename = basename(.x)) # Add a source column with file name
  ) |>
  dplyr::bind_rows()

test_that("fpr_xfm_paw_score_cv_len calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_cv_len(col_culvert_length_score = "culvert_length_score_fpr") |>
    dplyr::mutate(
      chk_score = culvert_length_score_fpr - culvert_length_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})


test_that("fpr_xfm_paw_swr throws an error for missing required columns", {
  dat_no_col <- xl_raw |>
    dplyr::select(-diameter_or_span_meters)
  # Expect error if required columns are missing
  expect_error(
    fpr_xfm_paw_swr(dat_no_col),
    "The following required columns are missing from the dataframe: diameter_or_span_meters"
  )
})


test_that("fpr_xfm_paw_swr calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_swr(col_stream_width_ratio = "stream_width_ratio_fpr") |>
    dplyr::mutate(
      chk_score = stream_width_ratio_fpr - stream_width_ratio
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_score_embed calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_embed(col_embed_score = "embed_score_fpr") |>
    dplyr::mutate(
      chk_score = embed_score_fpr - embed_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_score_outlet_drop calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_outlet_drop(col_outlet_drop_score = outlet_drop_score_fpr) |>
    dplyr::mutate(
      chk_score = outlet_drop_score_fpr - outlet_drop_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_score_cv_slope calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_cv_slope(col_culvert_slope_score = culvert_slope_score_fpr) |>
    dplyr::mutate(
      chk_score = culvert_slope_score_fpr - culvert_slope_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_score_swr calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_swr(col_stream_width_ratio_score = stream_width_ratio_score_fpr) |>
    dplyr::mutate(
      chk_score = stream_width_ratio_score_fpr - stream_width_ratio_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_score_final calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_score_final(col_final_score = final_score_fpr) |>
    dplyr::mutate(
      chk_score = final_score_fpr - final_score
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == 0))
})

test_that("fpr_xfm_paw_barrier_result calculates correctly", {
  result <- xl_raw |>
    fpr_xfm_paw_barrier_result(col_barrier_result = barrier_result_fpr) |>
    dplyr::mutate(
      chk_score = barrier_result_fpr == barrier_result
    )
  # Check if all calculated values match expected `swr`
  expect_true(all(result$chk_score == TRUE))
})

test_that("fpr_xfm_paw_all_scores_result calculates stream_width_ratio columns correctly", {
  result <- xl_raw |>
    dplyr::select(-dplyr::contains(c("score", "barrier", "stream_width_ratio"))) |>
    fpr_xfm_paw_all_scores_result()
  # Check if all calculated values match expected `swr`
  expect_equal(sort(names(xl_raw)), sort(names(result)))
})

test_that("fpr_xfm_paw_all_scores_result maintains values for removed columns", {
  # Remove columns from original data and apply transformation
  result <- xl_raw |>
    dplyr::select(-dplyr::contains(c("score", "barrier", "stream_width_ratio"))) |>
    fpr_xfm_paw_all_scores_result()

  # Extract columns of interest from both original and result
  original_cols <- xl_raw |>
    dplyr::select(dplyr::contains(c("score", "barrier", "stream_width_ratio")))

  result_cols <- result |>
    dplyr::select(dplyr::contains(c("score", "barrier", "stream_width_ratio")))

  # Check if the column values are identical
  expect_equal(original_cols, result_cols)
})

