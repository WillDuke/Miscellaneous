hits100 <- replicate(500, {
  success <- replicate(1000, {
    x <- c(2:100)
    y <- sample(x,1)
    x <- x[-which(x %in% y)]
    while (length(x) > 1){
     z <- sample(x,1)
     if ((length(x[x < y]) > length(x[x > y]) & z < y) || 
        (length(x[x < y]) < length(x[x > y]) & z > y) ||
        (length(x[x < y]) == length(x[x > y]) & z > y)) {
       x <- x[-which(x %in% z)]
       y = z  
     } else {
        break
     }
    }
    length(x) == 1
  })
  mean(success)
})
hist(hits20)
mean(hits20)
mean(hits)
hist(hits100)
sum(hits100)
