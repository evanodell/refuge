

query_looper <- function(query) {

  got <- httr::GET(query, httr::accept_json())

  http_status(got)

  pager <- (ceiling(as.numeric(got$headers$`x-total-pages`)/100))

  seq_list <- seq(from = 1, to = pager, by = 1)

  pages <- list()

  for (i in seq_along(seq_list)) {
    mydata <- jsonlite::fromJSON(paste0(query, "00&page=", seq_list[[i]]), flatten = TRUE)
    if (verbose == TRUE) {
      message("Retrieving page ", seq_list[[i]], " of ", pager)
    }
    pages[[seq_list[[i]]]] <- mydata
  }

  df <- tibble::as_tibble(dplyr::bind_rows(pages))

  df

}
