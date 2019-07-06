
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
df <- data.frame(dt = seq.Date(as.Date("2020-01-01"), as.Date("2020-01-07"), "day") )
df <- df %>%
  mutate(weekend_flag = is_weekend(dt),
         holiday_flag = is_libur(dt),
         holiday_flag_all = ifelse(weekend_flag == FALSE, holiday_flag, weekend_flag),
         holiday_desc = is_libur(dt, label = TRUE))
df
#>           dt weekend_flag holiday_flag holiday_flag_all      holiday_desc
#> 1 2020-01-01        FALSE         TRUE             TRUE Tahun Baru Masehi
#> 2 2020-01-02        FALSE        FALSE            FALSE              <NA>
#> 3 2020-01-03        FALSE        FALSE            FALSE              <NA>
#> 4 2020-01-04         TRUE        FALSE             TRUE              <NA>
#> 5 2020-01-05         TRUE        FALSE             TRUE              <NA>
#> 6 2020-01-06        FALSE        FALSE            FALSE              <NA>
#> 7 2020-01-07        FALSE        FALSE            FALSE              <NA>
```
