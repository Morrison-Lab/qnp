# Using qnp

`{qnp}` ("quarto-notes plots") provides helpers for including plots
in Quarto notes.

## Installation

```r
# install.packages("pak")
pak::pak("Morrison-Lab/qnp")
```

## `interactive_plot()`

`interactive_plot(plot, alt, is_html = knitr::is_html_output())`
makes a [ggplot2](https://ggplot2.tidyverse.org/) plot interactive
in HTML output
and leaves it unchanged in other output formats
(PDF, Word, slides rendered to PDF, and so on).
Use it as the last expression of a chunk in a Quarto note:

````markdown
```{r}
#| label: fig-mpg-vs-weight
library(ggplot2)

p <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

qnp::interactive_plot(
  plot = p,
  alt = "Scatterplot of fuel economy versus car weight"
)
```
````

In HTML output,
the plot is converted with
[`plotly::ggplotly()`](https://plotly.com/ggplot2/),
with the plotly logo removed from the mode bar
and responsive resizing turned on.
The widget is wrapped in a `<div>`
with `role = "img"` and `aria-label` set to `alt`,
so screen readers announce a single image with the given text alternative.

In all other formats,
the original `ggplot` object is returned,
so it is printed by knitr as usual.

## Development

```r
# Install all dependencies
devtools::install_dev_deps()

# Update documentation, run the tests, and check the package
devtools::document()
devtools::test()
devtools::check()

# Check code style and spelling
lintr::lint_package()
spelling::spell_check_package()
```

See [`CLAUDE.md`](CLAUDE.md) and
[`.github/copilot-instructions.md`](.github/copilot-instructions.md)
for the full validation workflow,
including building and previewing the documentation site
with `altdoc::render_docs()` and `altdoc::preview_docs()`.
