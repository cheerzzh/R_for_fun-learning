
# numerical integral of ftn from a to b
# using Simpson's rule with n subdivisions 
#
# ftn is a function of a single variable
# we assume a < b and n is a positive even integer
simpson_n <- function(ftn, a, b, n = 100)
{
	n <- max(c(2*(n %% 2),4))
	h <- (b-a)/n
	x.vec1 <- seq(a+h, b-h, by = 2*h)
	x.vec2 <- seq(a+2*h, b-2*h, by = 2*h)
	f.vec1 <- sapply(x.vec1, ftn)
	f.vec2 <- sapply(x.vec2, ftn)
	S <- h/3*(ftn(a) + ftn(b) + 4*sum(f.vec1) + 2*sum(f.vec2)) 
	return(S)
}


ftn6 <- function(x) return(4 * x^3)
simpson_n(ftn6, 0, 1, 10)

phi <- function(x) return (exp(-x^2/2)/sqrt(2*pi))
Phi <- function(z)
{
	if (z <0)
	{
		return (0.5 - simpson_n(phi,z,0))
	}
	else
	{
		return (0.5 + simpson_n(phi,0,z))
	}
}


z <- seq(-5, 5, by = 0.1)
phi.z <- sapply(z, phi)
Phi.z <- sapply(z, Phi)
plot(z, Phi.z, type = "l", ylab = "", main = "phi(z) and Phi(z)")
lines(z, phi.z)

# test the accuracy of Simpson’s rule 
# or a sequence of increasing values of n, the number of partitions.


ftn <- function(x) return(1/x)
S <- function(n)  simpson_n(ftn, 0.01,1,n)

n.vec <- seq(10, 1000, by = 10)
S.vec <- sapply(n.vec, S)

opar <- par(mfrow = c(1,2), pty = "s", mar = c(4,4,2,1), las = 1)
plot(n.vec, S.vec+log(0.01),type="l", xlab = "n", ylab = "error")
plot(log(n.vec), log(S.vec + log(0.01)), type = "l", xlab = "log(n)", ylab = "log(error)")







