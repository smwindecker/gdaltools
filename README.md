# gdaltools

## Installation

You can install gdaltools from Github:

``` r
devtools::install_github("smwindecker/gdaltools")
```

You'll need to have gdal installed on your computer. You can check if dgal is already installed by opening a new terminal (in RStudio, Tools > Terminal > New Terminal), and typing:
```
gdalinfo --version
```
If you get a version returned, it's already installed. If not, read how to install [here](https://tilemill-project.github.io/tilemill/docs/guides/gdal/). If you are getting a `sh: command not found` error when running the `gdaltools` functions on a Mac, see note at bottom.

## Background

We want to do spatial processing in R so that our data preparation steps are reproducible, but this is often very slow! Executing spatial processing steps like reprojecting or rasterizing is much faster using `gdal` from the terminal. However, writing in command language is not very familiar to many R users, so this package contains a few functions to do call to gdal from within R, in a simple format for easy and fast replication. 

## Examples

### Reproject a raster
``` r
reproj_ras('my_path/r.tif', 'my_path/reproj_temp.tif',
           crs = CRS('+proj=utm +zone=55 +south +ellps=GRS80 +units=m +no_defs'),
           res = 1000,
           ext = c(-58000, 764000, 5661000, 6224000))
```

### Reproject a shapefile
```r 
reproj_shp('my_path/lakes.shp', 'my_path/reproj_lakes.shp',
           crs = CRS('+proj=utm +zone=55 +south +ellps=GRS80 +units=m +no_defs'))
```

### Rasterize a shapefile
``` r
rasterize_shp('my_path/reproj_lakes.shp', 'my_path/lakes.tif',
              res = 1000,
              ext = c(-58000, 764000, 5661000, 6224000),
              attribute = "size")
```

### Calculate proximity in a raster
``` r
proximity_ras('my_path/lakes.tif', 'my_path/dist_lakes.tif')
```

### Calculate slope
``` r
slope_ras('my_path/dem.img', 'my_path/slope.tif')
```

===========

** I found as a mac user I had to modify my PATH to get gdal to work. To do so in RStudio, you can use Tools > Terminal > New Terminal, then type `cd ~` to move to base directory, `nano .Renviron` to create or open an existing .Renviron file, then add in the following to that file:
```
PATH=/Library/Frameworks/GDAL.framework/Programs:$PATH
```
Finally, control X to exit, restart R, and hopefully no further issues!
