% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BAT.R
\name{r2}
\alias{r2}
\title{Model R2.}
\usage{
r2(obs, est = NULL, param = 0)
}
\arguments{
\item{obs}{Either a model or a vector with observed values.}

\item{est}{A vector with estimated values. Only used if obs is not a model.}

\item{param}{Number of parameters in the model to calculate the adjusted R2 if > 0. If obs is a model param will be ignored and the number of parameters will be calculated from the model.}
}
\value{
The r2 value.
}
\description{
Calculates R2 from the summed squared differences between observed and estimated values.
}
\details{
Useful for models or functions that do not provide r2 values.
}
\examples{
obs = c(1,4,5,6)
est = c(0,1,4,7)

#example using values
r2(obs, est)
r2(obs, est, param = 1)

#example using model
mod = lm(obs ~ est)
r2(mod)
summary(mod)$r.squared
r2(mod, param = 1)
summary(mod)$adj.r.squared

}
