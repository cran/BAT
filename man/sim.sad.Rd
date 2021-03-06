% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{sim.sad}
\alias{sim.sad}
\title{Simulation of species abundance distributions (SAD).}
\usage{
sim.sad(n, s, sad = "lognormal", sd = 1)
}
\arguments{
\item{n}{total number of individuals.}

\item{s}{number of species.}

\item{sad}{The SAD distribution type (lognormal, uniform, broken stick or geometric). Default is lognormal.}

\item{sd}{The standard deviation of lognormal distributions. Default is 1.}
}
\value{
A matrix of species x abundance per species.
}
\description{
Creates artificial communities following given SADs.
}
\details{
Species Abundance Distributions may take a number of forms. A lognormal SAD probably is the most supported by empirical data, but we include other common types useful for testing multiple algorithms including several of the functions in BAT.
}
\examples{
comm1 <- sim.sad(10000, 100)
comm2 <- sim.sad(10000, 100, sd = 2)
comm3 <- sim.sad(10000, 100, sad = "uniform")
par(mfrow=c(1,3))
hist(log(comm1$Freq))
hist(log(comm2$Freq))
hist(log(comm3$Freq))
}
