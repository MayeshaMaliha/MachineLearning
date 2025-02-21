# Understanding Loss Functions in Machine Learning

In machine learning, we need a way to measure how well a model performs. For **categorical** outcomes, we use metrics like accuracy, sensitivity, and F1-score. However, these do not work for **continuous** outcomes, such as predicting a person's height or house prices.

Instead, we use **loss functions** to measure prediction errors. The goal is to minimize this loss.

---

## 1. Squared Loss Function
- If **ŷ** is the predicted value and **y** is the actual value, the squared loss is:

  \[
  (\hat{y} - y)^2
  \]

- This penalizes larger errors more than smaller ones.

---

## 2. Mean Squared Error (MSE)
- Since we usually have many predictions, we take the average squared loss:

  \[
  MSE = \frac{1}{N} \sum_{i=1}^{N} (\hat{y}_i - y_i)^2
  \]

- **N** is the total number of observations.
- **Lower MSE means better predictions**.

---

## 3. Root Mean Squared Error (RMSE)
- To bring MSE back to the original unit of measurement, we take the square root:

  \[
  RMSE = \sqrt{MSE}
  \]

- RMSE is easier to interpret than MSE.

---

## 4. MSE for Binary Outcomes
- If the data is **binary (0 or 1)**, MSE behaves like **1 - accuracy**.
- Since \( (\hat{y} - y)^2 \) is either 0 (correct prediction) or 1 (wrong prediction), minimizing MSE means maximizing accuracy.

---

## 5. Expected MSE
- In theory, we consider multiple random datasets and compute the expected MSE:

  \[
  E\left\{\frac{1}{N} \sum_{i=1}^{N} (\hat{Y}_i - Y_i)^2 \right\}
  \]

- Since we only have one dataset in practice, this remains a **theoretical concept**.

---

## 6. Alternative Loss Functions
- **Mean Absolute Error (MAE)**: Uses absolute differences instead of squares.

  \[
  MAE = \frac{1}{N} \sum_{i=1}^{N} |\hat{y}_i - y_i|
  \]

- **Squared loss (MSE)** is preferred because it is easier to work with in calculus and optimizations.

---

## Key Takeaway
- Loss functions measure model performance.
- **MSE and RMSE** are standard for continuous data.
- **Minimizing loss** means improving the model’s accuracy.
- Different loss functions exist, but squared loss is the most commonly used.
