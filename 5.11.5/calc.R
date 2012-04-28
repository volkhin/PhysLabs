data <- read.table("data.txt", header<-TRUE)
U <- data$U
I <- data$I * 10 ** -3

plot.errors <- function(x, y, eps.x, eps.y) {
    dx = max(x) * eps.x / 2
    dy = max(y) * eps.y / 2
    arrows(x, y - dy, x, y + dy, angle=90, code=3, length=0.05)
    arrows(x - dx, y, x + dx, y, angle=90, code=3, length=0.05)
}

plot(U, I, "p")
# linear <- lsfit(x, y)
# angle <- linear$coefficients[[2]]
# print(linear)
# k <- 1.38 * 10 ** -23
# e <- -1.602 * 10 ** -19

# dV <- k / e * angle

# sx2 <- (mean(x ** 2) - mean(x) ** 2) 
# sy2 <- (mean(y ** 2) - mean(y) ** 2) 
# a <- ( mean(x*y) - mean(x)*mean(y) ) / sx2
# da <- 2 * sqrt(1.0 / (length(x) - 2) * (sy2 / sx2 - a ** 2))
# eps.a = da / a / 100

# write.csv2(data.frame(R, U, T, Rg, 1/T), "data.csv")
# print(list(dV=dV, a=a, da=da, eps.a=eps.a, eps.a * dV))
# abline(linear)
# plot.errors(x, y, eps.a, eps.a)
