# Colours for `n` groups: the Morrison order of Okabe-Ito for up to 7 groups,
# then the rcartocolor "Safe" palette without its grey for up to 11 groups.
# Grey is dropped because it looks like ggplot2's default missing-value colour.
# `n` is a single whole number of groups; the result is a character vector of
# `n` hex colours.
morrison_palette <- function(n) {
  .validate_n_groups(n)
  if (n <= length(morrison_order)) {
    okabe_ito <- ggokabeito::palette_okabe_ito(order = morrison_order)
    return(unname(okabe_ito[seq_len(n)]))
  }
  if (n > morrison_max_groups) {
    cli::cli_abort(c(
      "A Morrison colour scale has at most {morrison_max_groups} colours.",
      "x" = "{n} groups were requested.",
      "i" = "Combine groups or split the figure into panels."
    ))
  }
  cli::cli_warn(c(
    "More than 7 groups: colour alone does not separate them.",
    "i" = "Also vary shape or line type for the {n} groups."
  ))
  safe <- rcartocolor::carto_pal(12, "Safe")
  safe[-length(safe)][seq_len(n)]
}
