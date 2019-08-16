library(tidyverse)
library(lubridate)

data1 <- read_csv("data/1840081.csv")
data2 <- read_csv("data/1840086.csv")

full_weather <- bind_rows(data1, data2)

rm(data1)
rm(data2)

weather <- full_weather %>%
  select(date = DATE,
         )

daily_w <- weather %>%
  group_by(date = mdy(DATE)) %>%
  summarise(rainfall = mean(PRCP),
            snow = mean(SNOW)) %>%
  arrange(date)

x <- c("Spencer", "Schien")
