context("test-all-restrooms.R")

test_that("all restrooms works", {
  all <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
})
