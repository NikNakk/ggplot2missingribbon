#' Generate a test PNG
#'
#' @param file_name file to write
#'
#' @return invisibly returns the plot
#' @export
#'
#' @examples check_png("test.png)
check_png <- function(file_name) {
  grDevices::png(file_name)
  on.exit(grDevices::dev.off())
  my_plot <- ggplot2::ggplot(data.frame(x = 1:10, ymin = 1:10, ymax = 10 + 1:10), aes(x)) +
    ggplot2::geom_ribbon(aes(ymin = ymin, ymax = ymax), alpha = 0.5) +
    ggplot2::coord_cartesian(c(1, 9))
  invisible(my_plot)
}
