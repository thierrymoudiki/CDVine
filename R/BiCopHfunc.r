#########################################
# BiCopHfunc  			#
#					#
# Input:				#
# u1,u2		copula data		#
# family	copula family		#
# par		copula parameter	#
# par2		copula parameter 2	#
#					#
# Output:				#
# hfunc1	h-function h(u1,u2)	#
# hfunc2	h-function h(u2,u1)	#
#########################################

BiCopHfunc <- function(u1, u2, family, par, par2 = 0) {
  if (is.null(u1) == TRUE || is.null(u2) == TRUE) 
    stop("u1 and/or u2 are not set or have length zero.")
  if (any(u1 > 1) || any(u1 < 0)) 
    stop("Data has be in the interval [0,1].")
  if (any(u2 > 1) || any(u2 < 0)) 
    stop("Data has be in the interval [0,1].")
  if (length(u1) != length(u2)) 
    stop("Lengths of 'u1' and 'u2' do not match.")
  if (!(family %in% c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13, 14, 16, 17, 18, 19, 20, 23, 24, 26, 27, 28, 
    29, 30, 33, 34, 36, 37, 38, 39, 40))) 
    stop("Copula family not implemented.")
  if (family %in% c(2, 7, 8, 9, 10, 17, 18, 19, 20, 27, 28, 29, 30, 37, 38, 39, 40) && par2 == 0) 
    stop("For t-, BB1, BB6, BB7 and BB8 copulas, 'par2' must be set.")
  if (family %in% c(1, 3, 4, 5, 6, 13, 14, 16, 23, 24, 26, 33, 34, 36) && length(par) < 1) 
    stop("'par' not set.")
  
  if ((family == 1 || family == 2) && abs(par[1]) >= 1) 
    stop("The parameter of the Gaussian and t-copula has to be in the interval (-1,1).")
  if (family == 2 && par2 <= 2) 
    stop("The degrees of freedom parameter of the t-copula has to be larger than 2.")
  if ((family == 3 || family == 13) && par <= 0) 
    stop("The parameter of the Clayton copula has to be positive.")
  if ((family == 4 || family == 14) && par < 1) 
    stop("The parameter of the Gumbel copula has to be in the interval [1,oo).")
  if ((family == 6 || family == 16) && par <= 1) 
    stop("The parameter of the Joe copula has to be in the interval (1,oo).")
  if (family == 5 && par == 0) 
    stop("The parameter of the Frank copula has to be unequal to 0.")
  if ((family == 7 || family == 17) && par <= 0) 
    stop("The first parameter of the BB1 copula has to be positive.")
  if ((family == 7 || family == 17) && par2 < 1) 
    stop("The second parameter of the BB1 copula has to be in the interval [1,oo).")
  if ((family == 8 || family == 18) && par <= 0) 
    stop("The first parameter of the BB6 copula has to be in the interval [1,oo).")
  if ((family == 8 || family == 18) && par2 < 1) 
    stop("The second parameter of the BB6 copula has to be in the interval [1,oo).")
  if ((family == 9 || family == 19) && par < 1) 
    stop("The first parameter of the BB7 copula has to be in the interval [1,oo).")
  if ((family == 9 || family == 19) && par2 <= 0) 
    stop("The second parameter of the BB7 copula has to be positive.")
  if ((family == 10 || family == 20) && par < 1) 
    stop("The first parameter of the BB8 copula has to be in the interval [1,oo).")
  if ((family == 10 || family == 20) && (par2 <= 0 || par2 > 1)) 
    stop("The second parameter of the BB8 copula has to be in the interval (0,1].")
  if ((family == 23 || family == 33) && par >= 0) 
    stop("The parameter of the rotated Clayton copula has to be negative.")
  if ((family == 24 || family == 34) && par > -1) 
    stop("The parameter of the rotated Gumbel copula has to be in the interval (-oo,-1].")
  if ((family == 26 || family == 36) && par >= -1) 
    stop("The parameter of the rotated Joe copula has to be in the interval (-oo,-1).")
  if ((family == 27 || family == 37) && par >= 0) 
    stop("The first parameter of the rotated BB1 copula has to be negative.")
  if ((family == 27 || family == 37) && par2 > -1) 
    stop("The second parameter of the rotated BB1 copula has to be in the interval (-oo,-1].")
  if ((family == 28 || family == 38) && par >= 0) 
    stop("The first parameter of the rotated BB6 copula has to be in the interval (-oo,-1].")
  if ((family == 28 || family == 38) && par2 > -1) 
    stop("The second parameter of the rotated BB6 copula has to be in the interval (-oo,-1].")
  if ((family == 29 || family == 39) && par > -1) 
    stop("The first parameter of the rotated BB7 copula has to be in the interval (-oo,-1].")
  if ((family == 29 || family == 39) && par2 >= 0) 
    stop("The second parameter of the rotated BB7 copula has to be negative.")
  if ((family == 30 || family == 40) && par > -1) 
    stop("The first parameter of the rotated BB8 copula has to be in the interval (-oo,-1].")
  if ((family == 30 || family == 40) && (par2 >= 0 || par2 < (-1))) 
    stop("The second parameter of the rotated BB8 copula has to be in the interval [-1,0).")
  
  n <- length(u1)
  
  hfunc1 <- .C("Hfunc1", as.integer(family), as.integer(n), as.double(u2), as.double(u1), as.double(par), 
    as.double(par2), as.double(rep(0, n)), PACKAGE = "CDVine")[[7]]
  
  hfunc2 <- .C("Hfunc2", as.integer(family), as.integer(n), as.double(u1), as.double(u2), as.double(par), 
    as.double(par2), as.double(rep(0, n)), PACKAGE = "CDVine")[[7]]
  
  
  hfunc <- list(hfunc1 = hfunc1, hfunc2 = hfunc2)
  return(hfunc)
} 
