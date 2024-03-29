% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{optim.spatial}
\alias{optim.spatial}
\title{Optimization of spatial sampling.}
\usage{
optim.spatial(layers, n, latlong = TRUE, clusterMap = TRUE)
}
\arguments{
\item{layers}{A SpatRaster object from package terra.}

\item{n}{The number of intended sampling sites (clusters).}

\item{latlong}{Boolean indicating whether latitude and longitude should be taken into account when clustering.}

\item{clusterMap}{Boolean indicating whether to build a new raster with clusters.}
}
\value{
Either a matrix of cells x clusters (also indicating distance to centroid, longitude and latitude of each cell) or a list with such matrix plus the clusterMap.
}
\description{
Optimization of sampling site distribution in space based on environmental (or other) variables.
}
\details{
Optimizing the selection of sampling sites often requires maximizing the environmental diversity covered by them.
One possible solution to this problem, here adopted, is performing a k-means clustering using environmental data and choosing the sites closest to the multidimensional environmental centroid of each cluster for sampling (Jimenez-Valverde & Lobo 2004)
}
\references{
Jimenez-Valverde, A., & Lobo, J. M. (2004) Un metodo sencillo para seleccionar puntos de muestreo con el objetivo de inventariar taxones hiperdiversos: el caso practico de las familias Araneidae y Thomisidae (Araneae) en la comunidad de Madrid, Espana. Ecologia, 18: 297-305.
}
