\name{biwt-package}
\Rdversion{1.1}
\alias{biwt-package}
\alias{biwt}
\docType{package}
\title{
A package to compute the biweight mean vector and covariance & correlation matrices}
\description{
Compute multivariate location, scale, and correlation estimates based on Tukey's biweight weight function.
}
\details{
\tabular{ll}{
Package: \tab biwt\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2009-07-20\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}

The two basic functions (1) calculate multivariate estimates of location and shape based on Tukey's biweight, and (2) compute correlations based on the biweight.  The correlation functions also have options to output the data as a correlation matrix or a distance matrix (typically one minus the correlation or one minus the absoulte correlation).  Once the output is in a distance matrix, it can easily be converted (as.dist() ) to an object of the class "dist" which stores the lower triangle of the correlation matrix in a vector.  Many clustering algorithms take as input objects of the class "dist".


}
\author{
Jo Hardin \email{jo.hardin@pomona.edu}

Maintainer: Jo Hardin \email{jo.hardin@pomona.edu}
}
\references{
Hardin, J., Mitani, A., Hicks, L., VanKoten, B.; \bold{A Robust Measure of Correlation Between Two Genes on a Microarray}, \emph{BMC Bioinformatics}, \bold{8}:220; 2007. 
}

\keyword{robust}
\keyword{multivariate}
\keyword{cluster}
%\keyword{biweight}
%\keyword{correlation}
%\keyword{Tukey}

\seealso{
\code{\link{biwt.est}}, \code{\link{biwt.cor}}
}
\examples{

### To calculate the multivariate location vector and scale matrix:

samp.data <- t(mvrnorm(30,mu=c(0,0),Sigma=matrix(c(1,.75,.75,1),ncol=2)))

samp.bw <- biwt.est(samp.data)
samp.bw

samp.bw.var1 <- samp.bw$biwt.sig[1,1]
samp.bw.var2 <- samp.bw$biwt.sig[2,2]
samp.bw.cov <- samp.bw$biwt.sig[1,2]

samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor


### To calculate the correlation(s):


samp.data <- t(mvrnorm(30,mu=c(0,0,0),
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
