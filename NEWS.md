# qnp 0.0.0.9001

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
