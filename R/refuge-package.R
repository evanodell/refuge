

#' refuge
#'
#' @description \href{Refuge Restrooms}{https://www.refugerestrooms.org/}
#' "is a web application that seeks to provide safe restroom access for
#' transgender, intersex, and gender nonconforming individuals." The web
#' application includes a public API, which this package allows access to.
#' The API does not require users to sign up or use a key. For further details
#' on the API or the organisation behind it,
#' see the \href{API docs}{https://www.refugerestrooms.org/api/docs/}, or the
#' \href{Refuge Restrooms homepage}{https://www.refugerestrooms.org/}.
#'
#' @description The API does not require an API key or user registration.
#' Requests are made over HTTPS, and returned in JSON format. All request
#' results are returned as tibbles.
#'
#' @keywords internal
#' @importFrom jsonlite fromJSON
#' @importFrom httr status_code GET
#' @importFrom tibble as_tibble
#' @importFrom dplyr bind_rows case_when
"_PACKAGE"
