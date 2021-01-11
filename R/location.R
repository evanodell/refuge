


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
#' @examples
#' \dontrun{
#' c <- rfg_location(lat = 39, lng = -75)
#' }
#'
rfg_location <- function(lat, lng, accessible = FALSE,
                         unisex = FALSE, verbose = TRUE, tidy = FALSE) {
  if (missing(lat) || missing(lng)) {
    stop("Values for the `lat` and `lng` parameters must be included.",
      call. = FALSE
    )
  }

  ada_uni <- ada_uni_function(accessible, unisex)

  query <- paste0(
    base_url, "/by_location.json?lat=", lat, "&lng=", lng, ada_uni, "&per_page=1"
  )

  df <- query_looper(query, verbose, tidy)

  df
}
