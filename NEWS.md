# qnp 0.0.0.9002

* New `theme_morrison()`, `scale_colour_morrison()` and `scale_fill_morrison()`:
  a ggplot2 theme (from rme's, with the sites' page colours)
  and an Okabe-Ito colorblind-safe palette shared by the notes sites (#9).

* `R CMD check` no longer reports the `vignettes/macros/.claude` directory of the `macros` submodule as a hidden directory.

* The documentation check no longer fails when a newer `roxygen2` only rewrites
  the `Config/roxygen2/version` or `RoxygenNote` field in `DESCRIPTION`.
  It still fails on any other change to `DESCRIPTION`, `NAMESPACE`, or `man/`.

* Reset the version to 0.0.0.9000.
  The package template's inherited 1.0.2.x version was never a release of `{qnp}`.
* `interactive_plot()` now errors if `alt` is missing, empty, or not a single string,
  in every output format, so a figure cannot ship without alt text.
* Created `{qnp}` ("quarto-notes plots") from the
  [`Morrison-Lab/rpt`](https://github.com/Morrison-Lab/rpt) package template.
* Added `interactive_plot()`,
  which renders a `{ggplot2}` plot as an interactive `{plotly}` widget
  with a text alternative (`alt`) in HTML output,
  and returns the plot unchanged in other output formats.
