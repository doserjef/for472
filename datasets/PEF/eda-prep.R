library(fields)
library(MBA)
library(rgdal)
dat <- read.csv("PEF-plots.csv")

lvis <- read.csv("PEF-LVIS.csv.gz")

head(lvis)
PEF.shp <- readOGR(".","MU-bounds")
b.box <- as.vector(t(bbox(PEF.shp)))

h <- 20
surf <- mba.surf(lvis[,c(1,2,h)], no.X=100, no.Y=100, b.box=b.box, sp=TRUE, extend=TRUE)$xyz.est
proj4string(surf) <- proj4string(PEF.shp)
surf <- as.image.SpatialGridDataFrame(surf[PEF.shp,])
image.plot(surf, xaxs = "r", yaxs = "r", xlab="Easting (m)", ylab="Northing (m)")
plot(PEF.shp, add=TRUE)
points(dat[,c("easting","northing")], pch=19, cex=0.5)

h*0.3

h <- 50
surf <- mba.surf(lvis[,c(1,2,h)], no.X=100, no.Y=100, b.box=b.box, sp=TRUE, extend=TRUE)$xyz.est
proj4string(surf) <- proj4string(PEF.shp)
surf <- as.image.SpatialGridDataFrame(surf[PEF.shp,])
image.plot(surf, xaxs = "r", yaxs = "r", xlab="Easting (m)", ylab="Northing (m)")
plot(PEF.shp, add=TRUE)
points(dat[,c("easting","northing")], pch=19, cex=0.5)

h*0.3
