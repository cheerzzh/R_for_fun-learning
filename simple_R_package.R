
# This tutorial is about creating a bare-minimum R package
# more detail, refer to advance R: http://adv-r.had.co.nz/Package-basics.html

# step 0: packages needed
#devtools
library(devtools)
devtools::install_github("klutometis/roxygen")
library(roxygen2)

#setp 1: create package directory
setwd("/Users/user/Dropbox/Academic/computer science/R/R_for_fun-learning")
create("cats")

#step 2: add functions to R diectory in package folder

#step 3: add documentation
# you’d rather you can simply create new functions sequentially in one file — 
#just make sure to add the documentation comments before each function.

#step 4: process documentation
setwd("./cats") # this is Mac/Linux specific
document()
#automatically add .Rd file to man directory
# add NAMESPACE file to main 

#step 5: install the packages
# run this from the parent working directory that contains the cats folder.
setwd("..") # this is Mac/Linux specific
install("cats")
