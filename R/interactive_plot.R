#' Make a plot interactive in HTML output
#'
#' Wraps a [ggplot2][ggplot2::ggplot] plot so that it is
#' interactive in HTML output
#' (via [plotly::ggplotly()])
#' and unchanged in all other output formats,
#' such as PDF or Word.
#'
#' In HTML output,
#' the interactive plot is placed inside a `<div>`
#' with `role = "img"` and `aria-label = alt`,
#' so that screen readers announce the plot
#' as a single image with the text alternative `alt`,
#' rather than traversing the internals of the plotly widget.
#'
#' @param plot
#' A [ggplot2][ggplot2::ggplot] plot object.
#' @param alt
#' A string giving the text alternative (alt text) for the plot.
#' Only used in HTML output.
#' @param is_html
#' Whether the current output format is HTML.
#' Defaults to [knitr::is_html_output()],
#' which detects the format of the document being rendered.
#'
#' @return
#' If `is_html` is `FALSE`,
#' `plot`, unchanged.
#' Otherwise,
#' an [htmltools::div()] tag containing the interactive plotly widget.
#'
#' @export
#'
#' @examplesIf requireNamespace("ggplot2", quietly = TRUE)
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point()
#'
#' # non-HTML output: the ggplot is returned unchanged
#' interactive_plot(
#'   plot = p,
#'   alt = "Scatterplot of fuel economy versus car weight",
#'   is_html = FALSE
#' )
#'
#' # HTML output: an interactive widget wrapped in an accessible `div`
#' interactive_plot(
#'   plot = p,
#'   alt = "Scatterplot of fuel economy versus car weight",
#'   is_html = TRUE
#' )
interactive_plot <- function(
  plot,
  alt,
  is_html = knitr::is_html_output()
) {
  if (!is_html) {
    return(plot)
  }

  widget <-
    plotly::ggplotly(plot) |>
    plotly::config(
      displaylogo = FALSE,
      responsive = TRUE
    )

  htmltools::div(
    role = "img",
    `aria-label` = alt,
    widget
  )
}
