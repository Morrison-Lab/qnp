test_that("interactive_plot() returns the plot unchanged if not HTML", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point()

  result <- interactive_plot(
    plot = p,
    alt = "Scatterplot of mpg versus weight",
    is_html = FALSE
  )

  expect_identical(result, p)
})

test_that("interactive_plot() wraps a plotly widget in a div if HTML", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point()
  alt <- "Scatterplot of mpg versus weight"

  result <- interactive_plot(
    plot = p,
    alt = alt,
    is_html = TRUE
  )

  expect_s3_class(result, "shiny.tag")
  expect_identical(result$name, "div")
  expect_identical(result$attribs$role, "img")
  expect_identical(result$attribs$`aria-label`, alt)

  widget <- result$children[[1]]
  expect_s3_class(widget, "plotly")
  expect_false(widget$x$config$displaylogo)
  expect_true(widget$x$config$responsive)
})

test_that("interactive_plot() defaults is_html to knitr::is_html_output()", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point()

  # outside of a knitr render, no output format is set,
  # so the default is not HTML
  expect_identical(
    interactive_plot(plot = p, alt = "Scatterplot"),
    p
  )

  testthat::local_mocked_bindings(
    is_html_output = function(...) TRUE,
    .package = "knitr"
  )
  expect_s3_class(
    interactive_plot(plot = p, alt = "Scatterplot"),
    "shiny.tag"
  )
})

test_that("interactive_plot() requires a single, non-empty alt string", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point()

  for (is_html in c(FALSE, TRUE)) {
    expect_error(
      interactive_plot(plot = p, is_html = is_html),
      "alt"
    )
    expect_error(
      interactive_plot(plot = p, alt = "", is_html = is_html),
      "non-empty string"
    )
    expect_error(
      interactive_plot(plot = p, alt = "  ", is_html = is_html),
      "non-empty string"
    )
    expect_error(
      interactive_plot(plot = p, alt = NA_character_, is_html = is_html),
      "non-empty string"
    )
    expect_error(
      interactive_plot(plot = p, alt = c("a", "b"), is_html = is_html),
      "non-empty string"
    )
    expect_error(
      interactive_plot(plot = p, alt = NULL, is_html = is_html),
      "non-empty string"
    )
  }
})
