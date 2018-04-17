context("test-location.R")

test_that("location works", {
  c <- rfg_location(lat=39, lng=-75)
  expect_true(tibble::is.tibble(c))
  expect_true("NJ" %in% c$state)
  expect_length(c, 19)
})
