
#dig a hole thrpugh earth
#capital cities represent approximately 7% of the world population so in this sense is a very good sample.
#My estimation is around 77% of people will find water on the other side


library(xlsx)
library(ggmap)
library(mapdata)
library(ggplot2)


#The xls file is in http://esa.un.org/unpd/wup/CD-ROM/WUP2011-F13-Capital_Cities.xls
CapitalCities <- read.xlsx("WUP2011-F13-Capital_Cities.xls", sheetName="Capital_Cities", startRow=13,header=TRUE)
names(CapitalCities) = gsub("\\.", "", names(CapitalCities))
#Obtain symmetric coordinates for each capital
CapitalCities$LatitudeSym <- -CapitalCities$Latitude
CapitalCities$LongitudeSym <- -sign(CapitalCities$Longitude)*(180-abs(CapitalCities$Longitude))
CapitalCities$DigResult <- apply(CapitalCities, 1, function(x) {unlist(revgeocode(c(as.numeric(x[11]),as.numeric(x[10]))))})
CapitalCities$Drowned <- is.na(CapitalCities$DigResult)*1
#Percentage of population saved
sum(CapitalCities$Drowned*CapitalCities$Populationthousands)/sum(CapitalCities$Populationthousands)
world <- map_data("world")
opt <- theme(legend.position="none",
axis.ticks=element_blank(),
axis.title=element_blank(),
axis.text =element_blank(),
plot.title = element_text(size = 35),
panel.background = element_rect(fill="turquoise1"))
p <- ggplot()
p <- p + geom_polygon(data=world, aes(x=long, y=lat, group = group),colour="white", fill="lightgoldenrod2" )
p <- p + geom_point(data=CapitalCities, aes(x=Longitude, y=Latitude, color=Drowned, size = Populationthousands)) + 
		scale_size(range = c(2, 20), name="Population (thousands)")
p <- p + labs(title = "What if you dig a hole through the Earth?")
p <- p + scale_colour_gradient(low = "brown", high = "blue")
p <- p + annotate("rect", xmin = -135, xmax = -105, ymin = -70, ymax = -45, fill = "white")
p <- p + annotate("text", label = "Drowned", x = -120, y = -60, size = 6, colour = "blue")
p <- p + annotate("text", label = "Saved", x = -120, y = -50, size = 6, colour = "brown")
p <- p + geom_point(aes(x = -120, y = -65), size=8, colour="blue")
p <- p + geom_point(aes(x = -120, y = -55), size=8, colour = "brown")
p + opt
# Get a map of Spain, centered and signed in Madrid
madrid <- geocode('Madrid, Spain')
map.madrid <- get_map( location = as.numeric(madrid), color = "color", maptype = "roadmap", scale = 2, zoom = 6)
ggmap(map.madrid) + geom_point(aes(x = lon, y = lat), data = madrid, colour = 'red', size = 4)
# Get a map of New Zealand, centered and signed in Weber (the antipode of Madrid)
weber <- geocode('Weber, New Zealand')
map.weber <- get_map( location = as.numeric(weber), color = "color", maptype = "roadmap", scale = 2, zoom = 6)
ggmap(map.weber) + geom_point(aes(x = lon, y = lat), data = weber, colour = 'red', size = 4)