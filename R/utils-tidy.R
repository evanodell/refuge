


rfg_tidy <- function(df) {
  df$state <- tolower(trimws(df$state))

  df$state <- ifelse(!(df$state %in% tolower(state.name)) & df$country == "US",
    tolower(state.name)[match(df$state, tolower(state.abb))],
    df$state
  )

  df$state <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2",
    df$state,
    perl = TRUE
  )

  df$city <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2",
    df$city,
    perl = TRUE
  )

  df$state <- ifelse(nchar(df$state) <= 2,
    toupper(df$state),
    df$state
  )
}
