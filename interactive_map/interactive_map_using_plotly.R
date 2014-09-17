
install.packages("devtools")
library("devtools")
devtools::install_github("R-api","plotly")

# log in to our plotly account straight from R by typing in our respective username and API key 
library(plotly)
library(maps)
p <- plotly(username="cheerzzh", key="mpll3oxels")
