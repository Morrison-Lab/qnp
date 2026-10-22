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
})

test_that("scale_colour_morrison() falls back to Safe with a warning", {
  skip_if_not_installed("ggplot2")

  scale <- scale_colour_morrison()

  expect_warning(colours <- scale$palette(8), "More than 7 groups")
  expect_identical(colours, rcartocolor::carto_pal(12, "Safe")[1:8])
  expect_error(scale$palette(12), "at most 11")
})

test_that("the Morrison palette never contains the missing-value grey", {
  skip_if_not_installed("ggplot2")

  scale <- scale_fill_morrison()

  expect_length(scale$palette(7), 7)
  expect_no_warning(scale$palette(7))
  colours <- suppressWarnings(scale$palette(11))
  expect_length(colours, 11)
  expect_false("#888888" %in% colours)
  expect_error(scale$palette(0), "positive whole number")
  expect_error(scale$palette(7.5), "positive whole number")
})

test_that("a plot with 9 groups warns once and builds", {
  skip_if_not_installed("ggplot2")

  p <- ggplot2::ggplot(
    data.frame(x = 1:9, y = 1:9, g = factor(1:9)),
    ggplot2::aes(x, y, colour = g)
  ) +
    ggplot2::geom_point() +
    scale_colour_morrison(name = "Group")

  expect_warning(ggplot2::ggplot_build(p), "More than 7 groups")
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
