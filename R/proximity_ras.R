#' Calculate proximity of raster file
#'
#' @param input_file Raster file, including path, to calculate from
#' @param output_file Raster file, including path, to save as
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' proximity_ras('my_path/roads.tif', 'my_path/dist_roads.tif')
#' }
proximity_ras <- function (input_file, output_file) {

  system(paste("gdal_proximity.py",
               "'", input_file, "'",
               "'", output_file, "'",
                "-values 1 -distunits GEO -of GTiff"))

}
