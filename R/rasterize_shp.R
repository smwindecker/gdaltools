#' Convert shapefile to raster
#'
#' @param input_file Shapefile file, including path, to convert to raster
#' @param output_file Raster file, including path, to save as
#' @param res Resolution value
#' @param ext Vector of four values: xmin, xmax, ymin, ymax
#' @param attribute by which to rasterize. Defaults to null
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' rasterize_shp('my_path/lakes.shp', 'my_path/lakes.tif',
#'              res = 1000,
#'              ext = c(-58000, 764000, 5661000, 6224000),
#'              attribute = "size")
#' }
rasterize_shp <- function (input_file, output_file, res, ext, attribute = NULL) {

  if (is.null(attribute)) {
    system(paste0("gdal_rasterize -burn 1 -tr ",
                  res, " ", res, " -te ",
                  paste(ext[1], ext[3], ext[2], ext[4]), " ",
                  getwd(), "/", input_file, " ",
                  getwd(), "/", output_file))
  }

  if (!is.null(attribute)) {
    system(paste0("gdal_rasterize -a ", attribute, " -tr ",
                  res, " ", res, " -te ",
                  paste(ext[1], ext[3], ext[2], ext[4]), " ",
                  getwd(), "/", input_file, " ",
                  getwd(), "/", output_file))
  }

}
