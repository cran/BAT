% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{gamma}
\alias{gamma}
\title{Gamma diversity (Taxon, Phylogenetic or Functional Diversity - TD, PD, FD).}
\usage{
gamma(comm, tree)
}
\arguments{
\item{comm}{A sites x species matrix, with either abundance or incidence data.}

\item{tree}{A phylo or hclust object (used only for PD or FD) or alternatively a species x traits matrix or data.frame to build a functional tree.}
}
\value{
A single value of gamma.
}
\description{
Observed richness among multiple sites.
}
\details{
TD is equivalent to species richness. Calculations of PD and FD are based on Faith (1992) and Petchey & Gaston (2002, 2006), which measure PD and FD of a community as the total branch length of a tree linking all species represented in such community.
PD and FD are calculated based on a tree (hclust or phylo object, no need to be ultrametric). The path to the root of the tree is always included in calculations of PD and FD.
The number and order of species in comm must be the same as in tree.
}
\examples{
comm <- matrix(c(0,0,1,1,0,0,2,1,0,0), nrow = 2, ncol = 5, byrow = TRUE)
trait = 1:5
tree <- hclust(dist(c(1:5), method = "euclidean"), method = "average")
alpha(comm)
gamma(comm)
gamma(comm, trait)
gamma(comm, tree)
}
\references{
Faith, D.P. (1992) Conservation evaluation and phylogenetic diversity. Biological Conservation, 61, 1-10.

Petchey, O.L. & Gaston, K.J. (2002) Functional diversity (FD), species richness and community composition. Ecology Letters, 5, 402-411.

Petchey, O.L. & Gaston, K.J. (2006) Functional diversity: back to basics and looking forward. Ecology Letters, 9, 741-758.
}
