


#' Bathroom locations
#'
#' Given a pair of coordinates (latitude and longitude), finds any nearby
#' bathrooms, subject to other parameters.
#'
#' @param lat Location latitude
#' @param lng Location longitude
#' @inheritParams rfg_all_restrooms
#'
#' @return A tibble with details of any and all nearby refuge bathrooms.
#' @export
#'
#' @examples \donttest{
#'
#' c <- rfg_location(lat=39, lng=-75)
#'
#' }

rfg_location <- function(lat, lng, accessible = FALSE,
                         unisex = FALSE, verbose = TRUE, tidy = FALSE) {
  if (missing(lat) || missing(lng)) {
    stop("Values for the `lat` and `lng` parameters must be included.",
      call. = FALSE
    )
  }

  ada_query <- ada_function(accessible)

  unisex_query <- unisex_function(unisex)

  coords <- paste0("lat=", lat, "&lng=", lng)

  query <- paste0(
    base_url, "/by_location.json?", coords, ada_query,
    unisex_query, "&per_page=1"
  )

  df <- query_looper(query, verbose, tidy)

  df
}
