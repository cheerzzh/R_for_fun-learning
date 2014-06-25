CHAPTER 10 Root-finding
=====

###10.1 Introduction

####Focuses 
- root-finding
- fixed-point iteration
- the Newton-Raphson method
- secant method
- bisection method


####Common precedure to find root
1. use root-bracketing to get close to a root
2. then switch over to the Newton-Raphson or secant method when it seems safe to do so

This strategy combines the safety of bisection with the speed of the secant method.

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


###10.3 The Newton-Raphson method
####Assumption
f is differentiable with continuous derivative f′ and a root a.

####Detail
the next best guess x1 is obtained from the current guess x0 by subtracting a correction term f(x0)/f′(x0) 

####Problems
- cannot guarantee convergence of the Newton-Raphson algorithm
- needs the derivative f′

###10.4 The secant method
####Why use it
- If the derivative is hard to compute or does not exist
- secant method only requires that the function f is continuous

####Explanation
- based on a linear approximation to the function f
- pair of guess to update next guess iteratively
- a **second-order** recurrence relation (each new value de-pends on the previous two)
- as an **approximation of the Newton-Raphson method**

###10.5 The bisection method
####limitation of Newton and secant method
- work by producing a sequence of guesses to the root
- under favourable circumstances, converge rapidly to the root from an initial guess
- more reliable: **root-bracketing**

####Def
- check if f(xl)f(xr) < 0 -> choose this interval
- successively refining xl and xr until xr − xl ≤ ε, where ε is some predefined tolerance

####Features
- guaranteed to converge
- the bisection method cannot find a root a if the function f just touches the x-axis at a (since no f(x) < 0 exists)








