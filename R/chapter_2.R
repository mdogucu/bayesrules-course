library(dplyr)
library(ggplot2)

# Define possible outcomes
weather <- data.frame(precipitation = c("no_rain", "rain"))
weather

# Define prior model of rain
prior <- c(0.8, 0.2)

# Simulate 3 days of precipitation
sample_n(weather, size = 3, weight = prior, replace = TRUE)

# Set the seed for reproducibility
set.seed(3)

# Simulate 3 days of precipitation
sample_n(weather, size = 3, weight = prior, replace = TRUE)

# Set the seed for reproducibility
set.seed(3)

# Simulate 10000 days of precipitation
weather_sim <- sample_n(weather, size = 10000, weight = prior, replace = TRUE)

# Check out some features
nrow(weather_sim)

head(weather_sim, 4)

ggplot(weather_sim, aes(x = precipitation)) + 
  stat_count()


# Tally the 10000 outcomes
addmargins(table(weather_sim$precipitation))


# Calculate the proportions
addmargins(prop.table(table(weather_sim$precipitation)))


