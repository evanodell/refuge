context("test-all-restrooms.R")

test_that("all restrooms works", {
  skip_on_cran() # takes a long time and is fine to test locally
  skip_on_ci()

  all <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
  expect_true(tibble::is_tibble(all))
})
