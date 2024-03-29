% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{kernel.evenness.contribution}
\alias{kernel.evenness.contribution}
\title{Contribution of each observation to the evenness of a kernel density hypervolume.}
\usage{
kernel.evenness.contribution(comm)
}
\arguments{
\item{comm}{A 'Hypervolume' or 'HypervolumeList' object, preferably built using function kernel.build.}
}
\value{
A vector or matrix with the contribution values of each species or individual for each community or species respectively.
}
\description{
Contribution of each species or individual to the evenness of one or more kernel hypervolumes.
}
\details{
The contribution of each observation (species or individual) to the total evenness of a kernel hypervolume. Contribution to evenness is calculated as the difference in evenness between the total hypervolume and a second hypervolume lacking this specific observation (i.e., leave-one-out approach; Mammola & Cardoso, 2020). 
Note that the contribution of a species or individual can be negative, if the removal of an observation increases the total evenness.
}
\examples{
\dontrun{
comm = rbind(c(100,3,0,5,3), c(3,2,5,1,0))
colnames(comm) = c("SpA", "SpB", "SpC", "SpD", "SpE")
rownames(comm) = c("Site 1", "Site 2")

trait = data.frame(body = c(1,2,3,4,4), beak = c(1,5,4,1,2))
rownames(trait) = colnames(comm)

hv = kernel.build(comm[1,], trait)
kernel.evenness.contribution(hv)
hvlist = kernel.build(comm, trait)
kernel.evenness.contribution(hvlist)
hvlist = kernel.build(comm, trait, axes = 0.8)
kernel.evenness.contribution(hvlist)
}
}
\references{
Mammola, S. & Cardoso, P. (2020) Functional diversity metrics using kernel density n-dimensional hypervolumes. Methods in Ecology and Evolution, 11: 986-995.
}
