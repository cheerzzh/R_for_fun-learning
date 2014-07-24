

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
	runif(200,min(akima$x),max(akima$x)),
	runif(200,min(akima$y),max(akima$y)))
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
