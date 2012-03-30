data <- read.table("data.txt", header=TRUE)
l <- 23.4 # m
d <- 0.07 * 10 ** -3 # mm
a <- 4.1 * 10 ** -3 # mm
b <- 4.1 * 10 ** -3 # mm
c <- 29.2 * 10 ** -3 # mm
sens <- 41 * 10 ** -3 # mv / deg
T0 <- 27 # deg C
T <- T0 + data$U / sens # deg C
sigma.copper <- l / (data$R.copper * pi * (d / 2) ** 2)
sigma.semi <- c / (data$R.semi * a * b)
# print(data)             ,
print(T)
print(sigma.copper)
print(sigma.semi)

plot(T, sigma.copper, "b")
plot(T, sigma.semi, "b")
