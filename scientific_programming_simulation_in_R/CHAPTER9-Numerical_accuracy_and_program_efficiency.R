
# CHAPTER 9: Numerical accuracy and program efficiency

.Machine$integer.max
1.2e3
1/0
0/0

2^-1074  == 0
2^-1074 +1 ==1
1/(2^-1074)

x <- 1 + 2^-52
x-1 # != 0

y <- 1 + 2^-53
y-1 # == 0



