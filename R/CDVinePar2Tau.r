CDVinePar2Tau <- function(family, par, par2 = rep(0, length(family))) {
  
  dd <- length(family)
  d <- (1 + sqrt(1 + 8 * dd))/2
  if (d != floor(d)) 
    stop("The length of the family vector is not correct.")
  
  if (length(par) < dd) 
    stop("Length of 'par' has to be d*(d-1)/2.")
  if (c(2, 7, 8, 9, 10, 17, 18, 19, 20, 27, 28, 29, 30, 37, 38, 39, 40) %in% family && length(par2) != 
    dd) 
    stop("Length of 'par2' has to be d*(d-1)/2 if t, BB1, BB6, BB7 or BB8 copulas are used.")
  if (length(family) != dd) 
    stop("Length of 'family' has to be d*(d-1)/2.")
  if (d < 2) 
    stop("Dimension has to be at least 2.")
  
  for (i in 1:(d * (d - 1)/2)) {
    if (!(family[i] %in% c(0, 1:10, 13, 14, 16:20, 23, 24, 26:30, 33, 34, 36:40))) 
      stop("Copula family not implemented.")
    # Parameterbereiche abfragen
    if ((family[i] == 1 || family[i] == 2) && abs(par[i]) >= 1) 
      stop("The parameter of the Gaussian and t-copula has to be in the interval (-1,1).")
    if (family[i] == 2 && par2[i] <= 2) 
      stop("The degrees of freedom parameter of the t-copula has to be larger than 2.")
    if ((family[i] == 3 || family[i] == 13) && par[i] <= 0) 
      stop("The parameter of the Clayton copula has to be positive.")
    if ((family[i] == 4 || family[i] == 14) && par[i] < 1) 
      stop("The parameter of the Gumbel copula has to be in the interval [1,oo).")
    if ((family[i] == 6 || family[i] == 16) && par[i] <= 1) 
      stop("The copula parameter of the Joe copula has to be in the interval (1,oo).")
    if (family[i] == 5 && par[i] == 0) 
      stop("The parameter of the Frank copula has to be unequal to 0.")
    if ((family[i] == 7 || family[i] == 17) && par[i] <= 0) 
      stop("The first parameter of the BB1 copula has to be positive.")
    if ((family[i] == 7 || family[i] == 17) && par2[i] < 1) 
      stop("The second parameter of the BB1 copula has to be in the interval [1,oo).")
    if ((family[i] == 8 || family[i] == 18) && par[i] <= 0) 
      stop("The first parameter of the BB6 copula has to be in the interval [1,oo).")
    if ((family[i] == 8 || family[i] == 18) && par2[i] < 1) 
      stop("The second parameter of the BB6 copula has to be in the interval [1,oo).")
    if ((family[i] == 9 || family[i] == 19) && par[i] < 1) 
      stop("The first parameter of the BB7 copula has to be in the interval [1,oo).")
    if ((family[i] == 9 || family[i] == 19) && par2[i] <= 0) 
      stop("The second parameter of the BB7 copula has to be positive.")
    if ((family[i] == 10 || family[i] == 20) && par[i] < 1) 
      stop("The first parameter of the BB8 copula has to be in the interval [1,oo).")
    if ((family[i] == 10 || family[i] == 20) && (par2[i] <= 0 || par2[i] > 1)) 
      stop("The second parameter of the BB8 copula has to be in the interval (0,1].")
    if ((family[i] == 23 || family[i] == 33) && par[i] >= 0) 
      stop("The parameter of the rotated Clayton copula has to be negative.")
    if ((family[i] == 24 || family[i] == 34) && par[i] > -1) 
      stop("The parameter of the rotated Gumbel copula has to be in the interval (-oo,-1].")
    if ((family[i] == 26 || family[i] == 36) && par[i] >= -1) 
      stop("The parameter of the rotated Joe copula has to be in the interval (-oo,-1).")
    if ((family[i] == 27 || family[i] == 37) && par[i] >= 0) 
      stop("The first parameter of the rotated BB1 copula has to be negative.")
    if ((family[i] == 27 || family[i] == 37) && par2[i] > -1) 
      stop("The second parameter of the rotated BB1 copula has to be in the interval (-oo,-1].")
    if ((family[i] == 28 || family[i] == 38) && par[i] >= 0) 
      stop("The first parameter of the rotated BB6 copula has to be in the interval (-oo,-1].")
    if ((family[i] == 28 || family[i] == 38) && par2[i] > -1) 
      stop("The second parameter of the rotated BB6 copula has to be in the interval (-oo,-1].")
    if ((family[i] == 29 || family[i] == 39) && par[i] > -1) 
      stop("The first parameter of the rotated BB7 copula has to be in the interval (-oo,-1].")
    if ((family[i] == 29 || family[i] == 39) && par2[i] >= 0) 
      stop("The second parameter of the rotated BB7 copula has to be negative.")
    if ((family[i] == 30 || family[i] == 40) && par[i] > -1) 
      stop("The first parameter of the rotated BB8 copula has to be in the interval (-oo,-1].")
    if ((family[i] == 30 || family[i] == 40) && (par2[i] >= 0 || par2[i] < (-1))) 
      stop("The second parameter of the rotated BB8 copula has to be in the interval [-1,0).")
  }
  
  taus <- rep(0, dd)
  
  for (i in 1:dd) taus[i] <- BiCopPar2Tau(family[i], par[i], par2[i])
  
  return(taus)
} 
