#' Check if date input is a weekend or not
#'
#' @name is_weekend
#'
#' @md
#' @param x date input
#' @param wday weekday index
#'
#' @return TRUE or FALSE
#'
#' @examples
#' dt <- as.Date(c("2016-01-01","2016-01-02","2016-01-03"))
#' is_weekend(dt)
#' is_weekday(dt)
NULL

#' @rdname is_weekend
#' @export
is_weekend <- function(x, wday = 1:5) {
  ifelse(as.numeric(format(x, format = "%u")) %in% wday, FALSE, TRUE)
}

#' @rdname is_weekend
#' @export
is_weekday <- function(x, wday = 1:5) {
  ifelse(as.numeric(format(x, format = "%u")) %in% wday, TRUE, FALSE)
}
