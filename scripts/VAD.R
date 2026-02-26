VADeaths
?VADeaths
class(VADeaths)
help(class)
va_df <- as.data.frame(VADeaths)
class(va_df)
View(va_df)
va_df$AgeGroups<-row.names(VADeaths)
View(va_df)
va_df
#Changing the data into "Long" Format using "reshape" function
va_long=reshape(va_df,direction="long", 
                varying = colnames(VADeaths) ,
                v.names="DeathRate" ,
                timevar="Population" ,
                times=colnames(VADeaths))
va_long
hist(va_long$DeathRate)

#Changing title and labels
hist(va_long$DeathRate,
     #breaks=5,
     main="Basic Histogram of VA Deathrates",
     xlab="VA Deathrates",
     ylab="Frequency",
     labels=TRUE,
     col="white",
     border="black"
)

#Data
#Asthetics -->X,,Y axis to various variables
#Geometry
#Facets
#Statistics
#Coordinates
#Themes
#Labels
library(ggplot2)

ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(bins=5,
                 fill="steelblue",col="white")+
  labs(title="GGPLOT-Histogram",
       x="Death Rate",
       y="Frequency")+
  #facet_wrap(~Population)
  theme_light()

