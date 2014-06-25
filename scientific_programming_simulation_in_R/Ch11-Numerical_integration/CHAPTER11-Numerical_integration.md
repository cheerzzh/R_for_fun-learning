CHAPTER 11 Numerical integration
=====


for many functions f it is impossible to write down an antiderivative in closed form -> use numerical integration to approximate the definite integral.

#Topic
- the trape- zoid rule
- Simpson’s rule
- adaptive quadrature

#11.1 Trapezoidal rule- approximating the area under y = f(x) over the subinterval [xi,xi+1] by a trapezoid

#11.2 Simpson’s rule
1. Simpon’s rule subdivides the interval [a, b] into n subintervals, where n is **even**
2. on each consecutive pair of sub intervals, it approximates the behaviour of f(x) by a **parabola** (polynomial of degree 2)
3. rather than by the straight lines used in the trapezoidal rule

##Features
- gives exact results if f(x) is a quadratic function
- it also gives exact results if f(x) is a cubic function
- In general it gives better results than the trapezoid rule

#11.3 Adaptive quadrature
