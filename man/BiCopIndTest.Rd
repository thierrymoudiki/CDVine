\name{BiCopIndTest}          
\alias{BiCopIndTest}               

\title{Independence test for bivariate copula data}

\description{
This function returns the p-value of a bivariate asymptotic independence test based on Kendall's tau.
}

\usage{
BiCopIndTest(u1, u2)
}

\arguments{
  \item{u1,u2}{Data vectors of equal length with values in [0,1].}
}

\value{
  \item{statistic}{Test statistic of the independence test.}
  \item{p.value}{P-value of the independence test.}

}

\details{
The test exploits the asymptotic normality of the test statistic
\deqn{
\texttt{statistic} := T = \sqrt{\frac{9N(N - 1)}{2(2N + 5)}} \times |\hat{\tau}|,
}{
statistic := T = ( (9N(N-1)) / (2(2N+5)) )^0.5 * |\tau|,
}
where \eqn{N} is the number of observations (length of \code{u1})
and \eqn{\hat{\tau}} the empirical Kendall's tau of the data vectors \code{u1} and \code{u2}.
The p-value of the null hypothesis of bivariate independence hence is asymptotically
\deqn{
\texttt{p.value} = 2 \times \left(1 - \Phi\left(T\right)\right),
}{
p.value = 2*(1-\Phi(T)),
}
where \eqn{\Phi} is the standard normal distribution function.
}

\references{
Genest, C. and A. C. Favre (2007).
Everything you always wanted to know about copula modeling but were afraid to ask.
Journal of Hydrologic Engineering, 12 (4), 347-368.
}

\author{Jeffrey Dissmann}

\seealso{\code{\link{BiCopPar2Tau}}, \code{\link{BiCopTau2Par}}, \code{\link{BiCopSelect}}, \code{\link{CDVineCopSelect}}}

\examples{
## Example 1: Gaussian copula with large dependence parameter
par1 = 0.7
fam1 = 1
dat1 = BiCopSim(500,fam1,par1)

# perform the asymptotic independence test
BiCopIndTest(dat1[,1],dat1[,2])


## Example 2: Gaussian copula with small dependence parameter
par2 = 0.01
fam2 = 1
dat2 = BiCopSim(500,fam2,par2)

# perform the asymptotic independence test
BiCopIndTest(dat2[,1],dat2[,2])
}
