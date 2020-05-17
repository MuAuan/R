c_tdpm               <- subset(coviddata, location %in% countries, select = c("date","location","total_deaths_per_million"))
c_sr                 <- subset(coviddata, location %in% countries, select = c("date","location","death_rate"))
colnames(c_sr)       <- c("Date","Country","data")
colnames(c_tdpm)     <- c("Date","Country","data")
c_sr$datatype        <- "death_rate"
c_tdpm$datatype      <- "total_deaths_per_million"
c_tdpm_sr            <- rbind(c_sr, c_tdpm)

opts = c("p","l","o","b","c","s","S","h")
cyl=c("3")

g1 <- ggplot(c_tdpm_sr, aes(x=Date,  y=data, 
                            color=Country, linetype=Country,size=0.5)) + 
  geom_line() + geom_point(shape=18)+ theme(legend.position="top")+
  theme(
    legend.title = element_text(color = "blue", size = 10),
    legend.text = element_text(color = "red", size = 10), 
    legend.plot = element_plot(color = "red", size = 10)
  )+
  guides(size = guide_legend(order=1))+
  facet_wrap(~datatype,
             ncol = 1,
             scales = "free"
  ) 
plot(g1)

