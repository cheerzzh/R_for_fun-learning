
# quite a bit file, you should leverage the data.table command fread()
library(data.table) 
geo <- fread("GeoLiteCity-Location.csv", header=T, skip=1)
# how many rows? 
(geoRows <- nrow(geo))

# around 4.2 billion total IP address, 3.7 billion are routable (
# emove duplicate points with the unique function. Then load up a world map, and plot the points on it.

geomap1 <- unique(geo, by=c("latitude", "longitude"))

library(maps) 
library(ggplot2)

#load the world 
world_map<-map_data("world")
# strip off antartica for aesthetics 
world_map <- subset(world_map, region != "Antarctica") # sorry penguins

# set up the plot with the map data 
gg <- ggplot(world_map)

# now add a map layer 
gg <- gg + geom_map(dat=world_map, map = world_map, 
                    aes(map_id=region), fill="white", color="gray70")

# and the ip geolocation points 
gg <- gg + geom_point(data=geomap1, aes(longitude, latitude), 
                      colour="#AA3333", alpha=1/10, size=0.5)

# basic theme 
gg <- gg + theme_bw() 
# show the map 
print(gg)

# account for the density of the IP addresses.
blocks <- fread("GeoLiteCity-Blocks.csv", header=T, skip=1)
# these columns are read is as character for some reason 
# make them numeric
blocks <- blocks[, lapply(.SD, as.numeric)]
fullgeo <- merge(blocks, geo, all=TRUE, by="locId") # "all" is important here
# trim out the columns we need 
fullgeo <- fullgeo[ ,c(2,3,8,9), with=FALSE]
# set column names that are easier to type
setnames(fullgeo, c("begin", "end", "latitude", "longitude"))
# look at the data 
print(fullgeo)

sum(is.na(fullgeo$begin))

library(dplyr)
# tbl_dt loads a data.table object into dplyr 
# and the %>% is the "pipe" command to send the output
# to the next command.
finalgeo <- tbl_dt(fullgeo) %>% filter(!is.na(begin)) %>% # remove the NA's.
  mutate(count = end - begin + 1) %>% # count the # of IPs 
  group_by(latitude, longitude) %>% # aggregate by unique lat and long 
  summarise(ipcount=sum(count)) # add up all counts

# what do we have? 
print(finalgeo)

# Explore the data
# distribution of the counts look like









