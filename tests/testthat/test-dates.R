context("test-dates.R")

test_that("dates works", {
  d <- rfg_date(date="2017-11-04")
  expect_true(tibble::is.tibble(d))
})
