
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis build
status](https://travis-ci.org/evanodell/refuge.svg?branch=master)](https://travis-ci.org/evanodell/refuge)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/evanodell/refuge?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/refuge)
[![Coverage
status](https://codecov.io/gh/evanodell/refuge/branch/master/graph/badge.svg)](https://codecov.io/github/evanodell/refuge?branch=master)

# refuge

`refuge` provides access to the [Refuge Restrooms
API](https://www.refugerestrooms.org/api/docs/#!/restrooms) in R.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("evanodell/refuge")
```

## Use

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

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
