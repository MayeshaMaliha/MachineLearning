# Understanding ROC and Precision-Recall Curves

When evaluating a classification model, you need to compare different thresholds to measure how well the model performs. Two common ways to visualize this are:

1. **ROC Curve (Receiver Operating Characteristic)**
2. **Precision-Recall Curve**

---

## 1. ROC Curve
- It plots **sensitivity (True Positive Rate, TPR)** against **1 - specificity (False Positive Rate, FPR)**.
- **Sensitivity (TPR):**
  \[ \frac{\text{True Positives}}{\text{True Positives} + \text{False Negatives}} \]
- **Specificity:**
  \[ \frac{\text{True Negatives}}{\text{True Negatives} + \text{False Positives}} \]
- If the model is random (guessing), the curve follows the diagonal (identity line).
- A good model has a curve that rises quickly toward the top-left corner.

### Example:
- You are predicting whether a person is **Male** or **Female** based on height.
- If you randomly guess "Male" with a probability of **0.9**, you get 73.9% accuracy, but this lowers sensitivity.
- Plotting an ROC curve lets you compare different models at different cutoffs.

---

## 2. Precision-Recall Curve
- It plots **Precision** vs **Recall (Sensitivity)**.
- **Precision:**
  \[ \frac{\text{True Positives}}{\text{True Positives} + \text{False Positives}} \]
- **Recall (TPR):**
  \[ \frac{\text{True Positives}}{\text{True Positives} + \text{False Negatives}} \]
- Unlike ROC curves, this is useful when **the classes are imbalanced** (e.g., more Males than Females).
- Precision drops when there are many **False Positives**.

### Key Takeaway:
- **ROC curves** are useful when the positive and negative classes are balanced.
- **Precision-Recall curves** are better when one class is much rarer than the other.
