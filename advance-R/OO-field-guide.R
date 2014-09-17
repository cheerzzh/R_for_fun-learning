
# S3: generic-function OO, use a special type of function called a generic function decides which method to call
# no formal definition of classes

# S3, S4, Reference classes, base type

# base type
# The type of a function is "closure", and the
# type of a primitive function is "builtin"
f <-function() {}
typeof(f)
is.function(f)#> [1] TRUE
typeof(sum)#> [1] "builtin"
is.primitive(sum)#> [1] TRUE

