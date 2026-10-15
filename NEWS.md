# qnp 1.0.2.9006

* `interactive_plot()` now errors if `alt` is missing, empty, or not a single string,
  in every output format, so a figure cannot ship without alt text.

# qnp 1.0.2.9005

* Created `{qnp}` ("quarto-notes plots") from the
  [`Morrison-Lab/rpt`](https://github.com/Morrison-Lab/rpt) package template.
* Added `interactive_plot()`,
  which renders a `{ggplot2}` plot as an interactive `{plotly}` widget
  with a text alternative (`alt`) in HTML output,
  and returns the plot unchanged in other output formats.
