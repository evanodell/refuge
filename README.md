
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/refuge)](https://cran.r-project.org/package=refuge)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/refuge.svg)](https://github.com/evanodell/refuge)
[![](https://cranlogs.r-pkg.org/badges/grand-total/refuge)](https://dgrtwo.shinyapps.io/cranview/)
[![Travis build
status](https://travis-ci.org/evanodell/refuge.svg?branch=master)](https://travis-ci.org/evanodell/refuge)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/evanodell/refuge?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/refuge)
[![Coverage
status](https://codecov.io/gh/evanodell/refuge/branch/master/graph/badge.svg)](https://codecov.io/github/evanodell/refuge?branch=master)
[![DOI](https://zenodo.org/badge/129826417.svg)](https://zenodo.org/badge/latestdoi/129826417)

# refuge

The `refuge` package provides access to the [Refuge Restrooms
API](https://www.refugerestrooms.org/api/docs/#!/restrooms) in R.

[Refuge Restrooms](https://www.refugerestrooms.org/) “is a web
application that seeks to provide safe restroom access for transgender,
intersex, and gender nonconforming individuals.” The web application
includes a public API, which this package allows access to. The API does
not require users to sign up or use a key. For further details on the
API or the organisation behind it, see the [API
docs](https://www.refugerestrooms.org/api/docs/), or the [Refuge
Restrooms homepage](https://www.refugerestrooms.org/).

The API does not require registration or an API key.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("evanodell/refuge")
```

## Use

Locating all restrooms close to a given set of coordinates, in this case
somewhere in New Jersey:

``` r
library(refuge)

bathrooms <- rfg_location(lat=39, lng=-75)
#> Retrieving page 1 of 1

tibble::glimpse(bathrooms)
#> Observations: 11
#> Variables: 19
#> $ id             <int> 23292, 18468, 35541, 31275, 36036, 36048, 23588...
#> $ name           <chr> "Acme", "Dellas 5 & 10", "Harry's Ocean Bar and...
#> $ street         <chr> "3845 Bayshore Road", "503 Washington St", "102...
#> $ city           <chr> "North Cape May", "Cape May", "Cape May", "Rio ...
#> $ state          <chr> "NJ", "New Jersey", "NJ", "Nj", "New Jersey", "...
#> $ accessible     <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,...
#> $ unisex         <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,...
#> $ directions     <chr> "At the back of the store, between the butter /...
#> $ comment        <chr> "You don't have to be a paying customer. There ...
#> $ latitude       <dbl> 38.97527, 38.93303, 38.93174, 39.01546, 38.9901...
#> $ longitude      <dbl> -74.94259, -74.92252, -74.91153, -74.87687, -74...
#> $ created_at     <chr> "2016-06-17T03:28:13.497Z", "2015-08-24T01:01:2...
#> $ updated_at     <chr> "2016-06-17T03:28:13.497Z", "2015-08-24T01:01:2...
#> $ downvote       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#> $ upvote         <int> 0, 1, 1, 0, 1, 2, 0, 0, 1, 0, 2
#> $ country        <chr> "US", "US", "US", "US", "US", "US", "US", "US",...
#> $ changing_table <lgl> FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,...
#> $ distance       <dbl> 3.525190, 6.223601, 6.696027, 6.696431, 10.0393...
#> $ bearing        <chr> "113.306001647996", "130.839725640655", "127.65...
```

Locating all unisex, accessible restrooms in Toronto, using the
`rfg_search()` function.

``` r

toronto <- rfg_search("toronto", accessible = TRUE, unisex = TRUE)
#> Retrieving page 1 of 2
#> Retrieving page 2 of 2

tibble::glimpse(toronto)
#> Observations: 127
#> Variables: 17
#> $ id             <int> 1656, 20153, 26253, 38754, 19636, 36264, 36582,...
#> $ name           <chr> "New College, University of Toronto", "Alumni H...
#> $ street         <chr> "40 Wilcocks", "121 St. Joseph Street, M5S 1J4"...
#> $ city           <chr> "Toronto", "Toronto", "Toronto", "Toronto", "Mi...
#> $ state          <chr> "ON", "Ontario", "Ontario", "Ontario", "Ontario...
#> $ accessible     <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,...
#> $ unisex         <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,...
#> $ directions     <chr> "Go in the entrance as though you wanted to go ...
#> $ comment        <chr> "Door is open until the library closes. I think...
#> $ latitude       <dbl> 43.66162, 43.66499, 43.65976, 43.70860, 43.6850...
#> $ longitude      <dbl> -79.40040, -79.39033, -79.36334, -79.40075, -79...
#> $ created_at     <chr> "2014-02-02T20:51:23.312Z", "2016-02-02T08:16:2...
#> $ updated_at     <chr> "2014-02-02T20:51:23.312Z", "2016-02-02T08:16:2...
#> $ downvote       <int> 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 1, 1, 1, 1, 1,...
#> $ upvote         <int> 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 3, 0, 0, 0, 1, 1,...
#> $ country        <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "Cana...
#> $ changing_table <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE,...
```

## Citing `refuge`

Odell E (2018). *refuge: Locate Trans and Intersex-Friendly Toilets*.
doi: 10.5281/zenodo.1219900 (URL:
<http://doi.org/10.5281/zenodo.1219900>), R package version 0.1.0,
\<URL: <https://github.com/evanodell/refuge>\>.

A BibTeX entry for LaTeX users is

``` 
  @Manual{,
    title = {{refuge}: Locate Trans and Intersex-Friendly Toilets},
    author = {Evan Odell},
    year = {2018},
    note = {R package version 0.1.0},
    doi = {10.5281/zenodo.1219900},
    url = {https://github.com/evanodell/refuge},
  }
```

## Notes

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

This project is not affiliated with the [Refuge
Restrooms](https://www.refugerestrooms.org/) application.
