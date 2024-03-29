% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{kernel.sad}
\alias{kernel.sad}
\title{Species-abundance distribution (SAD) using kernel density hypervolumes.}
\usage{
kernel.sad(comm, octaves = TRUE, scale = FALSE, raref = 0, runs = 100)
}
\arguments{
\item{comm}{A 'Hypervolume' or 'HypervolumeList' object necessarily built using function kernel.build.}

\item{octaves}{a boolean indicating whether octaves should be calculated.}

\item{scale}{scale y-axis to sum 1.}

\item{raref}{An integer specifying the number of individuals for rarefaction (individual based).
If raref < 1 no rarefaction is made.
If raref = 1 rarefaction is made by the minimum abundance among all sites.
If raref > 1 rarefaction is made by the abundance indicated.
If not specified, default is 0.}

\item{runs}{Number of resampling runs for rarefaction. If not specified, default is 100.}
}
\value{
A vector or matrix with the different values per class per community.
}
\description{
Fits the SAD to community abundance data based on n-dimensional hypervolumes.
}
\details{
The Species Abundance Distribution describes the commonness and rarity in ecological systems. It was recently expanded to accomodate phylegenetic and functional differences between species (Matthews et al., subm.). Classes defined as n = 1, 2-3, 4-7, 8-15, .... Rarefaction allows comparison of sites with different total abundances.
}
\examples{
\dontrun{
comm = rbind(c(1,3,0,5,3), c(3,2,5,1,0))
colnames(comm) = c("SpA", "SpB", "SpC", "SpD", "SpE")
rownames(comm) = c("Site 1", "Site 2")

trait = data.frame(body = c(1,2,3,4,4), beak = c(1,5,4,1,2))
rownames(trait) = colnames(comm)

hv = kernel.build(comm, trait)
kernel.sad(hv, scale = TRUE)
kernel.sad(hv, octaves = FALSE)
kernel.sad(hv, raref = TRUE)
}
}
\references{
Matthews et al. (subm.) Phylogenetic and functional dimensions of the species abundance distribution.
}
