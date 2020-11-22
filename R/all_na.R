#' A function to return TRUE for columns of a data frame
#'  which are all NA.
#'
#' This can be useful for removing missing columns, which may occur while cleaning
#' a data set
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#'
#' @param df A data frame.
#'
#' @return A logical vector of length ncol(df), that is TRUE only for columns
#' where all rows are NA.
#'
#'
#' @export
#'
all_na <- function(df) {
  naCols <- colSums(purrr::modify(df, ~ !is.na(.)))
  mode(naCols) <- 'logical'
  !naCols
}

#' @examples
#' # returns FALSE for columns with no NAs
#' all_na(iris)
#' # returns FALSE for columns where not all values are NA
#' iris2 <- iris
#' iris2$Petal.Length[5:15] <- NA
#' all_na(iris2)
#' # returns TRUE for columns where all values are missing
#' iris3 <- iris
#' iris3$Petal.Length <- NA
#' all_na(iris3)
#'
#' # can be useful for removing missing columns, which may occur while cleaning
#' # a data set:
#' iris4 <- iris3[!all_na(iris3)]
