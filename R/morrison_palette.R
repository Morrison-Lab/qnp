# Colours for `n` groups: the Morrison order of Okabe-Ito for up to 7 groups,
# then the 12-colour rcartocolor "Safe" palette, which is the largest
# colorblind-safe qualitative palette available.
# `n` is a single whole number of groups; the result is a character vector of
# `n` hex colours.
morrison_palette <- function(n) {
  if (n <= length(morrison_order)) {
    okabe_ito <- ggokabeito::palette_okabe_ito(order = morrison_order)
    return(unname(okabe_ito[seq_len(n)]))
  }
  if (n > 12) {
    cli::cli_abort(c(
      "A Morrison colour scale has at most 12 colours.",
      "x" = "{n} groups were requested.",
      "i" = "Combine groups or split the figure into panels."
    ))
  }
  cli::cli_warn(c(
    "More than 7 groups: colour alone does not separate them.",
    "i" = "Also vary shape or line type for the {n} groups."
  ))
  rcartocolor::carto_pal(n, "Safe")
}
