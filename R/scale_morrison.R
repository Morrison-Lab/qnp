#' Morrison Lab colour scales
#'
#' Discrete [ggplot2][ggplot2::ggplot] colour and fill scales
#' using the Okabe-Ito palette,
#' which stays distinguishable under the common kinds of colour blindness.
#' For up to 7 groups they use [ggokabeito::palette_okabe_ito()]
#' in the order blue, vermillion, bluish green, reddish purple,
#' sky blue, orange, yellow.
#' Blue and vermillion lead because lds uses them for two-group figures.
#' The palette leaves out black and grey,
#' which look like text and missing values.
#'
#' For 8 to 12 groups the scales switch to the `"Safe"` palette
#' of the `rcartocolor` package and warn,
#' because no tested palette keeps every pair of that many colours
#' easy to tell apart.
#' Also vary shape or line type for that many groups.
#' More than 12 groups is an error.
#' The reasons for these choices are in
#' `inst/decisions/0001-colour-palette.md`.
#'
#' @param ...
#' Passed to [ggplot2::discrete_scale()].
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
  ggplot2::discrete_scale("colour", palette = morrison_palette, ...)
}

#' @rdname scale_morrison
#' @export
scale_color_morrison <- scale_colour_morrison

#' @rdname scale_morrison
#' @export
scale_fill_morrison <- function(...) {
  ggplot2::discrete_scale("fill", palette = morrison_palette, ...)
}
