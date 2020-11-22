
<!-- README.md is generated from README.Rmd. Please edit that file -->

# refuge

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/refuge)](https://cran.r-project.org/package=refuge)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/refuge.svg)](https://github.com/evanodell/refuge)
[![](https://cranlogs.r-pkg.org/badges/grand-total/refuge)](https://dgrtwo.shinyapps.io/cranview/)
[![R build
status](https://github.com/evanodell/refuge/workflows/R-CMD-check/badge.svg)](https://github.com/evanodell/refuge/actions)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/evanodell/refuge?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/refuge)
[![Coverage
status](https://codecov.io/gh/evanodell/refuge/branch/master/graph/badge.svg)](https://codecov.io/github/evanodell/refuge?branch=master)
[![DOI](https://zenodo.org/badge/129826417.svg)](https://zenodo.org/badge/latestdoi/129826417)
<!-- badges: end -->

The `refuge` package provides access to the [Refuge Restrooms
API](https://www.refugerestrooms.org/api/docs/#!/restrooms) in R.

[Refuge Restrooms](https://www.refugerestrooms.org/) “is a web
application that seeks to provide safe restroom access for transgender,
intersex, and gender nonconforming individuals.” The web application
includes a public API, which this package allows access to. The API does
not require users to sign up or use a key. For further details on the
API see the [API docs](https://www.refugerestrooms.org/api/docs/), or
the package
[vignette](https://docs.evanodell.com/refuge/articles/introduction.html).
For details on the organisation providing this data, check out the
[Refuge Restrooms homepage](https://www.refugerestrooms.org/).

The API does not require registration or an API key.

## Installation

To install the latest version from CRAN, use:

``` r
install.packages("refuge")
```

You can install the latest development version from
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
#> Rows: 15
#> Columns: 21
#> $ id             <int> 23292, 51429, 18468, 35541, 31275, 36036, 36048, 23588…
#> $ name           <chr> "Acme", "Red Store", "Dellas 5 & 10", "Harry's Ocean B…
#> $ street         <chr> "3845 Bayshore Road", "500 Cape Ave", "503 Washington …
#> $ city           <chr> "North Cape May", "Cape May Point", "Cape May", "Cape …
#> $ state          <chr> "NJ", "New Jersey", "New Jersey", "NJ", "Nj", "New Jer…
#> $ accessible     <lgl> TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,…
#> $ unisex         <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, …
#> $ directions     <chr> "At the back of the store, between the butter / dairy …
#> $ comment        <chr> "You don't have to be a paying customer. There are two…
#> $ latitude       <dbl> 38.97527, 38.93867, 38.93303, 38.93174, 39.01546, 38.9…
#> $ longitude      <dbl> -74.94259, -74.96650, -74.92252, -74.91153, -74.87687,…
#> $ created_at     <chr> "2016-06-17T03:28:13.497Z", "2019-07-31T19:46:53.494Z"…
#> $ updated_at     <chr> "2016-06-17T03:28:13.497Z", "2019-07-31T19:46:53.515Z"…
#> $ downvote       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#> $ upvote         <int> 0, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 1, 0, 2, 1
#> $ country        <chr> "US", "US", "US", "US", "US", "US", "US", "US", "US", …
#> $ changing_table <lgl> FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,…
#> $ edit_id        <int> 23292, 51429, 18468, 35541, 31275, 36036, 36048, 23588…
#> $ approved       <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, …
#> $ distance       <dbl> 3.525190, 4.603666, 6.223601, 6.696027, 6.696431, 10.0…
#> $ bearing        <chr> "113.306001647996", "151.350613346059", "130.839725640…
```

Locating all unisex, accessible restrooms in Toronto, using the
`rfg_search()` function.

``` r
toronto <- rfg_search("toronto", accessible = TRUE, unisex = TRUE)
#> Retrieving page 1 of 2
#> Retrieving page 2 of 2

tibble::glimpse(toronto)
#> Rows: 171
#> Columns: 19
#> $ id             <int> 1656, 20153, 26253, 38754, 46678, 56095, 56347, 56394,…
#> $ name           <chr> "New College, University of Toronto", "Alumni Hall (Un…
#> $ street         <chr> "40 Wilcocks", "121 St. Joseph Street, M5S 1J4", "525 …
#> $ city           <chr> "Toronto", "Toronto", "Toronto", "Toronto", "Toronto",…
#> $ state          <chr> "ON", "Ontario", "Ontario", "Ontario", "Ontario", "Ont…
#> $ accessible     <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, …
#> $ unisex         <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, …
#> $ directions     <chr> "Go in the entrance as though you wanted to go to the …
#> $ comment        <chr> "Door is open until the library closes. I think around…
#> $ latitude       <dbl> 43.66162, 43.66499, 43.65976, 43.70860, 43.63918, 43.7…
#> $ longitude      <dbl> -79.40040, -79.39033, -79.36334, -79.40075, -79.40036,…
#> $ created_at     <chr> "2014-02-02T20:51:23.312Z", "2016-02-02T08:16:28.822Z"…
#> $ updated_at     <chr> "2014-02-02T20:51:23.312Z", "2016-02-02T08:16:28.822Z"…
#> $ downvote       <int> 1, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 1, 1, …
#> $ upvote         <int> 2, 0, 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 3, 0, 0, …
#> $ country        <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", …
#> $ changing_table <lgl> FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, F…
#> $ edit_id        <int> 1656, 20153, 26253, 38754, 46678, 56095, 56347, 56394,…
#> $ approved       <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, …
```

For more detailed examples, check out the
[vignette](https://docs.evanodell.com/refuge/articles/introduction.html).

## Citing `refuge`

Odell E (2018). *refuge: Locate Trans and Intersex-Friendly Toilets*.
doi: 10.5281/zenodo.1219900 (URL:
<http://doi.org/10.5281/zenodo.1219900>), R package version 0.3.2,
&lt;URL: <https://github.com/evanodell/refuge>&gt;.

A BibTeX entry for LaTeX users is

      @Manual{,
        title = {{refuge}: Locate Trans and Intersex-Friendly Toilets},
        author = {Evan Odell},
        year = {2018},
        note = {R package version 0.3.2},
        doi = {10.5281/zenodo.1219900},
        url = {https://github.com/evanodell/refuge},
      }

## Notes

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

This project is not affiliated with the [Refuge
Restrooms](https://www.refugerestrooms.org/) application.
