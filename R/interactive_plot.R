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
#' A single, non-empty string giving the text alternative (alt text)
#' for the plot.
#' Required, so that a missing alt text is caught in every output format.
#' It only appears in the output in HTML format.
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
  .validate_alt(alt)

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

#' Check that `alt` is a single, non-empty string
#'
#' @param alt The value to check.
#' @param call The environment of the calling function, for error messages.
#' @return `alt`, invisibly.
#' @noRd
.validate_alt <- function(alt, call = parent.frame()) {
  valid <-
    is.character(alt) &&
    length(alt) == 1 &&
    !is.na(alt) &&
    nzchar(trimws(alt))

  if (!valid) {
    cli::cli_abort(
      c(
        "{.arg alt} must be a single, non-empty string.",
        i = "Screen readers announce it as the text alternative for the plot."
      ),
      call = call
    )
  }

  invisible(alt)
}
