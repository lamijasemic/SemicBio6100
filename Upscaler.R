library(pracma)
library(pryr)
library(devtools)
install_github("ngotelli/upscaler")
help(package="upscaler")
library(upscaler)
library(dplyr)
library(readr)
library(broom)
library(ggplot2)
library(stringr)

# List of specific file paths
#read.csv("count_2015.csv", "count_2016.csv", "count_2017.csv","count_2018.csv", "count_2019.csv","count_6_2020.csv","count_7_2020.csv", "count_2021.csv", "count_2022.csv", "count_2023.csv")


# List all CSV files in a directory
file_list <- list.files("/Users/lamijas/Desktop/Computational Biology/Upscaler", pattern = "\\.csv$", full.names = TRUE)

# Read all files into a list of data frames
data <- lapply(file_list, read_csv)

# Extract years from file names
years <- str_extract(file_list, "\\d{4}")

# Function 1: Clean data (remove rows with missing values)
clean_data <- function(data) {
  return(na.omit(data))
}

# Calculate Abundance
calc_abundance <- function(cleaned_data) {
  return(sum(cleaned_data$count, na.rm = TRUE))
}

# Calculate Richness
richness <- function(cleaned_data) {
  return(length(unique(cleaned_data$species)))
}

# Prepare data for plotting
plot_data <- data.frame(
  abundance = sapply(data, function(x) calc_abundance(clean_data(x))),
  richness = sapply(data, function(x) richness(clean_data(x))),
  year = years
)

# Combine all data frames for regression
combined_data <- do.call(rbind, data)

# Regression model
regression <- lm(richness ~ abundance, data = plot_data)

# Scatter plot with regression line
ggplot(plot_data, aes(x = abundance, y = richness)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Regression: Richness vs Abundance",
       x = "Abundance",
       y = "Richness") +
  theme_minimal()

# Abundance histogram
ggplot(combined_data, aes(x = count)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Abundance", x = "Count", y = "Frequency") +
  theme_minimal()

# Richness histogram
ggplot(plot_data, aes(x = richness)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Richness", x = "Richness", y = "Frequency") +
  theme_minimal()
