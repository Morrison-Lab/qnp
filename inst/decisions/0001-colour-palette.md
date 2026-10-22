# Decision 0001: the Morrison colour palette

Date: 2026-10-22.
Decided by Ezra Morrison, who asked for one shared ggplot2 look for the lab's notes sites.

## Decision

- `scale_colour_morrison()` and `scale_fill_morrison()` use the Okabe-Ito palette from the `ggokabeito` package for up to 7 groups.
  The order is blue, vermillion, bluish green, reddish purple, sky blue, orange, yellow.
  Black and grey are left out because they look like text and missing values.
- For 8 to 12 groups the scales use the `"Safe"` palette of the `rcartocolor` package and warn that colour alone does not separate that many groups.
  More than 12 groups is an error.
- Pair colour with shape or line type whenever a figure has more than 3 or 4 groups.
  This rule is in [Principles of Scientific Writing](https://morrison-lab.github.io/psw/).

## Why

The test is `colorblindcheck::palette_check()`.
It reports the smallest distance between two colours under simulated colour vision deficiency.
A distance of about 10 or more is easy to tell apart.
The computed comparison is the table in the [Choosing Colors chapter of the visualization notes](https://morrison-lab.github.io/vds/chapters/colors.html).

- **Okabe-Ito** scores 12.1 at 3 and 5 groups and 11.1 at 7 groups.
- **RColorBrewer** `Dark2` and `Set2` score well at 3 groups and 1.6 to 3.4 at 5 groups, so they fail beyond 3 groups.
  `Paired` scores 8.2 at 3 and 5 groups.
- **khroma** `muted` has at most 9 colours.
  Its Okabe-Ito scheme starts with black.
- **viridis** is a sequential palette, so neighbouring colours look alike when the groups have no order.
- **rcartocolor** `Safe` scores about 5 to 6 at every size up to 12, so it is a fallback and not a recommendation.
  The `fxtas` package already uses it for up to 12 biomarker groups.
- **Base R** `palette.colors()` gives the same Okabe-Ito colours as `ggokabeito`.
  It was rejected because the lab prefers a maintained package with ggplot2 scales over base R.

## Alternatives not taken

- Typing the hex codes into qnp was rejected because the lab does not keep its own copy of values that a package supplies.
- `ggthemes` was rejected because it is a large package for one palette, and its colour-blind palette starts with black.
