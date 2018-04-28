context("test-location.R")

test_that("location works", {
  c <- rfg_location(lat = 39, lng = -75, accessible = TRUE, tidy = TRUE)
  expect_true(tibble::is.tibble(c))
  expect_true("NJ" %in% c$state)
  expect_length(c, 19)

  expect_error(
    rfg_location(lat = 90, lng = 0),
    "No restrooms available with given search parameters."
  )

  expect_error(
    rfg_location(),
    "Values for the `lat` and `lng` parameters must be included."
  )
})
