# Machine Learning: Training, Test Sets & Confusion Matrix

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

---

## 7. Understanding the Confusion Matrix

### **What is a Confusion Matrix?**
- A table that compares **predicted vs. actual** values.
- Helps analyze errors in classification.

```r
table(predicted = y_hat, actual = test_set$sex)
```

| Predicted  | Actual Female | Actual Male |
|------------|--------------|------------|
| **Female** | 48           | 32         |
| **Male**   | 71           | 374        |

### **How to Read the Table**
- **Rows (Predicted)** → What our model guessed.
- **Columns (Actual)** → The real gender.
- **Each number = How many people were classified that way**.

#### **Key Findings**
- **71 females were wrongly predicted as Male** → Big issue.
- **Model works well for males (374 correct), but poorly for females (48 correct).**
- **Overall accuracy is misleading** because the dataset has more males.

### **Accuracy Breakdown by Group**
```r
test_set |> 
  mutate(y_hat = y_hat) |>
  group_by(sex) |> 
  summarize(accuracy = mean(y_hat == sex))
```

| Sex   | Accuracy |
|--------|-----------|
| Female | **40.3%** (Bad) |
| Male   | **92.1%** (Good) |

- **For males** → 92.1% accuracy (Almost all males are correctly identified).
- **For females** → 40.3% accuracy (Many females are wrongly labeled as male).

### **Why Overall Accuracy is Misleading**
- Dataset has **more males (77.3%)**, so the model favors predicting Male.
- **Solution:** Use **Sensitivity & Specificity** to evaluate fairly.

### **Key Takeaways**
✅ Confusion matrices help **analyze classification errors**.  
✅ Overall accuracy can be **misleading** when classes are imbalanced.  
✅ Our model is **biased toward males** due to the dataset.  
✅ **Next step:** Use **Sensitivity & Specificity** for better evaluation.
