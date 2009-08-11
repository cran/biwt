\name{biwtInternalFunctions}
\alias{biwtInternalFunctions}
\alias{chi.int2.p}
\alias{chi.int2}
\alias{chi.int.p}
\alias{chi.int}
\alias{erho.bw.p}
\alias{erho.bw}
\alias{ksolve}
\alias{psibw}
\alias{rejpt.bw}
\alias{rhobw}
\alias{vbw}
\alias{wtbw}
\alias{vect2diss}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Functions used internally for the biwt package }
\description{
Tukey's biweight gives robust estimates of a p-dimensional mean vector and covariance matrix.  These functions are used internally within the biweight estimation function.
}
\usage{
chi.int2.p(p, a, c1)
chi.int2(p,a,c1)
chi.int.p(p,a,c1)
chi.int(p,a,c1)
erho.bw.p(p,c1)
erho.bw(p,c1)
ksolve(d,p,c1,b0)
psibw(x,c1)
rhobw(x,c1)
vbw(x,c1)
wtbw(x,c1)
rejpt.bw(p,r)
vect2diss(v)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{ the dimension of the data (should be two if computing correlations. Unlike Pearson correlation, pairwise correlations will not be the same if computed on the entire data set as compared to one pair at a time.) }
  \item{a}{ degrees of freedom for the chi square distribution}
  \item{c1}{ cutoff value at which the biweight function gives zero weight to any data point}
  \item{d}{ vector of distances from each data point to mean vector}
  \item{b0}{ expected value of the \eqn{\rho} function for the biweight estimator (under normality)}
  \item{x}{ value at which the biweight (\eqn{\rho, \psi, v, w}) should be evaluated}
  \item{r}{breakdown (\eqn{k/n} where \eqn{k} is the largest number of observations that can be replaced with arbitrarily large values while keeping the estimates bounded)}
  \item{v}{a vector (presumably from \code{biwt.cor}) consisting of the lower triangle of a symmetric dissimilarity or similarity matrix}   
}
\details{
These functions are used internally for the \code{\link{biwt.est}} and \code{\link{biwt.cor}} functions in the \code{\link{biwt}} package.
}
\value{
The following functions evaluate partial integrals of the \eqn{\chi^2} distribution: \code{chi.int}, \code{chi.in2}, \code{chi.int.p}, \code{chi.int2.p}.

The following functions evaluate the biweight functions: \code{psibw}, \code{rhobw}, \code{wbw}, \code{vbw}.

The following functions caluclate the expected value of the \eqn{\rho} function under the assumption of normally distribued data: \code{erho.bw}, \code{erho.bw.p}.

The function \code{ksolve} keeps the estimates from imploding by setting the mean value of \eqn{\rho} equal to its expected value under normality.

The function \code{rejpt.bw} gives the asymptotic rejection point.

The function \code{vect2diss} converts a vector consisting of a lower triangle of a matrix into a symmetric dissimilarity or similarity matrix.  The function is similar to \code{dissmatrix} in the \code{hopach} package, except that \code{vect2diss} fills in the lower triangle first while \code{dissmatrix} fills in the upper triangle first.

}
\references{ Hardin, J., Mitani, A., Hicks, L., VanKoten, B.; \bold{A Robust Measure of Correlation Between Two Genes on a Microarray}, \emph{BMC Bioinformatics}, \bold{8}:220; 2007.   }
\author{Jo Hardin \email{jo.hardin@pomona.edu}}

\seealso{ \code{\link{biwt.est}} , \code{\link{biwt.cor}}}
\examples{
## These are not user level functions
## See examples for biwt.est or biwt.cor
## ?biwt.est
## ?biwt.cor

}

