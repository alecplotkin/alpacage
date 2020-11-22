#' Formats p values for use on plots
#'
#' Custom format for p values. Works well with ggpubr's stat_compare_means.
#'
#' P values are formatted as follows:
#'   - values below pmin (default is 0.0001) are formatted as 'p < pmin'
#'   - values between pmin and 0.01 are formatted to have only 1 sigfig
#'   (i.e. 'p = 0.002')
#'   - values above 0.01 are formatted to have 2 sigfigs (i.e. 'p = 0.016',
#'   'p = 0.35')
#'
#' @section p_format:
#' Formats a numeric value as a p value that displays well on plots. When used
#' on a numeric vector, all values will be formatted in the same manner as the
#' first value, regardless of what the actual value is. This means that if the
#' first value is formatted as 'p < 0.0001', all values will be, even if they
#' are greater than 0.0001. For this reason, numeric vectors should be formatted
#' using vp_format.
#'
#' @section vp_format:
#' Vectorized version of p_format, that applies the p_format function to each
#' member of a vector individually. Particularly useful with for faceted plots
#' in ggpubr::stat_compare_means (see example).
#'
#' @param p numeric p-value to be formatted
#' @param pmin = 0.0001; numeric minimum p value to display.
#'   all values below 0.0001 displayed as '< 0.0001'
#' @param scientific = FALSE; logical, whether or not to use scientific notation
#'
#' @return A character vector with the text of the formatted p-values.
#' The vector will be as long as the number of arguments passed to it.
#' p_format should be used only for single p-values; vectors of multiple
#' p-values should use vp_format.
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#' @keywords ggplot, plot, figure, ggpubr, format, significance, pval, format.pval, p.format
#'
#'
#' @rdname p_format
#' @export
p_format <- function(p, pmin = 0.0001, scientific = FALSE) {
  if (p < pmin) {
    return(paste('p <', format(pmin, scientific = scientific)))
  } else if (p >= 0.01) {
    newp <- format.pval(p, digits = 2)
  } else {
    newp <- format.pval(signif(p, digits = 1), scientific = scientific)
  }
  paste('p =', newp)
}
#' @rdname p_format
#' @export
vp_format <- Vectorize(p_format)

#' @examples
#'
#' # for a single plot:
#' fig <- ggplot2::ggplot(mtcars, ggplot2::aes(x = factor(cyl), y = mpg)) +
#'   ggplot2::geom_jitter() +
#'   ggplot2::geom_boxplot(alpha = 0.5)
#'
#' # without p_format:
#' fig +
#'   ggpubr::stat_compare_means()
#'
#' # with p_format:
#' fig +
#'   ggpubr::stat_compare_means(ggplot2::aes(label = p_format(..p..)))
#'
#' # for a faceted plot, use vectorized version: vp_format
#' # without vp_format
#' fig +
#'   ggplot2::facet_wrap(~ am) +
#'   ggpubr::stat_compare_means()
#'
#' # with vp_format
#' fig +
#'   ggplot2::facet_wrap(~ am) +
#'   ggpubr::stat_compare_means(ggplot2::aes(label = paste0(..method.., ', ', vp_format(..p..))))
