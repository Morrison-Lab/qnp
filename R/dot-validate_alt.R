#' Check that alt text is a single non-empty string
#'
#' @param alt The value to check.
#'
#' @return `alt`, invisibly. Called for its error.
#' @noRd
.validate_alt <- function(alt) {
  is_valid <- is.character(alt) &&
    length(alt) == 1 &&
    !is.na(alt) &&
    nzchar(trimws(alt))

  if (!is_valid) {
    cli::cli_abort(
      "{.arg alt} must be a single non-empty string of alt text."
    )
  }

  invisible(alt)
}
