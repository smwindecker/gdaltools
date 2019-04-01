#' Crop shapefile
#'
#' @param input_file Shapefile, including path, to reproject
#' @param output_file Shapefile, including path, to save as
#' @param ext Target extent (xmin, xmax, ymin, ymax) to which shapefile should be cropped. Same projection as input.
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' crop_shp('my_path/lakes.shp', 'my_path/crop_lakes.shp',
#'           ext = c(5, 15, 47, 55)
#' }
crop_shp <- function (input_file, output_file, ext) {
  system(sprintf(
    'ogr2ogr -clipsrc %s %s %s',
    paste(ext[c(1, 3, 2, 4)], collapse = " "),
    paste0("'", output_file, "'"),
    paste0("'", input_file, "'")
  ))
}
