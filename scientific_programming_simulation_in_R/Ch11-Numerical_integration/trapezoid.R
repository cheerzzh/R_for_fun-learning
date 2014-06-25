
# numerical integral of ftn from a to b
# using the trapezoid rule with n subdivisions 
#
# ftn is a function of a single variable
# we assume a < b and n is a positive integer

trapezoid <- function(ftn, a, b, n = 100) 
{
	h <- (b-a)/n # partition the range
	x.vec <- seq(a, b, by = h)
	# using sapply is that it will work even if ftn is not vectorised.
	f.vec <- sapply(x.vec, ftn)
	T <- h*(f.vec[1]/2 + sum(f.vec[2:n]) + f.vec[n+1]/2)
	return(T)
}


# the function ftn6 is vectorised 
ftn6 <- function(x) return(4 * x^3)
# should be 1
trapezoid(ftn6, 0, 1, n = 20)
trapezoid(ftn6, 0, 1, n = 40)
trapezoid(ftn6, 0, 1, n = 60)
trapezoid(ftn6, 0, 1, n = 6000)





