CHAPTER 10 Root-finding
=====

##10.1 Introduction

###Focuses 
- root-finding
- fixed-point iteration
- the Newton-Raphson method
- secant method
- bisection method

###10.2 Fixed-point iteration
####Def
For continuous function, A fixed point of g is a number a such that g(a) = a. That is, a is a solution of the equation g(x) = x. crosses the line y = x.

####Reduce the problem:
- **f (x) = c(g(x) − x)** <-> if **g(a) = a** , thus f(x) = 0 to find the fixed points of the function g we need only **find the roots** of the associated function f
- Conversely, the problem of finding **roots of f(x) = 0** is equivalent to the problem of finding fixed points of the function **g(x) = c · f(x) + x**.

####fixed-point method
x(n+1) = g(x(n)).
not always convergence

####Problems
- |g′(a)| < 1 at the fixed point a, then the algorithm will converge, otherwise it diverges. 
- may converge to a, but **never actually reach it** -> set a distance
- convert the problem into fixed- point form, but there are many ways to do this
- fixed-point method is relatively slow
####Code
fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100) 

- *ftn* is the name of a function that takes a single numeric input and returns a single numeric result.
- *x0* is the starting point for the algorithm.
- *tol* is such that the algorithm will stop if |xn − xn−1| ≤ tol, with default 10−9- *max.iter* is such that the algorithm will stop when n = max.iter, with default 100.

function stops if they exceed some **specified maximum**. This prevents the function running on forever.


