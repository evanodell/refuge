
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
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1219900.svg)](https://doi.org/10.5281/zenodo.1219900)

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
```

Locating all unisex, accessible restrooms in Toronto, using the
`rfg_search()` function.

``` r
toronto <- rfg_search("toronto", accessible = TRUE, unisex = TRUE)
```

For more detailed examples, check out the
[vignette](https://docs.evanodell.com/refuge/articles/introduction.html).

## Citing `refuge`

Odell E (2018). *refuge: Locate Trans and Intersex-Friendly Toilets*.
doi: [10.5281/zenodo.1219900](https://doi.org/10.5281/zenodo.1219900), R
package version 0.3.2.9000, &lt;URL:
<https://github.com/evanodell/refuge>&gt;.

A BibTeX entry for LaTeX users is

      @Manual{,
        title = {{refuge}: Locate Trans and Intersex-Friendly Toilets},
        author = {Evan Odell},
        year = {2018},
        note = {R package version 0.3.2.9000},
        doi = {10.5281/zenodo.1219900},
        url = {https://github.com/evanodell/refuge},
      }

## Notes

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/evanodell/refuge/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

This project is not affiliated with the [Refuge
Restrooms](https://www.refugerestrooms.org/) application.
