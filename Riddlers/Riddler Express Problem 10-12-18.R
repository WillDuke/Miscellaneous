# My daughter really likes to hear me sing “The Unbirthday Song” from “Alice in Wonderland” to her.
# She also likes to sing it to other people. Obviously, the odds of my being able to sing it to her
# on any random day are 364 in 365, because I cannot sing it on her birthday. The question is,
# though, how many random people would she expect to be able to sing it to
# on any given day before it became more likely than not that she would encounter
# someone whose birthday it is?
# In other words, what is the expected length of her singing streak?

p <- 364/365
z <- vector()
Nonbdays <- replicate(100, {
  hits <- replicate(100, {
    while (x == 1){
      x <- sample(2, size = 1, prob = c(p, 1-p))
      z <- append(z,x)
    }
    length(z)
  })
  mean(hits)
})

v <- c(1,3)
??multiply


hist(Nonbdays)

mean(Nonbdays)

?sample
z <- append(z,x)

q <- c(1:365)

s <- (364-n)/365

#for i in q, create a row with i elements (364-q[i]/365)
s <- matrix()
for (i in q){
  n <- 1:q
  v <- (364-n)/365
}


#the odds that person 1 has a different birthday is 364/465
#the odds that the person 2 has a


