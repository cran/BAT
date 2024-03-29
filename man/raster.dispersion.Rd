% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{raster.dispersion}
\alias{raster.dispersion}
\title{Maps of phylogenetic/functional dispersion of species or individuals.}
\usage{
raster.dispersion(
  layers,
  tree,
  distance,
  func = "originality",
  abund = FALSE,
  relative = FALSE
)
}
\arguments{
\item{layers}{A SpatRaster object of species distributions from package terra.}

\item{tree}{A phylo or hclust object or alternatively a species x traits matrix or data.frame to build a functional tree.}

\item{distance}{A dist object representing the phylogenetic or functional distance between species.}

\item{func}{Calculate dispersion using originality (default), uniqueness or contribution.}

\item{abund}{A boolean (T/F) indicating whether dispersion should be calculated using individuals (T) or species (F).}

\item{relative}{A boolean (T/F) indicating whether dispersion should be relative to the maximum distance between any two species in the tree or distance matrix.}
}
\value{
A SpatRaster object representing dispersion in space.
}
\description{
Average dissimilarity between any two species or individuals randomly chosen in a community using rasters of species distributions (presence/absence or abundance).
}
\details{
If abundance data is used and a tree is given, dispersion is the quadratic entropy of Rao (1982).
If abundance data is not used but a tree is given, dispersion is the phylogenetic dispersion measure of Webb et al. (2002).
Note that cells with less than two species cannot have dispersion values.
}
\examples{
sp1 <- terra::rast(matrix(c(NA,1,1,1,1,0,0,0,0), nrow = 3, ncol = 3, byrow = TRUE))
sp2 <- terra::rast(matrix(c(0,0,0,0,1,1,1,1,1), nrow = 3, ncol = 3, byrow = TRUE))
sp3 <- terra::rast(matrix(c(0,0,0,1,1,1,0,0,0), nrow = 3, ncol = 3, byrow = TRUE))
spp <- c(sp1, sp2, sp3)
tree <- hclust(dist(c(1:3), method="euclidean"), method="average")
tree$labels = c("Sp1", "Sp2", "Sp3")
names(spp) = tree$labels
raster.dispersion(spp, tree)
}
\references{
Rao, C.R. (1982) Diversity and dissimilarity coefficients: a unified approach. Theoretical Population Biology, 21: 24-43.

Webb, C.O., Ackerly, D.D., McPeek, M.A. & Donoghue, M.J. (2002) Phylogenies and community ecology. Annual Review of Ecology and Systematics, 33: 475-505.
}
