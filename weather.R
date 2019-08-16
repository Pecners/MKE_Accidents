library(tidyverse)
library(lubridate)

weather <- read_csv("mke_weather.csv")

daily_w <- weather %>%
  group_by(date = mdy(DATE)) %>%
  summarise(rainfall = mean(PRCP),
            snow = mean(SNOW)) %>%
  arrange(date)

