# Optimizing Classification with F1-Score

## Key Points

- Instead of analyzing **specificity** and **sensitivity** separately, a single metric can summarize performance.
- **Balanced accuracy** provides a useful alternative, but **F1-score** is often preferred.
- **F1-score** is the **harmonic average** of **precision** and **recall**.
- The F1-score can be adjusted to **weigh specificity and sensitivity differently** based on context.
- Use the `F_meas()` function from the `caret` package to compute the F1-score.

---

## Code to Maximize F1-Score

```r
# Load necessary libraries
library(caret)
library(ggplot2)
library(purrr)

# Define cutoff values to test
cutoff <- seq(61, 70)

# Compute F1-score for each cutoff
F_1 <- map_dbl(cutoff, function(x) {
  y_hat <- ifelse(train_set$height > x, "Male", "Female") %>% 
    factor(levels = levels(test_set$sex))
  
  F_meas(data = y_hat, reference = factor(train_set$sex))
})

# Visualizing F1-score for different cutoff values
data.frame(cutoff, F_1) %>% 
  ggplot(aes(cutoff, F_1)) + 
  geom_point() + 
  geom_line() + 
  labs(title = "F1-Score vs. Cutoff", x = "Height Cutoff", y = "F1-Score")

# Get the maximum F1-score and best cutoff
max_F1 <- max(F_1)
best_cutoff_2 <- cutoff[which.max(F_1)]

# Print results
print(paste("Best cutoff: ", best_cutoff_2))
print(paste("Max F1-score: ", max_F1))

# Evaluate model performance on test set
y_hat <- ifelse(test_set$height > best_cutoff_2, "Male", "Female") %>% 
  factor(levels = levels(test_set$sex))

# Compute sensitivity and specificity
sensitivity_value <- sensitivity(data = y_hat, reference = test_set$sex)
specificity_value <- specificity(data = y_hat, reference = test_set$sex)

# Print evaluation metrics
print(paste("Sensitivity: ", sensitivity_value))
print(paste("Specificity: ", specificity_value))
```

---

## Explanation

1. **Generating F1-Scores**
   - Tests different height thresholds (61 to 70 inches).
   - Uses `ifelse()` to classify based on height.
   - Computes F1-score for each threshold using `F_meas()`.

2. **Plotting F1-Scores**
   - A scatter plot and line graph visualize how F1-score changes with cutoff values.

3. **Finding the Best Cutoff**
   - Identifies the cutoff yielding the highest F1-score.

4. **Evaluating Model on Test Data**
   - Applies the best cutoff to classify test data.
   - Computes **sensitivity** and **specificity** for a complete evaluation.

---

## Summary
✅ **F1-score** provides a balanced measure of classification performance.  
✅ **Maximizing F1-score** helps optimize the trade-off between **precision** and **recall**.  
✅ **This approach selects the best height threshold** for classifying Male vs. Female effectively.  

This method ensures **optimal classification** while addressing the limitations of accuracy alone.
