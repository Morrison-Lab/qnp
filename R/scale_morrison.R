#' Morrison Lab colour scales
#'
#' Discrete [ggplot2][ggplot2::ggplot] colour and fill scales
#' using the Okabe-Ito palette,
#' which stays distinguishable under the common kinds of colour blindness.
#' They call [ggokabeito::scale_colour_okabe_ito()]
#' and [ggokabeito::scale_fill_okabe_ito()]
#' with the order blue, vermillion, bluish green, reddish purple,
#' sky blue, orange, yellow.
#' Blue and vermillion lead because lds uses them for two-group figures.
#' The scales leave out black and grey,
#' which look like text and missing values,
#' so they have 7 colours.
#'
#' @param ...
#' Passed to [ggokabeito::scale_colour_okabe_ito()]
#' or [ggokabeito::scale_fill_okabe_ito()].
#'
#' @return
#' A discrete [ggplot2::Scale] object.
#'
#' @name scale_morrison
#'
#' @examplesIf requireNamespace("ggplot2", quietly = TRUE)
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = factor(cyl))) +
#'   ggplot2::geom_point() +
#'   scale_colour_morrison()
NULL

# Positions in ggokabeito's order: orange, sky blue, bluish green, yellow,
# blue, vermillion, reddish purple.
morrison_order <- c(5, 6, 3, 7, 2, 1, 4)

#' @rdname scale_morrison
#' @export
scale_colour_morrison <- function(...) {
  ggokabeito::scale_colour_okabe_ito(order = morrison_order, ...)
}

#' @rdname scale_morrison
#' @export
scale_color_morrison <- scale_colour_morrison

#' @rdname scale_morrison
#' @export
scale_fill_morrison <- function(...) {
  ggokabeito::scale_fill_okabe_ito(order = morrison_order, ...)
}
