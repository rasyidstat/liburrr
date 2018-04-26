#' Check if date input is an Indonesia national holiday or not
#'
#' @name is_holiday
#'
#' @md
#' @param x date input
#'
#' @return TRUE or FALSE
#'
#' @examples
#' dt <- as.Date(c("2016-01-01","2016-01-02","2016-01-03"))
#' is_holiday(dt)
#'
#' @export
is_holiday <- function(x) {
  ret <- with(libur, holiday[match(x, date)])
  ret <- !is.na(ret)
  ret
}
