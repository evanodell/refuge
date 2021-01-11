

#' All refuge restrooms
#'
#' All listed refuge restrooms, ordered by date added or last updated, with
#' the most recent additions and updates at the top.
#'
#' @details Note that the API does not standardise or validate the names of
#' states, cities, countries, etc, and so this data may need to be cleaned
#' and organised.
#'
#' @param accessible If `TRUE`, only returns restrooms that meet the
#' Americans with Disability Act standards for accessibility.
#' Defaults to `FALSE`.
#' @param unisex If `TRUE`, only returns unisex restrooms.
#' Defaults to `FALSE`.
#' @param verbose If `TRUE`, prints query progress.
#' Defaults to `TRUE`.
#' @param tidy If `TRUE`, makes USA state names more consistent. The internal
#' function focuses on correcting known errors and mistakes, if incorrect state
#' data is supplied that cannot be corrected. Defaults to `FALSE`.
#'
#' @return A tibble with details on all listed bathrooms.
#' @export
#'
#' @examples
#' \dontrun{
#' a <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
#' }
#'
rfg_all_restrooms <- function(accessible = FALSE, unisex = FALSE,
                              verbose = TRUE, tidy = FALSE) {
  ada_uni <- ada_uni_function(accessible, unisex)

  query <- paste0(base_url, ".json?", ada_uni, "&per_page=1")

  df <- query_looper(query, verbose, tidy)

  df
}
