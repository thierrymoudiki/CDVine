\name{BiCopName}       
\alias{BiCopName}

\title{Bivariate copula family names}

\description{
This function transforms the bivariate copula family number into its character expression and vice versa.
}

\usage{
BiCopName(family, short=TRUE)
}

\arguments{
\item{family}{Bivariate copula family, either its number or its character expression (see table below).
\tabular{rll}{
No. \tab Short name \tab Long name \cr
\code{0} \tab \code{"I"} \tab \code{"Independence"} \cr
\code{1} \tab \code{"N"} \tab \code{"Gaussian"} \cr
\code{2} \tab \code{"t"} \tab \code{"t"} \cr
\code{3} \tab \code{"C"} \tab \code{"Clayton"} \cr
\code{4} \tab \code{"G"} \tab \code{"Gumbel"} \cr
\code{5} \tab \code{"F"} \tab \code{"Frank"} \cr
\code{6} \tab \code{"J"} \tab \code{"Joe"} \cr
\code{7} \tab \code{"BB1"} \tab \code{"Clayton-Gumbel"} \cr
\code{8} \tab \code{"BB6"} \tab \code{"Joe-Gumbel"} \cr
\code{9} \tab \code{"BB7"} \tab \code{"Joe-Clayton"} \cr
\code{10} \tab \code{"BB8"} \tab \code{"Frank-Joe"} \cr
\code{13} \tab \code{"SC"} \tab \code{"Survival Clayton"} \cr
\code{14} \tab \code{"SG"} \tab \code{"Survival Gumbel"} \cr
\code{16} \tab \code{"SJ"} \tab \code{"Survival Joe"} \cr
\code{17} \tab \code{"SBB1"} \tab \code{"Survival Clayton-Gumbel"} \cr
\code{18} \tab \code{"SBB6"} \tab \code{"Survival Joe-Gumbel"} \cr
\code{19} \tab \code{"SBB7"} \tab \code{"Survival Joe-Clayton"} \cr
\code{20} \tab \code{"SBB8"} \tab \code{"Survival Joe-Frank"} \cr
\code{23} \tab \code{"C90"} \tab \code{"Rotated Clayton 90 degrees"} \cr
\code{24} \tab \code{"G90"} \tab \code{"Rotated Gumbel 90 degrees"} \cr
\code{26} \tab \code{"J90"} \tab \code{"Rotated Joe 90 degrees"} \cr
\code{27} \tab \code{"BB1_90"} \tab \code{"Rotated Clayton-Gumbel 90 degrees"} \cr
\code{28} \tab \code{"BB6_90"} \tab \code{"Rotated Joe-Gumbel 90 degrees"} \cr
\code{29} \tab \code{"BB7_90"} \tab \code{"Rotated Joe-Clayton 90 degrees"} \cr
\code{30} \tab \code{"BB8_90"} \tab \code{"Rotated Frank-Joe 90 degrees"} \cr
\code{33} \tab \code{"C270"} \tab \code{"Rotated Clayton 270 degrees"} \cr
\code{34} \tab \code{"G270"} \tab \code{"Rotated Gumbel 270 degrees"} \cr
\code{36} \tab \code{"J270"} \tab \code{"Rotated Joe 270 degrees"} \cr
\code{37} \tab \code{"BB1_270"} \tab \code{"Rotated Clayton-Gumbel 270 degrees"} \cr
\code{38} \tab \code{"BB6_270"} \tab \code{"Rotated Joe-Gumbel 270 degrees"} \cr
\code{39} \tab \code{"BB7_270"} \tab \code{"Rotated Joe-Clayton 270 degrees"} \cr
\code{40} \tab \code{"BB8_270"} \tab \code{"Rotated Frank-Joe 270 degrees"} \cr
}
}
\item{short}{Logical; if the number of a bivariate copula family is used and \code{short = TRUE} (default),
  a short version of the corresponding character expression is returned, otherwise the long version.}
}

\value{
The transformed bivariate copula family (see table above).
}

\author{Ulf Schepsmeier}

\seealso{\code{\link{CDVineTreePlot}}}

\examples{
# family as number
family = 1
BiCopName(family,short=TRUE)	 # short version
BiCopName(family,short=FALSE)	# long version

# family as character expression (short version)
family = "C"
BiCopName(family)	# as number

# long version
family = "Clayton"
BiCopName(family)	# as number
}
