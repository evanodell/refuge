## Function checks to see if ADA standard toilets are being queried
ada_uni_function <- function(accessible, unisex) {
  if (accessible == TRUE) {
    x <- "&ada=true"
  } else {
    x <- ""
  }
  if (unisex == TRUE) {
    y <- "&unisex=true"
  } else {
    y <- ""
  }

  paste0(x, y)
}
