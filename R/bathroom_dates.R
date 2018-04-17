

#' Bathrooms by dates
#'
#' Requests all records on bathrooms created or updated on or after a
#' given date.
#'
#' @param date A date in "yyyy-mm-dd" format, or any format that can be
#' coerced to a date with \code{as.Date()}.
#'
#' @inheritParams rfg_all_restrooms
#'
#' @return A tibble with all bathrooms recorded or updated on or after
#' the given date.
#' @export
#'
#' @examples \donttest{
#'
#' q <- rfg_date("2017-11-04")
#'
#' }


rfg_date <- function(date = NULL, accessible = FALSE,
                     unisex = FALSE, verbose = TRUE) {
  if (is.null(date)) stop("Please enter a date", call. = FALSE)

  date <- as.Date(date)

  ada_query <- ada_function(accessible)

  unisex_query <- unisex_function(unisex)

  query <- paste0(
    base_url, "/by_date.json?", ada_query, unisex_query,
    "&day=", format(date, "%d"), "&month=", format(date, "%m"),
    "&year=", format(date, "%y"), "&per_page=1"
  )

  df <- query_looper(query, verbose)

  df
}
