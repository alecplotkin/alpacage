#' Wrappers on base and stats functions where na.rm = TRUE automatically.
#'
#' Useful for data sets where you don't want to get rid of the NAs but need
#' to calculate summary stats without them. Especially useful when you get
#' tired of typing na.rm = TRUE over and over and over...
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#'
#' @section mean_na:
#' Calculates the mean of a numeric vector input, with na.rm = TRUE.
#'
#' @section sd_na:
#' Calculates the standard deviation of a numeric vector input, with na.rm = TRUE.
#'
#' @section med_na:
#' Calculates the median of a numeric vector input, with na.rm = TRUE.
#'
#' @section IQR_na:
#' Calculates the inter quartile range of a numeric vector input, with na.rm = TRUE.
#'
#' @section sum_na:
#' Calculates the sum of a numeric vector input, with na.rm = TRUE.
#'
#' @param x a numeric vector.
#'
#' @return A numeric value resulting from the chosen statistical operation,
#' ignoring NAs.
#'
#'
#' @rdname mean_na
#' @export
mean_na <- function(x) {
  mean(x, na.rm = TRUE)
}
#' @rdname mean_na
#' @export
sd_na <- function(x) {
  stats::sd(x, na.rm = TRUE)
}
#' @rdname mean_na
#' @export
med_na <- function(x) {
  stats::median(x, na.rm = TRUE)
}
#' @rdname mean_na
#' @export
IQR_na <- function(x) {
  stats::IQR(x, na.rm = TRUE)
}
#' @rdname mean_na
#' @export
sum_na <- function(x) {
  sum(x, na.rm = TRUE)
}

#' @examples
#' data <- 1:20
#' data[c(4,8,12)] <- NA
#' mean(data)
#' mean_na(data)
#' stats::sd(data)
#' sd_na(data)
#' stats::median(data)
#' med_na(data)
#' stats::IQR(data)
#' IQR_na(data)
#' sum(data)
#' sum_na(data)
