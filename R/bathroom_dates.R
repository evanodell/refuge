
#' Bathrooms by dates
#'
#' Requests all records on bathrooms created or updated on or after a
#' given date.
#'
#' @param date A date in "yyyy-mm-dd" format, or any format that can be
#' coerced to a date with `as.Date()`.
#' @param updated If `TRUE`, returns all bathrooms updated _or_ added
#' since the given date. Defaults to `FALSE`, which only returns bathrooms
#' added since the given date.
#'
#' @inheritParams rfg_all_restrooms
#'
#' @return A tibble with all bathrooms recorded or updated on or after
#' the given date.
#' @export
#'
#' @examples
#' \dontrun{
#' q <- rfg_date("2017-11-04")
#' }
#'
rfg_date <- function(date = NULL, accessible = FALSE, unisex = FALSE,
                     updated = FALSE, verbose = TRUE, tidy = FALSE) {
  if (is.null(date)) stop("Please enter a date", call. = FALSE)

  date <- as.Date(date)

  ada_uni <- ada_uni_function(accessible, unisex)

  updated_query <- ifelse(updated == TRUE, "updated=true&", "")

  query <- paste0(
    base_url, "/by_date.json?", ada_uni, updated_query,
    "&day=", trimws(format(date, "%e")), "&month=", format(date, "%m"),
    "&year=", format(date, "%y"), "&per_page=1"
  )

  df <- query_looper(query, verbose, tidy)

  df
}
