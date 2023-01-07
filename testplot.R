library(tidyverse)

SOC = data.frame(Sub_Paddock = c(6.1, 7.1, 8.1, 13.1, 13.4, 14.1, 14.4, 22.1, 22.4, 24.1, 25.1, 27.1, 27.4, 28.1, 28.4, 30.1, 31.1, 32.1, 32.4, 33.1, 33.4, 35.1, 36.1, 37.1, 37.4, 39.1, 39.4, 6.1, 7.1, 8.1, 13.1, 13.4, 14.1, 14.4, 22.1, 22.4, 24.1, 25.1, 27.1, 27.4, 28.1, 28.4, 30.1, 31.1, 32.1, 32.4, 33.1, 33.4, 35.1, 36.1, 37.1, 37.4, 39.1, 39.4),
                 
Value = c(31.27, 31, 48.01, 51.98, 52.46, 30.71, 29.75, 15.8, 29.07, 22.5, 23.22, 63.57, 55.06, 39.9, 42.7, 43.57, 32.36, 52.26, 57.19, 40.47, 37.19, 54.29, 43.47, 48.88, 41.05, 52.53, 47.04, 49.32, 44.24, 40.85, 44.73, 44.73, 46.7, 46.7, 36.2, 36.2, 41.53, 33.21, 32.24, 32.24, 29.02, 29.02, 26.88, 27.37, 28.92, 28.92, 39.08, 39.08, 40.78, 40.36, 29.24, 29.24, 39.46, 39.46),

Method = c("RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "RothC", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field", "Field"))

ggplot(data=SOC, aes(x=Sub_Paddock, y=Value, group=Method, colour=Method)) +
  
  geom_bar() +
  
  ylim(0,70)