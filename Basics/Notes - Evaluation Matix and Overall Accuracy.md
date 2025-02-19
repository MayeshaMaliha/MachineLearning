# Machine Learning: Training & Test Sets (Easy Explanation)

## 1. Why Do We Split Data?
- Machine learning models need to perform well on new data.
- We split data into two parts:
  - **Training set**: Used to develop the model.
  - **Test set**: Used to evaluate the model’s accuracy.

## 2. How Do We Split Data?
- We randomly divide data into training and test sets using `createDataPartition` in R.

```r
set.seed(2007)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
test_set <- heights[test_index, ]
train_set <- heights[-test_index, ]
```

## 3. Measuring Accuracy
- Accuracy = Proportion of correctly predicted cases.
- Example: If a model predicts gender randomly, accuracy is around **50%**.

```r
y_hat <- sample(c("Male", "Female"), length(test_index), replace = TRUE)
mean(y_hat == test_set$sex) # About 50%
```

## 4. Improving Accuracy
- We use insights from data: **Males are generally taller than females**.

```r
heights |> group_by(sex) |> summarize(mean(height), sd(height))
```
- Use a simple rule: Predict **Male** if height > 62 inches.

```r
y_hat <- ifelse(x > 62, "Male", "Female") |> 
  factor(levels = levels(test_set$sex))
mean(y_hat == test_set$sex) # Accuracy ~ 80%
```

## 5. Finding the Best Cutoff
- Test different height cutoffs to find the best one.

```r
cutoff <- seq(61, 70)
accuracy <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train_set$height > x, "Male", "Female") |> 
    factor(levels = levels(test_set$sex))
  mean(y_hat == train_set$sex)
})
max(accuracy) # Best accuracy ~ 85%
```

- The best height cutoff is **64 inches**.

```r
best_cutoff <- cutoff[which.max(accuracy)]
best_cutoff # 64 inches
```

## 6. Evaluating on the Test Set
- We now test this cutoff on new data.

```r
y_hat <- ifelse(test_set$height > best_cutoff, "Male", "Female") |> 
  factor(levels = levels(test_set$sex))
mean(y_hat == test_set$sex) # ~80.4%
```

- Accuracy drops slightly but is still **better than guessing**.
- **Why test on new data?** To avoid overfitting and ensure real-world performance.
