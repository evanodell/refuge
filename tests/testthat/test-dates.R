context("test-dates.R")

test_that("dates works", {
  skip_on_cran()
  skip_on_ci()

  d <- rfg_date(
    date = "2018-11-25", unisex = TRUE,
    accessible = TRUE, updated = FALSE
  )
  expect_true(tibble::is_tibble(d))
})
