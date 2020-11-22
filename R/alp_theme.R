#' ALP custom theme for ggplot figures
#'
#' Based on theme_linedraw, with adjustments to axis text, strip format,
#' and no legends. Any of these formats can be overriden by adding them
#' to a plot manually. Function works best with theme_set.
#'
#' @return None
#'
#' @author Alec Plotkin, \email{alp.plotkin@@gmail.com}
#' @keywords ggplot, plot, figure, theme
#'
#'
#' @export
#'
alp_theme <- function() ggplot2::theme_linedraw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1),
                 axis.title.x = ggplot2::element_text(hjust = 0.5),
                 axis.title.y = ggplot2::element_text(vjust = 0.5)) +
  ggplot2::theme(text = ggplot2::element_text(size = 14)) +
  ggplot2::theme(strip.text = ggplot2::element_text(color = "black"),
                 strip.text.y = ggplot2::element_text(angle = 180),
                 strip.background = ggplot2::element_rect(fill = "white"),
                 strip.placement = "outside") +
  ggplot2::theme(legend.position = 'none')

#' @examples
#' # applying theme at the end of a ggplot object:
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = cyl, y = hp, group = cyl)) +
#'   ggplot2::geom_jitter() +
#'   ggplot2::geom_boxplot(alpha = 0.5) +
#'   alp_theme()
#'
#' # setting theme as default for all plots:
#' ggplot2::theme_set(alp_theme())
#' ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
#'   ggplot2::geom_point() +
#'   ggplot2::facet_wrap(~ Species)
#'
#' # adding a legend:
#' ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
#'   ggplot2::geom_point() +
#'   ggplot2::facet_wrap(~ Species) +
#'   ggplot2::theme(legend.position = 'right')
