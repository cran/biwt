\name{biwtCorrelation}
\alias{biwtCorrelation}
%\alias{biwt.cor.vect}
\alias{biwt.cor}
%\alias{biwt.dist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to compute a weighted correlation based on Tukey's biweight}
\description{
The following function compute a multivariate location and scale estimate based on Tukey's biweight weight function. }
\usage{
biwt.cor(x, r=.2, output="matrix", median=TRUE, full.init=TRUE, absval=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a \eqn{g x n} matrix or data frame (\eqn{g} is the number of observations (genes), \eqn{n} is the number of measurements)}
  \item{r}{ breakdown (\eqn{k/n} where \eqn{k} is the largest number of measurements that can be replaced with arbitrarily large values while keeping the estimates bounded).  Default is r=.2. }
  \item{output}{ a character string specifying the output format.  Options are "matrix" (default), "vector", or "distance".  See value below}
  \item{median}{ a logical command to determine whether the initialization is done using the coordinate-wise median and MAD^2 (TRUE, default) or using the minimum covariance determinant (MCD)  (FALSE).  Using the MCD is substantially slower.  The MAD is the median of the absolute deviations from the median.  See the R help file on \code{mad}.}
  \item{full.init}{ a logical command to determine whether the initialization is done for each pair separately (FALSE) or only one time at the beginning using a random sample from the data matrix (TRUE, default).  Initializing for each pair separately is substantially slower.}
  \item{absval}{ a logical command to determine whether the distance should be measured as 1 minus the absolute value of the correlation (TRUE, default) or simply 1 minus the correlation (FALSE)}
}
\details{

Using \code{\link{biwt.est}} to estimate the robust covariance matrix, a robust measure of correlation is computed using Tukey's biweight M-estimator.  The biweight correlation is essentially a weighted correlation where the weights are calculated based on the distance of each measurement to the data center with respect to the shape of the data.  The correlations are computed pair-by-pair because the weights should depend only on the pairwise relationship at hand and not the relationship between all the observations globally.  The biwt functions simply compute many pairwise correlations and create distance matrices for use in other algorithms (e.g., clustering).

In order for the biweight estimates to converge, a reasonable initialization must be given.  Typically, using TRUE for the median and full.init arguments will provide acceptable initializations.  With particularly irregular data, the MCD should be used to give the initial estimate of center and shape.  With data sets in which the observations are orders of magnitudes different, full.init=FALSE should be specified.


}
\value{
Specifying "matrix" for the ouput argument returns a matrix of the biweight correlations.


Specifying "vector" for the ouput argument returns a vector consisting of the lower triangle of the correlation matrix stored by columns in a vector, say \eqn{bwcor}. If \eqn{g} is the number of observations and \eqn{bwcor} is the correlation vector, then for \eqn{i < j <= g}, the biweight correlation between (rows) \eqn{i} and \eqn{j} is \eqn{bwcor[(j-1)*(j-2)/2 + i]}. The length of the vector is \eqn{g*(g-1)/2}, i.e., of order \eqn{g^2}. 


Specifying "distance" for the ouput argument returns a matrix of the biweight distances (default is 1 minus absolute value of the biweight correlation).


}
\references{ Hardin, J., Mitani, A., Hicks, L., VanKoten, B.; \bold{A Robust Measure of Correlation Between Two Genes on a Microarray}, \emph{BMC Bioinformatics}, \bold{8}:220; 2007.   }
\author{Jo Hardin \email{jo.hardin@pomona.edu} }
\note{

If there is too much missing data or if the initialization is not accurate, the function will compute the MCD for a given pair of observations before computing the biweight correlation (regardless of the initial settings given in the call to the function).

The "vector" output option is given so that correlations can be stored as vectors which are less computationally intensive than matrices.

}

\seealso{\code{\link{biwt.est}} }
\examples{

samp.data <-t(mvrnorm(30,mu=c(0,0,0),
	Sigma=matrix(c(1,.75,-.75,.75,1,-.75,-.75,-.75,1),ncol=3)))

# To compute the 3 pairwise correlations from the sample data:

samp.bw.cor <- biwt.cor(samp.data, output="vector")
samp.bw.cor

# To compute the 3 pairwise correlations in matrix form:

samp.bw.cor.mat <- biwt.cor(samp.data)
samp.bw.cor.mat

# To compute the 3 pairwise distances in matrix form:

samp.bw.dist.mat <- biwt.cor(samp.data, output="distance")
samp.bw.dist.mat

# To convert the distances into an object of class `dist'

as.dist(samp.bw.dist.mat)
}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{cluster}
%\keyword{biweight}
%\keyword{correlation}
%\keyword{Tukey}
