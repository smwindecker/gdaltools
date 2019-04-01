#' Calculate slope
#'
#' @param input_file Raster file, including path, to calculate slope from
#' @param output_file Raster file, including path, to save to
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' slope_ras('my_path/dem.img', 'my_path/slope.tif')
#' }
slope_ras <- function (input_file, output_file) {

  system(paste("gdaldem slope -p",
              paste0("'", input_file, "'"),
               paste0("'", output_file, "'")
              ))

}

