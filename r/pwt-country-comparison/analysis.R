#HW2:
#Compare UK and USA. Use two variables:

# (a) "Expenditure-side real GDP at chained PPPs, to compare relative living standards across 
#     countries and over time"
# (b) "Index of human capital per person"

# 1) Use some descriptive statistics
# 2) Make graphic comparisons 
# 3) Use a World Map to illustrate the distribution of human capital

library(pwt8)
help(pwt8.0)
"(a) is 'rgdpe', (b) is 'hc'"
ukvsusa = subset(pwt8.0, isocode %in% c("USA", "GBR"), select = c(country, year, isocode, rgdpe, hc) )

#1 statistics
library(psych)
describeBy(ukvsusa, ukvsusa$country, omit=TRUE) #gets statistics by country groups

################################
"group: United Kingdom
      vars  n       mean        sd   median    trimmed       mad       min        max
rgdpe    4 62 1062103.33 527565.23 941639.1 1023744.50 517249.07 402224.97 2060801.88
hc       5 62       2.47      0.23      2.5       2.47      0.25      2.07       2.82
           range  skew kurtosis       se
rgdpe 1658576.91  0.61    -0.99 67000.85
hc          0.75 -0.27    -1.16     0.03"

################################
"group: United States of America
      vars  n       mean         sd     median    trimmed        mad        min         max
rgdpe    4 62 6750504.32 3669137.09 5825046.75 6521916.96 4026476.59 1991266.12 13413053.00
hc       5 62       3.23       0.32       3.37       3.25       0.28       2.63        3.62
            range  skew kurtosis        se
rgdpe 11421786.88  0.47    -1.12 465980.88
hc           0.99 -0.54    -1.20      0.04"

#USA has higher standard deviation on both variables means that values are more spread out from the mean.
#USA has also higher standard error on both variables.
#rgdpe on UK and hc on USA are moderately skewed, 0.47 and -0.27 skewness values are rather symmetrical
#low kurtosis values, platykurtic distributions



#2 Graphics
library(ggthemes)
library(ggplot2)
library(ggpubr)

p1 <- ggplot(ukvsusa, 
       aes(x=year, y= hc, color=country)) + 
  geom_line(size=1) +
  labs(title = "Index of human capital per person over time",
       subtitle = "UK vs. USA",
       caption = "source: Penn World Table",
       y = "Human Capital") +
  theme_economist() +
  theme(text = element_text(size = 7))
  scale_color_brewer(palette = "Pastel1")


p2 <- ggplot(ukvsusa, 
       aes(x=year, y= rgdpe, color=country)) + 
  geom_line(size=1) +
  labs(title = "Expenditure-side real GDP over time",
       subtitle = "UK vs. USA",
       caption = "source: Penn World Table",
       y = "Expenditure-side real GDP at chained PPP's") +
  theme_economist() +
  theme(text = element_text(size = 7))+
  scale_color_brewer(palette = "Pastel1")


ggarrange(p1, p2, ncol = 1, nrow = 2)

#although human capital follows similar patterns on both countries, USA makes difference on GDP-growth rate







#3 World Map
levels(pwt8.0$country)[levels(pwt8.0$country)=="China Version 1"] <- "China"
levels(pwt8.0$country)[levels(pwt8.0$country)=="Congo, Republic of"] <- "Congo"
levels(pwt8.0$country)[levels(pwt8.0$country)=="Congo, Democratic Republic"] <- "CD"
levels(pwt8.0$country)[levels(pwt8.0$country)=="Korea, Republic of"] <- "South Korea"

library(googleVis)
plot(
  gvisGeoChart(
    subset(pwt8.0, year == 2011,), 
    "country", 
    "hc", 
    options=list(dataMode='markers', width = 1280, height = 1024, colorAxis="{colors:['#F3B1E4', '#6D1E1E']}",
                 backgroundColor="lightblue", datalessRegionColor="black", defaultColor="black", projection="kavrayskiy-vii"))
  )
  





