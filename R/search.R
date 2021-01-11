

#' Restroom record search
#'
#' @param search A string to search for. Note that the API does not accept
#' wildcard searchs, searches all fields in all available records, and only
#' returns exact (case-insensitive) whole-word matches.
#' @inheritParams rfg_all_restrooms
#'
#'
#' @return A tibble with all bathrooms matching your search request
#' @export
#'
#' @examples
#' \dontrun{
#' s <- rfg_search(search = "toronto")
#' }
#'
rfg_search <- function(search, accessible = FALSE,
                       unisex = FALSE, verbose = TRUE, tidy = FALSE) {
  if (missing(search)) {
    stop("Values for the `search` parameter must be included", call. = FALSE)
  }

  ada_uni <- ada_uni_function(accessible, unisex)

  query <- paste0(
    base_url, "/search.json?query=", search,
    ada_uni, "&per_page=1"
  )

  df <- query_looper(query, verbose, tidy)

  df
}
