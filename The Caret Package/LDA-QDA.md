# LDA and QDA Notes

## 1. Linear Discriminant Analysis (LDA)

### What is LDA?
- LDA is a classification technique used to separate different classes by finding a linear combination of features.
- It assumes that different classes have the **same covariance matrix** but different means.

### Key Assumptions
- The data follows a **Gaussian (normal) distribution**.
- The **covariance matrices of all classes are identical**.
- The observations are **independent** given the class labels.

### LDA Formula
LDA estimates the probability of a class using:
\[
P(Y=k | X=x) \propto P(X=x | Y=k) P(Y=k)
\]
where:
- \( P(Y=k) \) is the prior probability of class \( k \).
- \( P(X=x | Y=k) \) is the likelihood, assumed to follow a normal distribution.

The decision boundary is determined by the discriminant function:
\[
\delta_k(X) = X^T \Sigma^{-1} \mu_k - \frac{1}{2} \mu_k^T \Sigma^{-1} \mu_k + \log P(Y=k)
\]
where:
- \( \mu_k \) is the mean vector for class \( k \).
- \( \Sigma \) is the common covariance matrix.

### When to Use LDA?
- When you have **normally distributed data**.
- When the **covariance matrices are similar across classes**.
- When you need a **simple linear classifier**.

### LDA in R and Python
```r
# R Example
library(MASS)
model <- lda(Species ~ ., data = iris)
print(model)
```
```python
# Python Example
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
model = LinearDiscriminantAnalysis()
model.fit(X, y)
```

---

## 2. Quadratic Discriminant Analysis (QDA)

### What is QDA?
- QDA is similar to LDA but **does not assume equal covariance matrices** for all classes.
- It allows for **quadratic decision boundaries**, making it more flexible.

### Key Assumptions
- The data follows a **Gaussian (normal) distribution**.
- **Each class has its own covariance matrix** (unlike LDA).
- Observations are **independent given the class labels**.

### QDA Formula
\[
\delta_k(X) = -\frac{1}{2} \log |\Sigma_k| - \frac{1}{2} (X - \mu_k)^T \Sigma_k^{-1} (X - \mu_k) + \log P(Y=k)
\]
where:
- \( \Sigma_k \) is the covariance matrix for class \( k \).

### When to Use QDA?
- When **covariance matrices are different across classes**.
- When a **quadratic decision boundary** is needed.
- When the data is **not well-separated by a linear decision boundary**.

### QDA in R and Python
```r
# R Example
library(MASS)
model <- qda(Species ~ ., data = iris)
print(model)
```
```python
# Python Example
from sklearn.discriminant_analysis import QuadraticDiscriminantAnalysis
model = QuadraticDiscriminantAnalysis()
model.fit(X, y)
```

---

## 3. LDA vs. QDA
| Feature          | LDA | QDA |
|-----------------|-----|-----|
| Decision Boundary | Linear | Quadratic |
| Covariance Matrix | Same for all classes | Different for each class |
| Flexibility | Less flexible | More flexible |
| Risk of Overfitting | Lower | Higher (if few data points) |

### Choosing Between LDA and QDA
- **Use LDA** if classes have **similar covariances** and data is **linearly separable**.
- **Use QDA** if classes have **different covariances** and require a **non-linear boundary**.

---
