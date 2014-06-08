install.packages("devtools")
library(devtools)

install_github('slidify', 'ramnathv')
install_github('slidifyLibraries', 'ramnathv')

library(slidify)

author("first_deck")

slidify('index.Rmd') #compile 

library(knitr)
browseURL("index.html") # view html file

# Publishing to Github
publish_github(user, repo)
