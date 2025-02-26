library(tidyverse)
library(caret)

# Define the function
simulate_rmse <- function(n) {
  # Generate the dataset with n observations
  Sigma <- 9 * matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2)
  dat <- MASS::mvrnorm(n = n, c(69, 69), Sigma) %>%
    data.frame() %>% setNames(c("x", "y"))
  
  # Run the replicate loop to build 100 models and calculate RMSEs
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
  
  # Return results as a named vector
  return(c(mean_rmse = mean_rmse, sd_rmse = sd_rmse))
}

# Set seed for reproducibility
set.seed(1)

# Apply the function to different values of n
n_values <- c(100, 500, 1000, 5000, 10000)
results <- sapply(n_values, simulate_rmse)

# Convert results to a data frame for better readability
results_df <- data.frame(
  n = n_values,
  mean_rmse = results["mean_rmse", ],
  sd_rmse = results["sd_rmse", ]
)

# Print the results
print(results_df)