
c(1,c(2,c(3,4)))

int_var <- c(1L,6L,10L)
typeof(int_var)
is.integer(int_var)
is.double(int_var)
is.numeric(int_var


#An atomic vector can only be of one type
#Types from least to most flexible are: 
#logical, integer, double and character

c('a',1)


#list
#can contain any other type of vector
x <-list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
str(x)
#recursive vectors
x <-list(list(list(list())))
str(x)
is.recursive(x)

#c() will combine several lists into one
x <-list(list(1, 2), c(3, 4))
y <-c(list(1, 2), c(3, 4))
str(x)
str(y)

#test whether a list
is.list(mtcars)
names(mtcars)
str(mtcars$mpg)

#turn a list back into an atomic vector using unlist().


#All objects can have arbitrary additional attributes
y <- 1:10
attr(y,"my_attributes") <- "this is a vector"
str(attributes(y))
# structure() function returns a new object with modified attributes:
structure(1:10, my_attribute ="This is a vector")
#most attributes are lost when modifying a vector
attributes(y)
attributes(y[1])


#name
y <-c(a =1, 2, 3)
names(y)
names(x) <- NULL


#facotrs
#dealing with qualitative data
#built on top of an integer vector using an S3 class
x <-factor(c("a", "b", "b", "a"))
x
class(x)

#only print 1:5
print(structure(1:5, comment ="my attribute"))

#A special case of a general array is the matrix, which has two dimensions
# Two scalar arguments to specify rows and columns
a <-matrix(1:6, ncol =3, nrow =2)
rownames(a) <-c("A", "B")
colnames(a) <-c("a", "b", "c")
a
# One vector argument to describe all dimensions
b <-array(1:12, c(2, 3, 2))
dim(b)
dimnames(b) <-list(c("one", "two"), c("a", "b", "c"), c("A", "B"))
b

# You can also modify an object in place by setting dim()
c <-1:6
dim(c) <-c(3, 2)
c #c became a matrix
length(c)


#You can have matrices with a single row or single column, 
#or arrays with a single dimension. 
#They may print similarly, but will behave differently. 

str(1:3)  # 1d vector
str(matrix(1:3, ncol =1)) #1 column vector
str(matrix(1:3, nrow =1)) # 1 row vector
str(array(1:3, 3))

#list-matrices or list-arrays:
l <-list(1:3, "a", TRUE, 1.0)
dim(l) <-c(2, 2)
l 

#Exercise
#if is.matrix(x) is TRUE, what will is.array(x) return?--- Yes!
x = matrix(1:6,2,3)
is.matrix(x)
is.array(x)

#data.frame

#cbind() force 1:2 to become char
bad <-data.frame(cbind(a =1:2, b =c("a", "b")))
str(bad)

good <-data.frame(a =1:2, b =c("a", "b"),  stringsAsFactors =FALSE)
str(good)

#possible for a data frame to have a column that is a list:
df <-data.frame(x =1:3)
df$y <-list(1:2, 1:3, 1:4)
df
#when a list is given to data.frame(), it tries to put each item of the list into its own column, so this fails
data.frame(x =1:3, y =list(1:2, 1:3, 1:4))
#use I(), which causes data.frame() to treat the list as one unit
dfl <-data.frame(x =1:3, y =I(list(1:2, 1:3, 1:4)))
str(dfl)


# possible to have a column of a data frame that's a matrix or array
dfm <-data.frame(x =1:3, y =I(matrix(1:9, nrow =3)))
dfm
