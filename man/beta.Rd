% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{beta}
\alias{beta}
\title{Beta diversity (Taxon, Phylogenetic or Functional Diversity - TD, PD, FD).}
\usage{
beta(
  comm,
  tree,
  func = "jaccard",
  abund = TRUE,
  raref = 0,
  runs = 100,
  comp = FALSE
)
}
\arguments{
\item{comm}{A sites x species matrix, with either abundance or incidence data.}

\item{tree}{A phylo or hclust object (used only for PD or FD) or alternatively a species x traits matrix or data.frame to build a functional tree.}

\item{func}{Partial match indicating whether the Jaccard or Soerensen family of beta diversity measures should be used.  If not specified, default is Jaccard.}

\item{abund}{A boolean (T/F) indicating whether abundance data should be used or converted to incidence before analysis.}

\item{raref}{An integer specifying the number of individuals for rarefaction (individual based).
If raref < 1 no rarefaction is made.
If raref = 1 rarefaction is made by the minimum abundance among all sites.
If raref > 1 rarefaction is made by the abundance indicated.
If not specified, default is 0.}

\item{runs}{Number of resampling runs for rarefaction. If not specified, default is 100.}

\item{comp}{Boolean indicating whether beta diversity components (shared and unique fractions) should be returned.}
}
\value{
Three distance matrices between sites, one per each of the three beta diversity measures (either "Obs" OR "Mean, Median, Min, LowerCL, UpperCL and Max").
}
\description{
Beta diversity with possible rarefaction, multiple sites simultaneously.
}
\details{
The beta diversity measures used here follow the partitioning framework independently developed by Podani & Schmera (2011) and Carvalho et al. (2012)
and later expanded to PD and FD by Cardoso et al. (2014), where Btotal = Brepl + Brich.
Btotal = total beta diversity, reflecting both species replacement and loss/gain;
Brepl = beta diversity explained by replacement of species alone; Brich = beta diversity explained by species loss/gain (richness differences) alone.
PD and FD are calculated based on a tree (hclust or phylo object, no need to be ultrametric). The path to the root of the tree is always included in calculations of PD and FD.
The number and order of species in comm must be the same as in tree.
The rarefaction option is useful to compare communities with much different numbers of individuals sampled, which might bias diversity comparisons (Gotelli & Colwell 2001).
}
\examples{
comm <- matrix(c(2,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,1,2,2), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
beta(comm)
beta(comm, abund = FALSE, comp = TRUE)
beta(comm, tree)
beta(comm, raref = 1)
beta(comm, tree, "s", abund = FALSE, raref = 2)
}
\references{
Cardoso, P., Rigal, F., Carvalho, J.C., Fortelius, M., Borges, P.A.V., Podani, J. & Schmera, D. (2014) Partitioning taxon, phylogenetic and functional beta diversity into replacement and richness difference components. Journal of Biogeography, 41, 749-761.

Carvalho, J.C., Cardoso, P. & Gomes, P. (2012) Determining the relative roles of species replacement and species richness differences in generating beta-diversity patterns. Global Ecology and Biogeography, 21, 760-771.

Gotelli, N.J. & Colwell, R.K. (2001) Quantifying biodiversity: procedures and pitfalls in the measurement and comparison of species richness. Ecology Letters, 4, 379-391.

Podani, J. & Schmera, D. (2011) A new conceptual and methodological framework for exploring and explaining pattern in presence-absence data. Oikos, 120, 1625-1638.
}
