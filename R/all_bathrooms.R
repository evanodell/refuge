

#' All restrooms
#'
#' All restrooms, ordered by descending date.
#'
#' @param accessible If \code{TRUE}, only returns accessible restrooms. Defaults to \code{FALSE}.
#' @param unisex If \code{TRUE}, only returns unisex restrooms. Defaults to \code{FALSE}.
#' @param verbose If \code{TRUE}, prints query progress. Defaults to \code{TRUE}.
#'
#' @return
#' @export
#'
#' @examples \donttest{
#'
#' a <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)
#'
#' }
#'

a <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE)


rfg_all_restrooms <- function(accessible = FALSE, unisex = FALSE, verbose = TRUE) {
  ada_query <- ada_function(accessible)

  unisex_query <- unisex_function(unisex)

  query <- paste0(base_url, ".json?", ada_query, unisex_query, "&per_page=1")

  df <- query_looper(query)

  df
}
