context("test-dates.R")

test_that("dates works", {
  skip_on_cran()

  d <- rfg_date(date = "2017-11-04", unisex = TRUE)
  expect_true(tibble::is.tibble(d))
})
