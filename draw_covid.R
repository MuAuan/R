library(ggplot2)

coviddata <- read.csv("owid-covid-data.csv", header = T, stringsAsFactors = F)
coviddata <- subset(coviddata, date>"2020-03-01")
coviddata$date <- as.Date(coviddata$date)
coviddata$death_rate <- coviddata$total_deaths/coviddata$total_cases
countries <- c("Japan", "United States", "United Kingdom", "France", "Italy", "Germany", "Spain", "South Korea", "China")

c_total_death <- subset(coviddata, location %in% countries, select=c("date","location","total_deaths"))
g <- ggplot(c_total_death, aes(x=date,  y=total_deaths, color=location)) + geom_line()
plot(g)