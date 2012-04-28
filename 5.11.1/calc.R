data <- read.table("data.txt", header=TRUE)
l <- 23.4 # m
d <- 0.07 * 10 ** -3 # mm
a <- 4.1 * 10 ** -3 # mm
b <- 4.1 * 10 ** -3 # mm
c <- 29.2 * 10 ** -3 # mm
sens <- 41 * 10 ** -3 # mv / deg
T0 <- 273 + 27 # deg C
T <- T0 + data$U / sens # deg C
sigma.copper <- l / (data$R.copper * pi * (d / 2) ** 2)
sigma.semi <- c / (data$R.semi * a * b)
# print(data)
# print(T)
# print(sigma.copper)
# print(sigma.semi)

plot.errors <- function(x, y, eps.x, eps.y) {
    dx = max(x) * eps.x / 2
    dy = max(y) * eps.y / 2
    arrows(x, y - dy, x, y + dy, angle=90, code=3, length=0.05)
    arrows(x - dx, y, x + dx, y, angle=90, code=3, length=0.05)
}

plot(T, sigma.copper, "p")
linear <- lsfit(T, sigma.copper)
angle <- linear$coefficients[2]
abline(linear)
print(1.0 / sigma.copper[1] * angle)

plot(T, sigma.semi, "p")
linear <- lsfit(T, sigma.semi)
angle <- linear$coefficients[2]

x <- 1/T
y <- log(sigma.semi)
plot(1/T, log(sigma.semi), "p")
linear <- lsfit(1/T, log(sigma.semi))
abline(linear)
linear <- lsfit(1/T, log(sigma.semi))
angle <- linear$coefficients[[2]]
k <- 8.16 * 10 ** -5
print(angle)
delta <- 2 * k * angle
print(delta)

write.csv2(data.frame(T, 1/T, sigma.copper, sigma.semi, log(sigma.copper), log(sigma.semi)), "data.csv")
sx2 <- (mean(x ** 2) - mean(x) ** 2) 
sy2 <- (mean(y ** 2) - mean(y) ** 2) 
a <- ( mean(x*y) - mean(x)*mean(y) ) / sx2
da <- 2 * sqrt(1.0 / (length(x) - 2) * (sy2 / sx2 - a ** 2))
eps.a = da / a / 100

print(c(a, da, eps.a, eps.a))
plot.errors(x, y, eps.a, eps.a)

