#' A wrapper to return head() and tail() of an R object in a list.
#'  Will inherit S3 methods from the parent functions.
#'
#' @param df A data frame.
#' @param n The number of rows to show from the start and end of the data frame
#'
#' @return A named list of length 2 with elements HEAD and TAIL, consisting of
#'  the head and tail of the data frame, of length n.
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#'
#'
#' @export
#'
catdog <- function(df, n = 6L) {
  list(HEAD = utils::head(df, n = n), TAIL = utils::tail(df, n = n))
}

#' @examples
#' catdog(iris)
#' catdog(iris, n = 10L)
#' catdog(mtcars)
#' catdog(mtcars, n = 8L)
