% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{kernel.build}
\alias{kernel.build}
\title{Build kernel hypervolumes.}
\usage{
kernel.build(
  comm,
  trait,
  distance = "gower",
  method.hv = "gaussian",
  abund = TRUE,
  weight = NULL,
  axes = 0,
  convert = NULL,
  cores = 1,
  ...
)
}
\arguments{
\item{comm}{A sites x species matrix, data.frame or vector, with incidence or abundance data about the species in the community.}

\item{trait}{A species x traits or axes matrix or data.frame (often from hyper.build) or, alternatively, a dist object.}

\item{distance}{One of "gower" or "euclidean". Not used if trait is a dist object.}

\item{method.hv}{Method for constructing the 'Hypervolume' object. One of "gaussian" (Gaussian kernel density estimation, default), "box" (box kernel density estimation), or "svm" (one-class support vector machine). See respective functions of the hypervolume R package for details.}

\item{abund}{A boolean (T/F) indicating whether abundance data should be used as weights in hypervolume construction. Only works if method.hv = "gaussian".}

\item{weight}{A vector of column numbers with weights for each variable. Its length must be equal to the number of columns in trait. Only used if axes > 0 and if trait is not a dist object.}

\item{axes}{If 0, no transformation of data is done.
If 0 < axes <= 1 a PCoA is done with Gower/euclidean distances and as many axes as needed to achieve this proportion of variance explained are selected.
If axes > 1 these many axes are selected.}

\item{convert}{A vector of column numbers, usually categorical variables, to be converted to dummy variables. Only used if axes > 0 and if trait is not a dist object.}

\item{cores}{Number of cores to be used in parallel processing. If = 0 all available cores are used. Beware that multicore for Windows is not optimized yet and it often takes longer than single core.}

\item{...}{further arguments to be passed to hypervolume::hypervolume}
}
\value{
A 'Hypervolume' or 'HypervolumeList', representing the hypervolumes of each community.
}
\description{
Builds kernel density hypervolumes from trait data.
}
\details{
The hypervolumes can be constructed with the given data or data can be transformed using PCoA after traits are dummyfied (if needed) and standardized (always).
Beware that if transformations are required, all communities to be compared should be built simultaneously to guarantee comparability. In such case, one might want to first run hyper.build and use the resulting data in different runs of kernel.build.
See function hyper.build for more details.
}
\examples{
\dontrun{
comm = rbind(c(1,1,0,5,1), c(3,2,5,0,0))
colnames(comm) = c("SpA", "SpB", "SpC", "SpD", "SpE")
rownames(comm) = c("Site1", "Site2")

trait = data.frame(body = c(1,2,3,1,2), beak = c(1,2,3,2,1))
rownames(trait) = colnames(comm)

hv = kernel.build(comm[1,], trait)
plot(hv)
hvlist = kernel.build(comm, trait, abund = FALSE, cores = 2)
plot(hvlist)
hvlist = kernel.build(comm, trait, method.hv = "box", weight = c(1,2), axes = 2)
plot(hvlist)
}
}
