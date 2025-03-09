# Decision Trees Notes

## What is a Decision Tree?
- A decision tree is a model that splits data into smaller groups based on conditions at each step.
- It is used for **classification** and **regression**.

## How Do Decision Trees Work?
1. The algorithm selects the **best feature** to split the data.
2. It creates **branches** based on different values of the feature.
3. The process repeats **until a stopping condition is met** (e.g., minimum node size).
4. The result is a tree structure that makes predictions.

## Key Parameters

### 1. Complexity Parameter (cp)
- Controls how much the tree grows.
- **Smaller `cp`** → Larger tree (risk of overfitting).
- **Larger `cp`** → Smaller tree (risk of underfitting).

### 2. Minimum Split (minsplit)
- The minimum number of observations needed in a node to allow a split.
- **Higher `minsplit`** → Fewer splits (simpler tree).
- **Lower `minsplit`** → More splits (complex tree).

## Decision Trees in R and Python

### R Example
```r
library(rpart)
model <- rpart(Species ~ ., data = iris, control = rpart.control(cp = 0.01, minsplit = 20))
print(model)
```

### Python Example
```python
from sklearn.tree import DecisionTreeClassifier
model = DecisionTreeClassifier(ccp_alpha=0.01, min_samples_split=20)
model.fit(X, y)
```

## Advantages of Decision Trees
- **Easy to interpret**.
- **Works with both numerical and categorical data**.
- **No need for feature scaling**.

## Disadvantages
- Can **overfit** if not pruned properly.
- **Sensitive to small changes** in data.

## When to Use Decision Trees?
- When interpretability is important.
- When relationships between features are **non-linear**.
- When feature selection is needed (trees automatically pick important features).

---
