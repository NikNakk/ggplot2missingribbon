#' Generate a test PNG
#'
#' @param file_name file to write
#'
#' @return invisibly returns the plot
#' @export
#'
#' @examples check_png("test.png")
check_png <- function(file_name) {
  grDevices::png(file_name)
  on.exit(grDevices::dev.off())
  my_plot <- ggplot2::ggplot(data.frame(x = 1:10, ymin = 1:10, ymax = 10 + 1:10), ggplot2::aes(x)) +
    ggplot2::geom_ribbon(ggplot2::aes(ymin = ymin, ymax = ymax), alpha = 0.5) +
    ggplot2::coord_cartesian(c(1, 9)) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank()
    )
  print(my_plot)
  invisible(my_plot)
}

#' Produce a plot using grid only
#'
#' @param file_name file to write
#'
#' @return invisibly returns the plot
#' @export
#'
#' @examples check_png_grid("test.png")
check_png_grid <- function(file_name) {
  grDevices::png(file_name)
  on.exit(grDevices::dev.off())
  my_gt <- gtable::gtable(widths = grid::unit(c(0.1, 1, 0.1), "null"),
                   heights = grid::unit(c(0.1, 1, 0.1), "null"))
  my_poly <- grid::polygonGrob(
      grid::unit(c(0.05, 1.07, 1.07, 0.05), "native"),
      grid::unit(c(0.5, 0.95, 0.48, 0.05), "native"),
      id = rep(1, 4),
      gp = grid::gpar(fill = "#33333380")
    )
  my_gt <- gtable::gtable_add_grob(my_gt, my_poly, 2, 2, 2, 2, 1, "on")
  grid::grid.newpage()
  grid::grid.draw(my_gt)
}
