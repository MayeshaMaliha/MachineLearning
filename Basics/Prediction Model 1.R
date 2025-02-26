library(caret)
data(iris)
iris <- iris[-which(iris$Species=='setosa'),]
y <- iris$Species


set.seed(76)
test_index <- createDataPartition(y, p = 0.5, list = FALSE)
train <- iris[-test_index,]
test <- iris[test_index,]

foo <- function(x){
  rangedValues <- seq(range(x)[1], range(x)[2], by=0.1)
  sapply(rangedValues, function(i){
    y_hat <- ifelse(x>i, 'virginica', 'versicolor')
    mean(y_hat==train$Species)
  })
}
predictions <- apply(train[,-5], 2, foo)
sapply(predictions, max)	

predictions <- foo(train[,4])
rangedValues <- seq(range(train[,4])[1], range(train[,4])[2], by=0.1)
cutoffs <-rangedValues[which(predictions==max(predictions))]

y_hat <- ifelse(test[,4]>cutoffs[1], 'virginica', 'versicolor')
mean(y_hat==test$Species)

# plot(iris, pch=21, bg=iris$Species)
predictions <- apply(train[,-5], 2, foo)
sapply(predictions, max)	

predictions <- foo(train[,3,4])
rangedValues <- seq(range(train[,3,4])[1], range(train[,3,4])[2], by=0.1)
cutoffs <-rangedValues[which(predictions==max(predictions))]

y_hat <- ifelse(test[,3,4]>cutoffs[1], 'virginica', 'versicolor')
mean(y_hat==test$Species)
