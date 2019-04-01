#' Reproject raster file
#'
#' @param input_file Raster file, including path, to reproject
#' @param output_file Raster file, including path, to save as
#' @param crs Target reprojection
#' @param res Resolution value
#' @param ext Vector of four values: xmin, xmax, ymin, ymax
#'
#' @return Saved output file
#' @export
#'
#' @examples
#' \dontrun{
#' reproj_ras('my_path/temp.tif', 'my_path/reproj_temp.tif',
#'           crs = '+proj=utm +zone=55 +south +ellps=GRS80 +units=m +no_defs',
#'           res = 1000,
#'           ext = c(-58000, 764000, 5661000, 6224000))
#' }
reproj_ras <- function (input_file, output_file, crs, res, ext) {

  system(paste("gdalwarp -overwrite -tr",
               res, res, "-r bilinear -t_srs",
               paste0("'", crs, "'"),
               "-te", ext[1], ext[3], ext[2], ext[4],
               paste0("'", input_file, "'"),
               paste0("'", output_file, "'")
               ))
}
