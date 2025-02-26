# Local Weighted Regression (LOESS)

## **What is LOESS?**
- LOESS (Locally Estimated Scatterplot Smoothing) is a **non-parametric regression method**.
- It fits **local** models instead of a single global equation.
- Provides **flexible** and **smooth** trend estimates for noisy data.

## **How LOESS Works**
1. **Select a neighborhood** around each data point.
2. **Fit a weighted regression** to the selected points.
3. **Assign higher weights to closer points** and lower weights to farther ones.
4. **Move to the next point** and repeat, creating a smooth curve.

## **Why Use LOESS?**
- Captures **non-linear relationships** effectively.
- No assumption of a global equation like in linear regression.
- Useful for **small to medium-sized datasets** where flexibility is needed.

## **Limitations of LOESS**
- Computationally expensive for large datasets.
- Requires choosing an appropriate **bandwidth** (window size).
- Can overfit if the bandwidth is too small.

## **Comparison with Other Smoothing Methods**
| Method | Flexibility | Computational Cost | Best For |
|--------|------------|-------------------|-----------|
| **LOESS** | High | Expensive | Small datasets, non-linear trends |
| **Bin Smoothing** | Medium | Low | Rough trends, piecewise constant estimates |
| **Kernel Smoothing** | High | Moderate | Smooth, gradual trend detection |

## **Key Takeaways**
- LOESS is **powerful for capturing smooth trends** in noisy data.
- It uses **local weighted regression** instead of a single global model.
- Best suited for **small datasets with complex patterns**.
- Choosing the right **bandwidth** is crucial for balance between flexibility and overfitting.

