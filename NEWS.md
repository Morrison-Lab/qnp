# qnp 1.0.2.9005

* Created `{qnp}` ("quarto-notes plots") from the
  [`Morrison-Lab/rpt`](https://github.com/Morrison-Lab/rpt) package template.
* Added `interactive_plot()`,
  which renders a `{ggplot2}` plot as an interactive `{plotly}` widget
  with a text alternative (`alt`) in HTML output,
  and returns the plot unchanged in other output formats.
* `interactive_plot()` now requires `alt` to be a single, non-empty string
  in every output format,
  so that missing alt text is caught early rather than silently dropped.
