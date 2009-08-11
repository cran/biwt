\name{biwt.est}
\alias{biwt.est}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to compute Tukey's biweight mean vector and covariance matrix}
\description{
Compute a multivariate location and scale estimate based on Tukey's biweight weight function. }
\usage{
biwt.est(x, r=.2, med.init=covMcd(x))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a \eqn{2 x n} matrix or data frame (\eqn{n} is the number of measurements)}
  \item{r}{ breakdown (\eqn{k/n} where \eqn{k} is the largest number of measurements that can be replaced with arbitrarily large values while keeping the estimates bounded).  Default is r=.2. }
  \item{med.init}{ a (robust) initial estimate of the center and shape of the data.  The format is a list with components center and cov (as in the output of covMcd from the rrcov library).  Default is the minimum covariance determinant (MCD) on the data. }
}
\details{
A robust measure of center and shape is computed using Tukey's biweight M-estimator.  The biweight estimates are essentially weighted means and covariances where the weights are calculated based on the distance of each measurement to the data center with respect to the shape of the data.  The estimates should be computed pair-by-pair because the weights should depend only on the pairwise relationship at hand and not the relationship between all the observations globally.


}
\value{
A list with components:
\item{biwt.mu}{the final estimate of center}
\item{biwt.sig}{the final estimate of shape}
}

\references{ Hardin, J., Mitani, A., Hicks, L., VanKoten, B.; \bold{A Robust Measure of Correlation Between Two Genes on a Microarray}, \emph{BMC Bioinformatics}, \bold{8}:220; 2007.   }
\author{Jo Hardin \email{jo.hardin@pomona.edu} }

\seealso{ \code{\link{biwt.cor}}}

\note{

If there is too much missing data or if the initialization is not accurate, the function will compute the MCD for a given pair of observations before computing the biweight correlation (regardless of the initial settings given in the call to the function).

}


\examples{


samp.data <- t(mvrnorm(30,mu=c(0,0),Sigma=matrix(c(1,.75,.75,1),ncol=2)))

samp.bw <- biwt.est(samp.data)
samp.bw

samp.bw.var1 <- samp.bw$biwt.sig[1,1]
samp.bw.var2 <- samp.bw$biwt.sig[2,2]
samp.bw.cov <- samp.bw$biwt.sig[1,2]

samp.bw.cor <- samp.bw.cov / sqrt(samp.bw.var1 * samp.bw.var2)
samp.bw.cor

# or:

samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor

##############
# to speed up the calculations, use the median/mad for the initialization:
##############

samp.init <- list()
	samp.init$cov <- diag(apply(samp.data,1,mad,na.rm=TRUE))
	samp.init$center <- apply(samp.data,1,median,na.rm=TRUE)

samp.init

samp.bw <- biwt.est(samp.data,med.init = samp.init)
samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{cluster}
%\keyword{biweight}
%\keyword{correlation}
%\keyword{Tukey}

