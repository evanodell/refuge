

#' All refuge restrooms
#'
#' All listed refuge restrooms, ordered by date added or last updated, with
#' the most recent additions and updates at the top.
#'
#' @param accessible If \code{TRUE}, only returns restrooms that meet the
#' Americans with Disability Act standards for accessibility.
#' Defaults to \code{FALSE}.
#' @param unisex If \code{TRUE}, only returns unisex restrooms.
#' Defaults to \code{FALSE}.
#' @param verbose If \code{TRUE}, prints query progress.
#' Defaults to \code{TRUE}.
#' @param tidy If \code{TRUE}, makes state names more consistent.
#' Defaults to \code{FALSE}.
#'
#' @return A tibble with details on all listed bathrooms.
#' @export
#'
#' @examples \donttest{
#'
#' a <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
#'
#' }

rfg_all_restrooms <- function(accessible = FALSE, unisex = FALSE,
                              verbose = TRUE, tidy = FALSE) {
  ada_query <- ada_function(accessible)

  unisex_query <- unisex_function(unisex)

  query <- paste0(base_url, ".json?", ada_query, unisex_query, "&per_page=1")

  df <- query_looper(query, verbose, tidy)

  df
}
