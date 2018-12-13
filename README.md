# gdaltools

## Installation

You can install gdaltools from Github:

``` r
devtools::install_github("smwindecker/gdaltools")
```

We want to do spatial processing in R so that our data preparation steps are reproducible, but this is often very slow! Calling `gdal` from the terminal is much faster, so this package contains a few wrapper functions to do system calls to gdal from within R, in a simple format for easy and fast replication. 

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

