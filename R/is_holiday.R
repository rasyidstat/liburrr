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
  x <- as.Date(x)
  ret <- with(libur, holiday[match(x, date)])
  ret <- !is.na(ret)
  warning("`is_holiday` will be deprecated soon. Please use `is_libur` function instead.")
  return(ret)
}

#' Check if date input is an Indonesia public national holiday or not
#'
#' @name is_libur
#'
#' @md
#' @param x date input
#' @param label return holiday description if set TRUE
#'
#' @return TRUE or FALSE; or return holiday description
#'
#' @examples
#' dt <- as.Date(c("2016-01-01","2016-01-02","2016-01-03"))
#' is_libur(dt)
#'
#' @export
is_libur <- function(x, label = FALSE) {
  dt <- as.Date(x)
  ret <- is_libur_det(dt)

  if (!label) {
    ret <- !is.na(ret)
  }

  return(ret)
}

is_libur_det <- function(dt) {
  dm <- format(dt, "%d-%m")
  y <- format(dt, "%Y")

  ret <- rep(NA_character_, length(dt))

  ret[dm == "01-01"] = "Tahun Baru Masehi"

  # https://www.pikiran-rakyat.com/nasional/2017/05/01/klipingpr-sejak-kapan-hari-buruh-jadi-hari-libur-nasional-400226
  ret[dm == "01-05" & y > "2013"] = "Hari Buruh"

  ret[dm == "17-08" & y > "1945"] = "Hari Kemerdekaan"

  # https://batam.tribunnews.com/2019/05/23/sejarah-hari-lahir-pancasila-1-juni-ditetapkan-sebagai-hari-libur-nasional-sejak-tahun-2017
  ret[dm == "01-06" & y > "2016"] = "Hari Lahir Pancasila"

  ret[dm == "25-12"] = "Hari Natal"

  # dynamic
  ret[dm %in% c("2013-03-12","2014-03-31","2015-03-21",
                "2016-03-09","2017-03-28","2018-03-17",
                "2019-03-07")] = "Hari Raya Nyepi"
  ret[dm %in% c("2013-08-08","2013-08-09","2014-07-28","2014-07-29",
                "2015-07-17","2015-07-18","2016-07-06","2016-07-07",
                "2017-06-25","2017-06-26","2018-06-15","2018-06-16",
                "2019-06-05","2019-06-06")] = "Idul Fitri"
  ret[dm %in% c("2013-10-15","2014-10-05","2015-09-24",
                "2016-09-12","2017-09-01","2018-08-22",
                "2019-08-11")] = "Idul Adha"
  ret[dm %in% c("2013-05-25","2014-05-15","2015-06-12",
                "2016-05-22","2017-05-11","2018-05-29",
                "2019-05-19")] = "Hari Raya Waisak"
  ret[dm %in% c("2013-06-06","2014-05-27","2015-05-16",
                "2016-05-06","2017-04-24","2018-04-14",
                "2019-04-03")] = "Isra Miraj"
  ret[dm %in% c("2013-03-29","2014-04-18","2015-04-03",
                "2016-03-25","2017-04-14","2018-03-30",
                "2019-04-19")] = "Jumat Agung"
  ret[dm %in% c("2013-05-09","2014-05-29","2015-05-14",
                "2016-05-05","2017-05-25","2018-05-10",
                "2019-05-30")] = "Kenaikan Isa Almasih"
  ret[dm %in% c("2013-01-24","2014-01-14","2015-01-03",
                "2015-12-24","2016-12-12","2017-12-01",
                "2018-11-20","2019-11-09")] = "Maulid Nabi"
  ret[dm %in% c("2017-02-15")] = "Pilkada"
  ret[dm %in% c("2014-04-09","2019-04-17")] = "Pemilu"
  ret[dm %in% c("2013-11-05","2014-10-25","2015-10-14",
                "2016-10-02","2017-09-21","2018-09-12",
                "2019-09-01")] = "Tahun Baru Hijriyah"
  ret[dm %in% c("2013-02-10","2014-01-31","2015-02-19",
                "2016-02-08","2017-01-28","2018-02-16",
                "2019-02-05")] = "Tahun Baru Imlek"
  return(ret)
}
