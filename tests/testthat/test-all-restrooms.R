context("test-all-restrooms.R")

test_that("all restrooms works", {
  skip_on_cran()
  all <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
})
