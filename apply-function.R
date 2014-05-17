
#apply, tapply, lapply, sapply, rapply, eapply, mapply
# plyr


#apply command which expects a matrix as input

set.seed(1)
(mymat <- matrix(round(rnorm(16,10),2),4,4))
# take the mean of each column- apply the mean function to each column in the matrix

#function to return column mean for a matrix
myloop <- function(somemat) {
 retvec <- vector()
 length(retvec) <- ncol(somemat)
 for (ii in 1:ncol(somemat)) {
   retvec[ii] <- mean(somemat[,ii])
 }
 return(retvec)
}
 

set.seed(1)
newmat <- matrix(rnorm(100),10,10)
myloop(newmat)

#===== use apply() ======#
# 1 - row,  2 - column
apply(mymat, 2, mean)
apply(mymat, 1, mean)
apply(mymat,1,range)
rowMeans(mymat)
colMeans(mymat)

#can simply append arguments after the reference to the function
apply(mymat,2,mean,trim=0.5)

#use a function that we have written and pass it to the apply command
myfunc <- function(x) {
  return(x/sum(x))
}
apply(mymat, 2, myfunc)
colSums(apply(mymat,2,myfunc))

# pass the function to apply in an “anonymous” fashion
apply(mymat, 2, function(x) x/sum(x))


#======= Performance vs the for loop ==========#
url <- "http://steviep42.bitbucket.org/data/su_et_al_2002.txt"
mydata <- read.csv(url,header=T)
str(mydata)

## Let's check the mean and standard deviation for each column
apply(mydata,2,function(x) c(mu=mean(x),sd=sd(x)))


















