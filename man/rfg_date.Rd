% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bathroom_dates.R
\name{rfg_date}
\alias{rfg_date}
\title{Bathrooms by dates}
\usage{
rfg_date(
  date = NULL,
  accessible = FALSE,
  unisex = FALSE,
  updated = FALSE,
  verbose = TRUE,
  tidy = FALSE
)
}
\arguments{
\item{date}{A date in "yyyy-mm-dd" format, or any format that can be
coerced to a date with \code{as.Date()}.}

\item{accessible}{If \code{TRUE}, only returns restrooms that meet the
Americans with Disability Act standards for accessibility.
Defaults to \code{FALSE}.}

\item{unisex}{If \code{TRUE}, only returns unisex restrooms.
Defaults to \code{FALSE}.}

\item{updated}{If \code{TRUE}, returns all bathrooms updated \emph{or} added
since the given date. Defaults to \code{FALSE}, which only returns bathrooms
added since the given date.}

\item{verbose}{If \code{TRUE}, prints query progress.
Defaults to \code{TRUE}.}

\item{tidy}{If \code{TRUE}, makes USA state names more consistent. The internal
function focuses on correcting known errors and mistakes, if incorrect state
data is supplied that cannot be corrected. Defaults to \code{FALSE}.}
}
\value{
A tibble with all bathrooms recorded or updated on or after
the given date.
}
\description{
Requests all records on bathrooms created or updated on or after a
given date.
}
\examples{
\dontrun{
q <- rfg_date("2017-11-04")
}

}
