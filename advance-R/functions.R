
# rigorous understanding of what functions are and how they work.
#functions are objects in their own right

#========== topics to learn ============#
#  three main components of a function
#  scoping
#  function call
#  three ways of supplying arguments to a function
#  lazy evaluation
#  infix and replacement functions
#  what a function can return
# ========================================#

#===Components of a function ==========#
# 1. body() the code inside
f <- function(x) x^2
body(f)

# 2. formals() the list of arguments 
formals(f)

# 3. environment() the location of function's variables
environment(f)


#======= primitive function==========#
# call C code thus no R code
#only found in the base package,

# all 3 comp are NULL
sum
formals(sum)
body(sum)
environment(sum)


#========= lexical scoping ===============#
#how R looks up the value of a symbol.
#lexical scoping, implemented automatically at the language level
# based on how functions were nested when they were created

# four basic principles behind R's implementation of lexical scoping:
# 1. name masking
# 2. functions vs. variables
# 3. a fresh start
# 4. dynamic lookup

# 1. name masking
f <-function() {  
	x <-1  
	y <-2
	c(x, y)
	}
f()
rm(f) #remove f

#f a name isn't defined inside a function, R will look one level up.
x <-2
g <-function() { 
 	y <-1
 	c(x, y)}

 g()
 rm(x, g)

# a function is defined inside another function: 
# look up variables all the way up to the global environment

#closures, functions created by other functions.
j <- function(x){
	y <- 2
	function(){
		c(x,y)
	}
}

k <- j(1)
k()
rm(k)

## 2. fucntions vs. variables
# find function just like find variables- look up at the current environment
l <- function(x) x+1
m <- function(){
	l <- function(x) x*2
	l(10)
}

m() # will call l() indide m()
rm(l,m)

#when search for function, R will ignore the objects that are not functions
n<- function(x)x/2
o <- function(){
	n <- 10
	n(n)
}

o()
rm(n,o)

## 3. a fresh start
# every time a function is called, a new environment is created to host execution.
# each invocation is completely independent.

## 4. dynamic lookup
#R looks for values when the function is run, not when it's created.
#output of a function can be different depending on objects outside its environment:
# you may not get an error reagrding missing object when you define the function

# findGlobals(): lists all the external dependencies of a function:
f <-function() x +1
codetools::findGlobals(f)
# It's never possible to make a function completely self-contained 
#because you must always rely on functions defined in base R or other packages.

#can override standard operator by own functions
`(` <-function(e1) {  
	if (is.numeric(e1) &&runif(1) <0.1) {    
		e1 +1  
	} 
	else {   
	 e1  }
}

replicate(100,(1+2))
rm("(")

#exercise
f <-function(x) {  
	f <-function(x) {   
	 f <-function(x) {     
	  x ^2    }  
	    f(x) +1  }  
	    f(x) *2}
f(10) # = 202 = (10^2 +1)*2


#============Every operation is a function call ===========#
# every operator is function
x<-10; y<- 5
x+y
"+"(x,y)

for(i in 1:2) print(i)
"for"(i,1:2,print(i))

if(i ==1) print("yes!") else print("no")
"if"(i==1,print("yes!"),print("no"))

x[3]
'['(x,3)

#treat special function as ordinary functions
sapply(1:5, `+`, 3)

#the difference between `+` and "+". The first one is the value of the object called +, 
#and the second is a string containing the character +

#=============== function arguments ===================#




#=========== special calls==============#
# 1. infix function: functions between arguments
# starts with % and end with % 

'%+%' <- function(a,b) paste(a,b,sep="")
"new" %+% "string"
'%+%'("new","string")

#t infix operators are composed from left to right
`%-%` <-function(a, b) paste0("(", a, " %-% ", b, ")")
"a" %-% "b" %-% "c" # see the order of calling

# q useful function to put default value of Null
`%||%` <-function(a, b) if (!is.null(a)) a else b
function_that_might_return_null() %||%default value

# 2. replacement function
# "modify the arguemnt "
`second<-` <-function(x, value) { 
 x[2] <-value  
 x
}

x<- 1:10
second(x) <- 5 # actually make a modifed copy since has different address
x 
#check address
library(pryr)
x <-1:10
address(x)


#=============== return valuse ==================#
#last expression evaluated in a function becomes the return value
# function only can return one object
# you can return a list containing any number of objects.


# the use of on.exit()













