#' Morrison Lab colour scales
#'
#' Discrete [ggplot2][ggplot2::ggplot] colour and fill scales
#' using the Okabe-Ito palette,
#' which stays distinguishable under the common kinds of colour blindness.
#' The colours are those of [grDevices::palette.colors()]
#' with `palette = "Okabe-Ito"`,
#' without black and grey, which look like text and missing values.
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

# Okabe-Ito order: orange, sky blue, bluish green, yellow, blue,
# vermillion, reddish purple. Blue and vermillion lead because
# lds already uses them for two-group figures.
morrison_colours <- c(
  blue = "#0072B2",
  vermillion = "#D55E00",
  bluish_green = "#009E73",
  reddish_purple = "#CC79A7",
  sky_blue = "#56B4E9",
  orange = "#E69F00",
  yellow = "#F0E442"
)

#' @rdname scale_morrison
#' @export
scale_colour_morrison <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = morrison_palette,
    ...
  )
}

#' @rdname scale_morrison
#' @export
scale_color_morrison <- scale_colour_morrison

#' @rdname scale_morrison
#' @export
scale_fill_morrison <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = morrison_palette,
    ...
  )
}

morrison_palette <- function(n) {
  if (n > length(morrison_colours)) {
    cli::cli_abort(
      "The Morrison palette has {length(morrison_colours)} colours, not {n}."
    )
  }
  unname(morrison_colours[seq_len(n)])
}
