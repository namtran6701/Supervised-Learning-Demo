

# Linear Regression

x = round(rnorm(50, 20, 3))

y = runif(50, 4.5, 7)

test = round(rnorm(50, 19, 4))

df <- data.frame(Age = x,
                 Height = y)

plot(x, y)

## Run a linear regression model 

model <- lm(data = df, 
            Height ~ Age)

summary(model)


## Compute Model's metrics 

library(performance)

cat("RMSE of the model", performance_rmse(model))

cat("MAE of the model", performance_mae(model))

## Predict 

top_prediction <- head(predict(model, 
             newdata = data.frame(Age = test)), 10)

(predict_table <- data.frame(Age = head(test, 10),
                             Height_predicted = top_prediction))


plot(df$Age, df$Height, main="Scatter Plot with Fitted Line", xlab="Age", ylab="Height")
abline(model, col="red", lwd=2)
  