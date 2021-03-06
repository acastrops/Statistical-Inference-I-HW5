##Stats question 1  
##Michael McCormack

library(ggplot2)

##Simulating polynomial data
set.seed(16)
x<- seq(0,50,1)
y <- 20.3 - 15.1*x + 1.2*x^2 + rnorm(50)
plot(x, y, main = "Polynomial data simulation")


##Simulating exponential data:
x<- seq(0,50,1)
b0 <- 5
b1 <- .5
y <- b0 + b1*x^20 + rnorm(50)
plot(x,y, main = "Exponential data simulation")


##Simulating sinusoidal data:
x<-seq(0,50,.1 )
b0 <- 5.3
b1 <- 1.2
y <-b0 + b1*sin(x) + rnorm(50)  
plot(x,y,type ="l", main = "Sinusoidal data simulation")


##B.
#Simulating data of different sizes
## Polynomial data of different sample sizes:
n<-20
small_poly <- seq(1,100,length.out = n)
y <- 20.3 - 15.1*small_poly + 1.2*small_poly^2 + rnorm(n)
df<- data.frame(small_poly,y)
ggplot(df, aes(x = small_poly, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "loess", colour = "blue") + 
  ggtitle("Polynomial data simulation small")

n<-100
medium_poly <- seq(1,100,length.out = n)
y <- 20.3 - 15.1*medium_poly + 1.2*medium_poly^2 + rnorm(n)
df<- data.frame(medium_poly,y)
ggplot(df, aes(x = medium_poly, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "loess", colour = "blue") + 
  ggtitle("Polynomial data simulation medium")

n<-5000
sd <- 50
large_poly <- seq(1,100,length.out = n)
y <- 20.3 - 15.1*large_poly + 1.2*large_poly^2 + rnorm(n, sd = 500)
df<- data.frame(large_poly,y)
ggplot(df, aes(x = large_poly, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "loess", colour = "blue") + 
  ggtitle("Polynomial data simulation large")



## Exponential data of different sample sizes:
n<-20
small_exp <- seq(1,100, length.out = n)
b0 <- 5
b1 <- .5
y <- b0 + b1*small_exp^20 + rnorm(n)
df<-data.frame(small_exp,y)
ggplot(df, aes(x = small_exp, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "auto", colour = "blue") + 
  ggtitle("Exponential data simulation small compared to linear model")


n <- 100
medium_exp <- seq(1,100, length.out = n)
b0 <- 5
b1 <- .5
y <- b0 + b1*medium_exp^20 + rnorm(n)
df <- data.frame(medium_exp,y)
ggplot(df, aes(x = medium_exp, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "auto", colour = "blue") + 
  ggtitle("Exponential data simulation medium compared to linear model")


n<-5000
large_exp <- seq(1,5000, length.out = n)
b0 <- 5
b1 <- .5
y <- b0 + b1*large_exp^20 + rnorm(n, sd = 50)
df <- data.frame(large_exp,y)
ggplot(df, aes(x = large_exp, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "auto", colour = "blue") + 
  ggtitle("Exponential data simulation large compared to linear model")


## Sinusoidal data of different sample sizes:
##Small Sinusoidal example
n<-20
small_sin<-seq(1,50,length.out = n)
b1 <- 5.3
y <-b1 * sin(small_sin) + rnorm(n)
df <- data.frame(small_sin,y)
ggplot(df, aes(x = small_sin, y = y)) +
  geom_point() + 
  geom_line(colour= "blue") +
  geom_smooth(method = "lm",  colour = "red") +
  ggtitle("Sinusoidal data simulation small compared to linear model")

ggplot(df, aes(x = small_sin, y = y)) + geom_point() +
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "auto", colour = "blue") + 
  ggtitle("Sinusoidal data simulation small compared to linear model")

plot(small_sin,y, type="l", main = "Sinusoidal data simulation small")


##Medium Sinusoidal example
n<-100
medium_sin <- seq(1,50,length.out = n)
b1 <- 5.3
y <- b1* sin(medium_sin) + rnorm(n)
df<- data.frame(medium_sin,y)
ggplot(df, aes(x = medium_sin, y = y)) + geom_point() + 
  geom_line(colour= "blue") +
  geom_smooth(method = "lm",  colour = "red") +
  ggtitle("Sinusoidal data simulation medium compared to linear model")

  
  
  geom_smooth(method = "auto", colour = "blue")
  geom_smooth(method = "lm",  colour = "red") + geom_smooth(method = "auto", colour = "blue") + 
  ggtitle("Sinusoidal data simulation medium compared to linear model")

plot(medium_sin,y, type ="l",main = "Sinusoidal data simulation medium")


#Large Sinusoidal Example
n<-5000
large_sin <- seq(1,50,length.out = n)
b1 <- 5.3
y <- b1* sin(large_sin) + rnorm(n)
df<- data.frame(large_sin,y)
ggplot(df, aes(x = large_sin, y = y)) + geom_point() + 
  geom_line(colour= "blue") +
  geom_smooth(method = "lm",  colour = "red") + 
  ggtitle("Sinusoidal data simulation large compared to linear model")


plot(large_sin,y, type = "l", main = "Sinusoidal data simulation large")


##C.
## Regression for small polynomial:
n <- 20
small_poly <- seq(1,50, length.out = n)
y <- 20.3 - 15.1*small_poly + 1.2*small_poly^2 + rnorm(n, sd = 5)
#plot(small_poly,y)
small_poly_regression <- lm( y ~ poly(small_poly,2)) 
summary(small_poly_regression)
#Fitted model
# Y_hat = 682.803 + 3066.432x + 1061.829(x)^2
y_hat <- predict(small_poly_regression, interval = "confidence")

confint(small_poly_regression, level=0.95)
predict(small_poly_regression, level = 0.95)
plot(small_poly_regression, which =2)


y.fit <- small_poly_regression$fitted.values

y_hat <- predict(small_poly_regression, interval = "confidence")

b0 <- small_poly_regression$coefficients

##Regression for medium polynomial
n<-100
medium_poly <- seq(1,50,length.out = n)
y <- 20.3 - 15.1*medium_poly + 1.2*medium_poly^2 + rnorm(n, sd = 5)
medium_poly_regression <- lm(y ~ poly(medium_poly,2))
#plot(medium_poly,y)
summary(medium_poly_regression)

##Predicting y_hat values for all simulated points
y_hat <- predict(medium_poly_regression, interval = "confidence")

##Predicting y_hat valeus to 95% confidence interval 
new.data1 <- data.frame(medium_poly = 5)
new.data2 <- data.frame(medium_poly = 10)
new.data3 <- data.frame(medium_poly = 25)
new.data4 <- data.frame(medium_poly = 40)
new.data5 <- data.frame(medium_poly = 75)
a <- predict(medium_poly_regression, newdata = new.data1, interval = "confidence" )
b <- predict(medium_poly_regression, newdata = new.data2, interval = "confidence" )
c <- predict(medium_poly_regression, newdata = new.data3, interval = "confidence" )
d <- predict(medium_poly_regression, newdata = new.data4, interval = "confidence" )
e <- predict(medium_poly_regression, newdata = new.data5, interval = "confidence" )

##Checking confidence intervals of beta coefficients
confint(medium_poly_regression, level = 0.95)

##Finding MSE
y.fit <- medium_poly_regression$fitted.values
sse <- sum((y - y.fit)^2)
mse <- sse / (n-2)

anova(medium_poly_regression)




##Regression for large polynomial
n<-5000
sd <- 50
large_poly <- seq(1,100,length.out = n)
y <- 20.3 - 15.1*large_poly + 1.2*large_poly^2 + rnorm(n, sd = 500)
large_poly_regression <- lm(y ~ poly(large_poly,2))
summary(large_poly_regression)

confint(large_poly_regression, level = 0.95)
y_hat <- predict(large_poly_regression, interval = "confidence")


###Test signficance of beta with t - test





# D - Tasks that were affecte by the nonlinear relationship




# E - 

#i 
n <- 20
b0 <- 10
b1 <- 2
x <-runif(n, 0, 10)
eps <- 3 *rnorm(n)
y <- b0 - b1 * (x - 5)^2 + eps


plot(x,y,col='deepskyblue4', vlab='x',main ='Polynomial simulated data')

q <- seq(from=0, to=20, by=0.1)
y <- 500 + 0.4 * (q-10)^3

noise <- rnorm(length(q), mean=10, sd=80)
noisy.y <- y + noise

plot(q,noisy.y,col='deepskyblue4',xlab='q',main='Observed data')
lines(q,y,col='firebrick1',lwd=3)
