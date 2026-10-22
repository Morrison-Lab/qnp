#' Morrison Lab ggplot2 theme
#'
#' A [ggplot2][ggplot2::ggplot] theme shared by the lab's notes sites.
#' It is [ggplot2::theme_bw()] with the legend at the bottom
#' and serif text, as in the rme notes.
#' The plot background matches one of the sites' page palettes,
#' so a figure sits on the page without a white box.
#'
#' @param base_size
#' A single number: the base font size in points.
#' @param base_family
#' A single string: the font family.
#' @param palette
#' A single string, one of `"light"`, `"offwhite"` or `"parchment"`:
#' the site palette whose page colour is the plot background.
#' `"light"` is white.
#' Figures on the sites' dark theme keep the light plate,
#' so there is no dark palette.
#'
#' @return
#' A [ggplot2::theme] object.
#'
#' @export
#'
#' @examplesIf requireNamespace("ggplot2", quietly = TRUE)
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = factor(cyl))) +
#'   ggplot2::geom_point() +
#'   theme_morrison() +
#'   scale_colour_morrison()
theme_morrison <- function(
  base_size = 12,
  base_family = "serif",
  palette = c("light", "offwhite", "parchment")
) {
  palette <- rlang::arg_match(palette)
  page <- unname(morrison_page_colours[palette])

  ggplot2::theme_bw(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      legend.position = "bottom",
      plot.background = ggplot2::element_rect(fill = page, colour = NA),
      legend.background = ggplot2::element_rect(fill = page, colour = NA),
      legend.key = ggplot2::element_rect(fill = page, colour = NA),
      panel.background = ggplot2::element_rect(fill = page, colour = NA)
    )
}

# Page colours from `offwhite.scss` in lds, rme and mcs
morrison_page_colours <- c(
  light = "#ffffff",
  offwhite = "#f5f2ea",
  parchment = "#f1e8d0"
)
