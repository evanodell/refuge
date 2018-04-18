

#' Restroom record search
#'
#' @param search A string to search for. Note that the API does not accept
#' wildcard searchs, searches all fields in all available records, and only
#' returns exact (case-insensitive) matches.
#' @inheritParams rfg_all_restrooms
#'
#'
#' @return A tibble with all bathrooms matching your search request
#' @export
#'
#' @examples \donttest{
#'
#' s <- rfg_search(search="toronto")
#'
#' }


rfg_search <- function(search, accessible = FALSE,
                       unisex = FALSE, verbose = TRUE) {
  if (missing(search)) {
    stop("Values for the `search` parameter must be included", call. = FALSE)
  }

  ada_query <- ada_function(accessible)

  unisex_query <- unisex_function(unisex)

  query <- paste0(
    base_url, "/search.json?query=", search,
    ada_query, unisex_query, "&per_page=1"
  )

  df <- query_looper(query, verbose)

  df
}
