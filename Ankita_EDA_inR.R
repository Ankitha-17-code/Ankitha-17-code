# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the dataset
indian_food <- read.csv("/home/ansio-user/Downloads/indian_food.csv")

# View the structure of the dataset
str(indian_food)

# Basic summary statistics
summary(indian_food)

# Check for missing values
colSums(is.na(indian_food))

# Univariate Analysis: Distribution of preparation time
ggplot(indian_food, aes(x = prep_time)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "white") +
  labs(title = "Distribution of Preparation Time", x = "Preparation Time (minutes)", y = "Frequency")

# Univariate Analysis: Distribution of cooking time
ggplot(indian_food, aes(x = cook_time)) +
  geom_histogram(binwidth = 10, fill = "green", color = "white") +
  labs(title = "Distribution of Cooking Time", x = "Cooking Time (minutes)", y = "Frequency")

# Bivariate Analysis: Preparation time vs Cooking time
ggplot(indian_food, aes(x = prep_time, y = cook_time)) +
  geom_point(color = "red") +
  labs(title = "Preparation Time vs Cooking Time", x = "Preparation Time (minutes)", y = "Cooking Time (minutes)")

# Boxplot: Preparation time by Diet
ggplot(indian_food, aes(x = diet, y = prep_time, fill = diet)) +
  geom_boxplot() +
  labs(title = "Preparation Time by Diet", x = "Diet", y = "Preparation Time (minutes)")

# Bar Plot: Count of Dishes by Flavor Profile
ggplot(indian_food, aes(x = flavor_profile)) +
  geom_bar(fill = "orange") +
  labs(title = "Count of Dishes by Flavor Profile", x = "Flavor Profile", y = "Count")

# Bar Plot: Count of Dishes by Course Type
ggplot(indian_food, aes(x = course)) +
  geom_bar(fill = "purple") +
  labs(title = "Count of Dishes by Course Type", x = "Course", y = "Count")

# Bivariate Analysis: Dishes by Region and State
ggplot(indian_food, aes(x = state, fill = region)) +
  geom_bar() +
  coord_flip() +
  labs(title = "Dishes by Region and State", x = "State", y = "Count")

# Bivariate Analysis: Diet vs Flavor Profile
ggplot(indian_food, aes(x = diet, fill = flavor_profile)) +
  geom_bar(position = "dodge") +
  labs(title = "Diet vs Flavor Profile", x = "Diet", y = "Count")

# Save the plots to a PDF file
pdf("/home/ansio-user/Downloads/EDA_Indian_Food.pdf")
print(ggplot(indian_food, aes(x = prep_time)) + geom_histogram(binwidth = 10, fill = "blue", color = "white") + labs(title = "Distribution of Preparation Time", x = "Preparation Time (minutes)", y = "Frequency"))
print(ggplot(indian_food, aes(x = cook_time)) + geom_histogram(binwidth = 10, fill = "green", color = "white") + labs(title = "Distribution of Cooking Time", x = "Cooking Time (minutes)", y = "Frequency"))
print(ggplot(indian_food, aes(x = prep_time, y = cook_time)) + geom_point(color = "red") + labs(title = "Preparation Time vs Cooking Time", x = "Preparation Time (minutes)", y = "Cooking Time (minutes)"))
print(ggplot(indian_food, aes(x = diet, y = prep_time, fill = diet)) + geom_boxplot() + labs(title = "Preparation Time by Diet", x = "Diet", y = "Preparation Time (minutes)"))
print(ggplot(indian_food, aes(x = flavor_profile)) + geom_bar(fill = "orange") + labs(title = "Count of Dishes by Flavor Profile", x = "Flavor Profile", y = "Count"))
print(ggplot(indian_food, aes(x = course)) + geom_bar(fill = "purple") + labs(title = "Count of Dishes by Course Type", x = "Course", y = "Count"))
print(ggplot(indian_food, aes(x = state, fill = region)) + geom_bar() + coord_flip() + labs(title = "Dishes by Region and State", x = "State", y = "Count"))
print(ggplot(indian_food, aes(x = diet, fill = flavor_profile)) + geom_bar(position = "dodge") + labs(title = "Diet vs Flavor Profile", x = "Diet", y = "Count"))
dev.off()
