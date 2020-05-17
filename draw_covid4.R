library(ggrepel)

coviddata <- read.csv("owid-covid-data.csv", header = T, stringsAsFactors = F)
coviddata <- subset(coviddata, date>"2020-03-01")
coviddata$date <- as.Date(coviddata$date)
coviddata$death_rate <- coviddata$total_deaths/coviddata$total_cases

countries <- c("Japan", "United States", "United Kingdom", "France", "Italy", "Germany", "Spain", "South Korea", "China")

c_total_death <- subset(coviddata, location %in% countries, select=c("date","location","total_deaths"))
g <- ggplot(c_total_death, aes(x=date,  y=total_deaths, color=location)) + geom_line()
plot(g)

c_tdpm               <- subset(coviddata, location %in% countries, select = c("date","location","total_deaths_per_million"))
c_sr                 <- subset(coviddata, location %in% countries, select = c("date","location","death_rate"))
colnames(c_sr)       <- c("Date","Country","data")
colnames(c_tdpm)     <- c("Date","Country","data")
c_sr$datatype        <- "death_rate"
c_tdpm$datatype      <- "total_deaths_per_million"
c_tdpm_sr            <- rbind(c_sr, c_tdpm)


g1 <- ggplot(c_tdpm, aes(x=Date,  y=data, 
                            color=Country, linetype=Country,size=1)) + 
  geom_line(size=2) + geom_point(shape="o",size=5)+ 
  labs(title="Total_Deaths_per_million",
       x="Date", y = "total_deaths_per_million")+
  geom_text_repel(
    data = subset(c_tdpm, Date == max(Date)),
    aes(label = Country),
    nudge_x = 100,
    segment.alpha = 0.5,
    size = 5
  )+  
  theme(legend.position = "none")+
  facet_wrap(~datatype,
             ncol = 1,
             scales = "free"
  )
plot(g1)
ggsave("tdpm_plot.jpg")

g2 <- ggplot(c_sr, aes(x=Date,  y=data, 
                         color=Country, linetype=Country,size=1)) + 
  geom_line(size=2) + geom_point(shape="o",size=3)+ 
  scale_y_continuous(labels = scales::percent)+
  labs(title="Deaths Rate",
       x="Date", y = "deaths rate")+
  geom_text_repel(
    data = subset(c_sr, Date == max(Date)),
    aes(label = Country),
    nudge_x = 100,
    segment.alpha = 0.5,
    size = 5
  )+  
  theme(legend.position = "none")+
  facet_wrap(~datatype,
             ncol = 1,
             scales = "free"
  )
plot(g2)
ggsave("deathsRate_plot.jpg")
