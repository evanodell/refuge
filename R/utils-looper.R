

query_looper <- function(query, verbose) {
  got <- httr::GET(query, httr::accept_json())

  if (httr::status_code(got) != 200) {
    stop(
      sprintf(
        "Refuge API request failed [%s]\n%s\n<%s>",
        httr::status_code(got),
        got$message,
        got$documentation_url
      ),
      call. = FALSE
    )
  }

  pager <- (ceiling(as.numeric(got$headers$`x-total-pages`) / 100))

  if (pager == 0) {
    stop("No restrooms available with given search parameters.",
      call. = FALSE
    )
  }

  seq_list <- seq(from = 1, to = pager, by = 1)

  pages <- list()

  for (i in seq_along(seq_list)) {
    mydata <- jsonlite::fromJSON(paste0(query, "00&page=", seq_list[[i]]),
      flatten = TRUE
    )
    if (verbose == TRUE) {
      message("Retrieving page ", seq_list[[i]], " of ", pager)
    }
    pages[[seq_list[[i]]]] <- mydata
  }

  df <- tibble::as_tibble(dplyr::bind_rows(pages))

  df
}
