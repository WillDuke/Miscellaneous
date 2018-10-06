hits <- replicate(100, {
  success <- replicate(1000, {
    w <- sample(2:10) #our random set of 9 cards
    k <- w[1] #the first card
    w <- w[-which(w %in% k)] #take the first card out of the deck
    while (length(w) > 0){ #repeat until 1 card remains
     p <- w[1] #make p the next card
     if ((length(w[w < k]) > length(w[w > k]) & p < k) ||
        (length(w[w < k]) < length(w[w > k]) & p > k) ||
        (length(w[w < k]) == length(w[w > k]) & p > k)){ #prediction logic
      w <- w[-which(w %in% p)] #if prediction is right, "turn over" second card
      k = p #treat second card as first, and repeat until no cards left
   }
   else {break} #leave loop if the prediction is wrong
   }
   length(w) == 0 #if we get through all of the cards, call it a win!
   })
  mean(success) #average the successes
})
mean(hits) #find the probability
hist(hits)
