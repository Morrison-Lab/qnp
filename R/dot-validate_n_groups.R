# Check that `n` is a single positive whole number of groups.
# `n` is any R object; the result is `n` invisibly, or an error.
.validate_n_groups <- function(n) {
  valid <- is.numeric(n) && length(n) == 1 && !is.na(n) && n >= 1 &&
    n == round(n)
  if (!valid) {
    cli::cli_abort(c(
      "{.arg n} must be a single positive whole number of groups.",
      "x" = "It was {.obj_type_friendly {n}}."
    ))
  }
  invisible(n)
}
