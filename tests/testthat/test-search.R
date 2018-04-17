context("test-search.R")

test_that("multiplication works", {

  x <- rfg_search_restrooms("toronto")
  expect_true(tibble::is.tibble(x))

})
