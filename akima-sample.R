

# ==============================
# akima is a list with components x, y and z which represents 
# a smooth surface of z values at selected
# points irregularly distributed in the x-y plane.
# ===============


# sample of akima
library(rgl)
data(akima)

# data
rgl.spheres(akima$x,akima$z , akima$y,0.5,color="red")
rgl.bbox()

# interp:
akima.li <- interp(akima$x, akima$y, akima$z,
xo=seq(min(akima$x), max(akima$x), length = 100),
yo=seq(min(akima$y), max(akima$y), length = 100))

# interp surface:
rgl.surface(akima.li$x,akima.li$y,akima.li$z,color="green",alpha=c(0.5))


# interpp:
akima.p <- interpp(akima$x, akima$y, akima$z,
	runif(20,min(akima$x),max(akima$x)),
	runif(20,min(akima$y),max(akima$y)))
# interpp points:
rgl.points(akima.p$x,akima.p$z , akima.p$y,size=4,color="yellow")
rgl.bbox()


# ==== important example ===========  #
# bivariate spline interpolation
# data
rgl.spheres(akima$x,akima$z , akima$y,0.5,color="red")
rgl.bbox()
# bivariate cubic spline interpolation
# interp:
akima.si <- interp(akima$x, akima$y, akima$z,
	xo=seq(min(akima$x), max(akima$x), length = 100),
	yo=seq(min(akima$y), max(akima$y), length = 100),
linear = FALSE, extrap = TRUE)
# interp surface:
rgl.surface(akima.si$x,akima.si$y,akima.si$z,color="green",alpha=c(0.5))

# interpp:
akima.sp <- interpp(akima$x, akima$y, akima$z,
	runif(20,min(akima$x),max(akima$x)),
	runif(20,min(akima$y),max(akima$y)),
	linear = FALSE, extrap = TRUE)
# interpp points:
rgl.points(akima.sp$x,akima.sp$z , akima.sp$y,size=4,color="blue")

# ===================
# akima760 is a list with vector components x, y and a matrix z which represents a smooth surface of
# z values at the points of a regular grid spanned by the vectors x and y
# ==================
## Not run:
library(rgl)
data(akima)
# data
# seems akima760 is missing
#rgl.spheres(akima760$x,akima760$z , akima760$y,0.5,color="red")
#rgl.bbox()

# ====  aspline: Univariate Akima interpolation
# The function returns a list of points which smoothly interpolate given data points,
# similar to a curve drawn by hand

## regular spaced data
x <- 1:10
y <- c(rnorm(5), c(1,1,1,1,3))
lines(spline(x, y, xmin=min(xnew), xmax=max(xnew), n=200), col="blue")

## irregular spaced data
x <- sort(runif(10, max=10))
y <- c(rnorm(5), c(1,1,1,1,3))

xnew <- seq(-1, 11, 0.1)
plot(x, y, ylim=c(-3, 3), xlim=range(xnew))
lines(spline(x, y, xmin=min(xnew), xmax=max(xnew), n=200), col="blue")

lines(aspline(x, y, xnew), col="red")
lines(aspline(x, y, xnew, method="improved"), col="black", lty="dotted")
lines(aspline(x, y, xnew, method="improved", degree=10), col="green", lty="dashed")

## an example of Akima, 1991
x <- c(-3, -2, -1, 0, 1, 2, 2.5, 3)
y <- c( 0, 0, 0, 0, -1, -1, 0, 2)
plot(x, y, ylim=c(-3, 3))
lines(spline(x, y, n=200), col="blue")

lines(aspline(x, y, n=200), col="red")
lines(aspline(x, y, n=200, method="improved"), col="black", lty="dotted")
lines(aspline(x, y, n=200, method="improved", degree=10), col="green", lty="dashed")

# ================
# bicubic: Bivariate Interpolation for Data on a Rectangular grid
# =====================
# based on the revised Akima method
# bicubic(x, y, z, x0, y0)
# accuracy of a bicubic (bivariate third-degree) polynomial
# Use interp for the general case of irregular gridded data!

data(akima760)
# interpolate at the diagonal of the grid [0,8]x[0,10]
akima.bic <- bicubic(akima760$x,akima760$y,akima760$z,
	seq(0,8,length=50), seq(0,10,length=50))
plot(sqrt(akima.bic$x^2+akima.bic$y^2), akima.bic$z, type="l")


# ============================
# bicubic.grid: Bivariate Interpolation for Data on a Rectangular grid
# ==========================================
# performs interpolation of a bivariate function, z(x,y), on a rectangular grid in the x-y plane. 
# It is based on the revised Akima method
# bicubic.grid(x,y,z,xlim,ylim,dx,dy)
data(akima760)
# interpolate at a grid [0,8]x[0,10]
akima.bic <- bicubic.grid(akima760$x,akima760$y,akima760$z,
	c(0,8),c(0,10),0.1,0.1)

# ==================
# interp:  Gridded Bivariate Interpolation for Irregular Data
# ==========================
# implement bivariate interpolation onto a grid for irregularly spaced input data.
# Bilinear or bicubic spline interpolation is applied using different versions of algorithms from Akima

data(akima)
plot(y ~ x, data = akima, main = "akima example data")
with(akima, text(x, y, formatC(z,dig=2), adj = -0.1))

## linear interpolation
akima.li <- interp(akima$x, akima$y, akima$z)
image (akima.li, add=TRUE)
contour(akima.li, add=TRUE)
points (akima, pch = 3)

## increase smoothness (using finer grid):
akima.smooth <-
	with(akima, interp(x, y, z, xo=seq(0,25, length=100),
		yo=seq(0,20, length=100)))
image (akima.smooth, main = "interp(<akima data>, *) on finer grid")
contour(akima.smooth, add = TRUE, col = "thistle")
points(akima, pch = 3, cex = 2, col = "blue")

# use only 15 points (interpolation only within convex hull!)
akima.part <- with(akima, interp(x[1:15], y[1:15], z[1:15]))
image(akima.part)
title("interp() on subset of only 15 points")
contour(akima.part, add=TRUE)
points(akima$x[1:15],akima$y[1:15], col = "blue")

## spline interpolation, two variants (AMS 526 "Old", AMS 761 "New")
## -----------------------------------------------------------------
## "Old": use 5 points to calculate derivatives -> many NAs
akima.sO <- interp.old(akima$x, akima$y, akima$z,
	xo=seq(0,25, length=100), yo=seq(0,20, length=100), ncp=5)
table(is.na(akima.sO$z)) ## 3990 NA's; = 40 %
akima.sO <- with(akima,
	interp.old(x,y,z, xo=seq(0,25, length=100), yo=seq(0,20, len=100), ncp = 4))
sum(is.na(akima.sO$z)) ## still 3429
image (akima.sO, main = "interp.old(*, ncp = 4) [almost useless]")
contour(akima.sO, add = TRUE)


## "New:"
akima.spl <- with(akima, interp.new(x,y,z, xo=seq(0,25, length=100),
yo=seq(0,20, length=100)))
## equivalent call via setting linear=FALSE in interp():
akima.spl <- with(akima, interp(x,y,z, xo=seq(0,25, length=100),
yo=seq(0,20, length=100),
linear=FALSE))
contour(akima.spl, main = "smooth interp(*, linear = FALSE)")
points(akima)

full.pal <- function(n) hcl(h = seq(340, 20, length = n))
cool.pal <- function(n) hcl(h = seq(120, 0, length = n) + 150)
warm.pal <- function(n) hcl(h = seq(120, 0, length = n) - 30)
filled.contour(akima.spl, color.palette = full.pal,
plot.axes = { axis(1); axis(2);
title("smooth interp(*, linear = FALSE)");
points(akima, pch = 3, col= hcl(c=100, l = 20))})



# ==================
# interp2xyz From interp() Result, Produce 3-column Matrix
# From an interp() result, produce a 3-column matrix or data.frame cbind(x, y, z).
# interp2xyz(al, data.frame = FALSE)

data(akima)
ak.spl <- with(akima, interp(x, y, z, linear = FALSE,
xo= seq(0,25, length=100),
yo= seq(0,20, length= 96)))
str(ak.spl)# list (x[i], y[j], z = <matrix>[i,j])

## Now transform to simple (x,y,z) matrix / data.frame :
str(am <- interp2xyz(ak.spl))
str(ad <- interp2xyz(ak.spl, data.frame=TRUE))

## and they are the same:
stopifnot( am == ad | (is.na(am) & is.na(ad)) )


# =============

data(akima)
# linear interpolation at points (1,2), (5,6) and (10,12)
akima.lip<-interpp(akima$x, akima$y, akima$z,c(1,5,10),c(2,6,12))
akima.lip$z
# spline interpolation
akima.sip<-interpp(akima$x, akima$y, akima$z,c(1,5,10),c(2,6,12),
linear=FALSE)
akima.sip$z