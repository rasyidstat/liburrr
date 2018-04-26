
<!-- README.md is generated from README.Rmd. Please edit that file -->
liburrr: Indonesia holiday R package
====================================

*Libur telah tiba, libur telah tiba* :musical\_note::musical\_note::musical\_note:

`liburrr` is an R package which contains functionality related to holiday date in Indonesia. The name of `liburrr` with three 'r' is inspired with R package `purrr`.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("rasyidstat/liburrr")
```

Example
-------

``` r
library(liburrr)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
df <- data.frame(dt = as.Date(c("2016-01-01","2016-01-02","2016-01-03")))
df <- df %>%
  mutate(weekend_flag = is_weekend(dt),
         holiday_flag = is_holiday(dt),
         holiday_flag_all = ifelse(weekend_flag == FALSE, holiday_flag, weekend_flag))
df
#>           dt weekend_flag holiday_flag holiday_flag_all
#> 1 2016-01-01        FALSE         TRUE             TRUE
#> 2 2016-01-02         TRUE        FALSE             TRUE
#> 3 2016-01-03         TRUE        FALSE             TRUE
```
