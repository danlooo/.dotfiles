library(tidyverse)

options(
	mc.cores = 20,
	shiny.fullstacktrace = TRUE,
	shiny.error = browser
)

#
# Default ggplot theme
#
na_color <- "grey"
scale_fill_discrete <- function(...) ggplot2::scale_fill_viridis_d(na.value = na_color, ...)
scale_fill_continuous <- function(...) ggplot2::scale_fill_viridis_c(na.value = na_color, ...)
scale_color_discrete <- function(...) ggplot2::scale_color_viridis_d(na.value = na_color, ...)
scale_color_continuous <- function(...) ggplot2::scale_color_viridis_c(na.value = na_color, ...)
scale_colour_discrete <- function(...) ggplot2::scale_colour_viridis_d(na.value = na_color, ...)
scale_colour_continuous <- function(...) ggplot2::scale_colour_viridis_c(na.value = na_color, ...)

bg_color <- "grey"
theme_my <-
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.line.x = ggplot2::element_line(size = 0.8),
    axis.line.y = ggplot2::element_line(size = 0.8),
    axis.ticks = ggplot2::element_line(colour = "black", size = 0.8),
    axis.text = ggplot2::element_text(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    strip.text.x = element_text(margin = margin(0,0,0,0)),
    strip.text.y = element_text(margin = margin(0,0,0,0))
  )
ggplot2::theme_set(theme_my)
ggplot2::update_geom_defaults("bar", base::list(fill = bg_color))
