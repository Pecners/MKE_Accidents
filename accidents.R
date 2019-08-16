library(tidyverse)
library(lubridate)

accidents <- read_csv("https://data.milwaukee.gov/dataset/5fafe01d-dc55-4a41-8760-8ae52f7855f1/resource/8fffaa3a-b500-4561-8898-78a424bdacee/download/trafficaccident.csv")

daily_a <- accidents %>%
  group_by(date = floor_date(CASEDATE, unit = "days")) %>%
  summarise(accidents = n()) %>%
  mutate(weekday = wday(date, label = TRUE))


daily_a %>%
  ggplot(aes(date, accidents)) +
  geom_point(alpha = 0.3) +
  geom_vline(xintercept = as_datetime(c("2008-01-01", "2019-07-01")), color = "red") +
  geom_curve(aes(x = as_datetime("2007-01-01"),
                   y = 100,
                   xend = as_datetime("2007-12-15"),
                   yend = 85),
             arrow = arrow(), size = 1) +
  annotate("text", x = as_datetime("2007-01-01"),
           y = 103,
           label = "Jan 1, 2008") +
  theme_minimal()

