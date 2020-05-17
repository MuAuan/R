library(ggrepel)
require(scales) # to access break formatting functions

#data setting
c_tdpm               <- subset(coviddata, location %in% countries, select = c("date","location","total_deaths_per_million"))
c_sr                 <- subset(coviddata, location %in% countries, select = c("date","location","death_rate"))
colnames(c_sr)       <- c("Date","Country","data")
colnames(c_tdpm)     <- c("Date","Country","data")
c_sr$datatype        <- "death_rate"
c_tdpm$datatype      <- "total_deaths_per_million"
c_tdpm_sr            <- rbind(c_sr, c_tdpm)

g1 <- ggplot(c_tdpm_sr, aes(x=Date,  y=data, 
                            color=Country, linetype=Country,size=1)) + 
  geom_line(size=1) + geom_point(shape="o",size=2)+ 
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(title="Deaths Rate \n Total_Deaths_per_million",
       x="Date", y = "deaths rate & tdpm") +
  geom_text_repel(
    data = subset(c_tdpm_sr, Date == max(Date)),
    aes(label = Country),
    nudge_x = 100,
    segment.alpha = 1,
    size = 3
  )+  
  theme(legend.position = "none",plot.title = element_text(hjust = 0.5))+
  facet_wrap(~datatype,
             ncol = 2,
             scales = "free"
  ) 
plot(g1)

ggsave("log_tdpm_sr_plot.jpg")
 