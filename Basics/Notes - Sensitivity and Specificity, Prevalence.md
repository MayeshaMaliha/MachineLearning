# Sensitivity and Specificity

## Key Points

### Sensitivity (True Positive Rate / Recall)
- Proportion of actual positive cases correctly identified.
- High sensitivity means fewer false negatives.
- Formula: 
  
  \[ \text{Sensitivity} = \frac{TP}{TP + FN} \]

### Specificity (True Negative Rate)
- Proportion of actual negative cases correctly identified.
- High specificity means fewer false positives.
- Formula: 
  
  \[ \text{Specificity} = \frac{TN}{TN + FP} \]

### Precision (Positive Predictive Value - PPV)
- Proportion of predicted positives that are actually correct.
- Formula: 
  
  \[ \text{Precision} = \frac{TP}{TP + FP} \]

### Prevalence
- The proportion of positives in the dataset.

---

## Confusion Matrix Entries

|                | Actually Positive | Actually Negative |
|--------------|----------------|----------------|
| **Predicted Positive** | True Positives (TP) | False Positives (FP) |
| **Predicted Negative** | False Negatives (FN) | True Negatives (TN) |

---

## Sensitivity and Specificity Measures

| Measure      | Name 1 | Name 2  | Definition                  |
|-------------|--------|---------|-----------------------------|
| Sensitivity | TPR    | Recall  | \( TP / (TP + FN) \)       |
| Specificity | TNR    | 1 - FPR | \( TN / (TN + FP) \)       |
| Precision   | PPV    |         | \( TP / (TP + FP) \)       |

---

## Code to Compute Metrics in R

```r
# Get the confusion matrix
cm <- confusionMatrix(data = y_hat, reference = test_set$sex)

# Access specific metrics
cm$overall["Accuracy"]
cm$byClass[c("Sensitivity", "Specificity", "Prevalence")]
