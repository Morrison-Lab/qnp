test_that("theme_morrison() is a complete theme with a bottom legend", {
  skip_if_not_installed("ggplot2")

  th <- theme_morrison()

  expect_s3_class(th, "theme")
  expect_identical(th$legend.position, "bottom")
})

test_that("theme_morrison() background follows the palette", {
  skip_if_not_installed("ggplot2")

  expect_identical(
    theme_morrison(palette = "parchment")$plot.background$fill,
    "#f1e8d0"
  )
  expect_error(theme_morrison(palette = "dark"))
})

test_that("scale_colour_morrison() gives Okabe-Ito colours in order", {
  skip_if_not_installed("ggplot2")

  scale <- scale_colour_morrison()

  expect_identical(
    unname(scale$palette(7)),
    c(
      "#0072B2", "#D55E00", "#009E73", "#CC79A7",
      "#56B4E9", "#E69F00", "#F0E442"
    )
  )
  expect_error(scale$palette(8), "7 provided")
})

test_that("the Morrison scales and theme build a plot", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(
    mtcars,
    ggplot2::aes(wt, mpg, colour = factor(cyl), fill = factor(cyl))
  ) +
    ggplot2::geom_point() +
    theme_morrison() +
    scale_colour_morrison() +
    scale_fill_morrison()

  expect_no_error(ggplot2::ggplotGrob(p))
})
