library(tidyverse)
library(caret)

# Set seed for reproducibility
set.seed(1)

# Generate the dataset with higher correlation
n <- 100
Sigma <- 9 * matrix(c(1.0, 0.95, 0.95, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))

# Set seed again for reproducibility
set.seed(1)

# Perform 100 iterations
rmse_results <- replicate(100, {
  # Partition the dataset into training and test sets
  test_index <- createDataPartition(dat$y, p = 0.5, list = FALSE)
  train_set <- dat[-test_index, ]
  test_set <- dat[test_index, ]
  
  # Train a linear model
  model <- lm(y ~ x, data = train_set)
  
  # Generate predictions on the test set
  predictions <- predict(model, newdata = test_set)
  
  # Calculate RMSE
  rmse <- sqrt(mean((predictions - test_set$y)^2))
  
  return(rmse)
})

# Calculate mean and standard deviation of RMSEs
mean_rmse <- mean(rmse_results)
sd_rmse <- sd(rmse_results)

# Report results
cat("Mean RMSE:", round(mean_rmse, 3), "\n")
cat("Standard Deviation of RMSE:", round(sd_rmse, 3), "\n")