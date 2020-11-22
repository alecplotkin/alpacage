#' Wrapper to paste things together with "_" as the separator.
#'
#' Useful for saving file names or automatically generating variable names, etc
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#'
#' @description Paste things together with '_' as the separator.
#'
#' @param ... Arguments to pass to base paste function.
#'
#' @return A string with all elements pasted together with '_' in between them.
#'
#'
#' @export
#'
paste_ <- function(...) {
  paste(..., sep = "_")
}

#' @examples
#' file_name <- paste_('This', 'is', 'my', 'filename')
#' file_names <- modify(1:10, ~ paste_('file', .))
