#' Reproject shapefile
#'
#' @param input_file Shapefile, including path, to reproject
#' @param output_file Shapefile, including path, to save as
#' @param crs Target reprojection
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' reproj_shp('my_path/lakes.shp', 'my_path/reproj_lakes.shp',
#'           crs = '+proj=utm +zone=55 +south +ellps=GRS80 +units=m +no_defs')
#' }
reproj_shp <- function (input_file, output_file, crs) {

  system(paste("ogr2ogr -overwrite -t_srs",
               paste0("'", crs, "'"),
               output_file,
               input_file))

}
