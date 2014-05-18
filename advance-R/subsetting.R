
#subsetting

#the three subsetting operators
#the six types of subsetting
#the important difference in subsetting behaviour for different objects (e.g. vectors, lists, factors, matrices and data frames)
#the use of subsetting in conjunction with assignment


#three subsetting operators
# [, [[, $

##==========atomic vectors============##
x <-c(2.1, 4.2, 3.3, 5.4)
# 5 ways to subsetting x
# 1. positive numbers
x[c(3,1)]
x[order(x)]
# 2. negative numbers
x[-c(3,1)]
x[c(-1, 2)]#error to mix positive and negative integers in a single subset:
# 3. logical vector
x[c(TRUE, TRUE, FALSE, FALSE)]
x[x >3]
x[c(TRUE, FALSE)] #shorter logical vector will be recycled
# 4. with nothing- useful when 2D
x[]
# 5. with zero- returns a zero-length vector. 
x[0]
# 6. character vector- if the vector is named
(y <-setNames(x, letters[1:4]))
y[c("d", "c", "a")]
y[c("a", "a", "a")]
z <-c(abc =1, def =2)
z[c("a", "d")] #return 2 NA

##===============list================##

##===============matrices & arrays================##
# 3 ways to subset high dimensional 

# 1. index 
a <-matrix(1:9, nrow =3)
colnames(a) <-c("A", "B", "C")
a[1:2, ]
a[c(T, F, T), c("B", "A")]
a[0, -2] #get col name..

#outer(x,y)-  return outer product of arrays X and Y
(vals <-outer(1:5, 1:5, FUN ="paste", sep =","))
vals[c(4,15)]  #array stored in columnb major order
select <-matrix(ncol =2, byrow =TRUE, c(  1, 1,  3, 1,  2, 4))
vals[select]#Each row in the matrix specifies the location of a value, with each column corresponding to a dimension in the array being subsetted


##===============data frames================##
#Data frames possess the characteristics of both lists and matrices
df <-data.frame(x =1:3, y =3:1, z = letters[1:3])

df[c("x", "z")]# like a list
df[, c("x", "z")] # like a matrix
## matrix subsetting simplifies by default, list subsetting does not.

##===============S3 objects================##
#S3 objects are made up of atomic vectors, arrays and lists

##===============S4 objects================##
#two additional subsetting operators
# @  and slot()

#[[]] and $ - pull elements in list


#=== simplifying and preserving subsetting====#
# option: drop = FALSE

#atomic vector
x <- c(a=1,b=2)
x[1] #preserve name
x[[1]]

#list
y <- list(a=1, b=2)
str(y[1]) #return list
str(y[[1]]) #return a neumric

#factor
z <- factor(c("a","b"))
z[1] #still 2 level
z[[1]] # only one level 

#matrix & array
a <-matrix(1:4, nrow =2)
a[1, , drop =FALSE] #still a matrix
a[1, ] #drop one dimenon

#data frame
df <-data.frame(a =1:2, b =1:2)
str(df[1]) # return a data frame
str(df[[1]]) 
str(df[,"a",drop=FALSE])

#======= $  ===========#
# $ is a shorthand operator
# x$y is equicalent to x[['y',exact = FALSE]] 
# $ does partial matching

#==== Missing/out of bounds indices ====#
x <-1:4
str(x[5])
str(x[NA_real_])
str(x[NULL])

mod <- lm(mpg ~ wt, data = mtcars)
str(mod)
mod$df.residual
str(summary(mod))
summary(mod)$r.squared

#============ Subsetting and assignment ===========#
# subsetting + assignment = modify selected values

#index with a blank- to preserve the original object class and structure
mtcars[] <- lapply(mtcars,as.integer)
mtcars <- lapply(mtcars,as.integer)

#remove component from a list
x <-list(a =1, b =2)
x[["b"]] <-NULL
str(x)

y <-list(a =1)
y["b"] <-list(NULL)
str(y)

