CHAPTER 9: Numerical accuracy and program efficiency
====

accuracy and speed
A single ON/OFF indicator is called a bit. 8 bits -> a byte.

###schema used to encode integers
- sign-and-magnitude: two representations of 0
- biased: addition becomes a little more com-plex
- two’s complement schema: most popular,equivalent to normal addition

machine epsilon: the smallest number x such that 1 + x can be distinguished from 1 -> 2^-52

The double precision scheme we have described here is part of the IEEE Standard for Binary Floating-Point Arithmetic IEEE 754-1985

**.Machine** will give you details about your local numerical environment.

