


rfg_tidy <- function(df) {
  df$state <- tolower(trimws(df$state))

  df$state <- case_when(df$state %in% tolower(state.name) ~ df$state,
                        df$state %in% c("washington dc",
                                        "washington, district of columbia",
                                        "columbia", "dc",
                                        "washington district of columbia") ~
                          "District of Columbia",
                        toupper(df$country) == "US" ~
                          ifelse(is.na(
                            tolower(state.name)[match(df$state,
                                                      tolower(state.abb))]),
                            df$state,
                            tolower(state.name)[match(df$state,
                                                      tolower(state.abb))]),
                        TRUE ~ df$state)

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
