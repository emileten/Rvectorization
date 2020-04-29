#testing purrr functionals 
library(purrr)

x <- list(1, 10, 100)
y <- list(1, 2, 3)
z <- list(5, 50, 500)
d <- as.list(rep(1, 3))
f <- as.list(rep(2, 3))
l <- list(a = x, b = y, c = z, d=d, f=f)

x <- c(1, 10, 100)
y <- c(1, 2, 3)
z <- c(5, 50, 500)
d <- rep(1, 3)
f <- rep(2, 3)
strings <- c("jean", "jeanne", "francois")

x <- sample(x=seq(1,100),size=1000, replace=TRUE)
y <- sample(x=seq(1,100),size=1000, replace=TRUE)
c <- sample(x=c(1,2,3,4,5),size=1000, replace=TRUE)
d <- sample(x=c(6,7,8,9,10),size=1000, replace=TRUE)

dt <- data.table(x,y,c,d)

means <- dt[, .(mean_x=mean(x), mean_y=mean(y)), by = .(c,d)]
means <- dt[, .(mean_x=mean(x), mean_y=mean(y)), by = c(names(dt)[3:4])]
means <- dt[, .(mean_x=mean(x), mean_y=mean(y)), by = c(names(dt)[3:4])]

ans <- flights[carrier == "AA",
               .(mean(arr_delay), mean(dep_delay)),
               by = .(origin, dest, month)]

x <- c(1,2,3)
y <- c("a","b","c")
dt <- data.table(x,y)
dt_rep <- expand.grid.DT(dt, 10)

ldf <- data.frame(a = x, b = y, c = z, d=d, string=strings, stringsAsFactors = FALSE)

test <- cbind(test[,1:2], test[,!1:2])
names(test)[names(test)!="continent"]

myfunction <- function(c, b, a, d, f, string){ 
  print(a / (b + c + d + f))
  print(string)
}

pmap(ldf, myfunction, f=2)

pmap(data.frame(x=x, y=y, z=z, string=strings), myfct, w=w, v=v)

?system
