hits <- replicate(100, {
    success <- replicate(1000, {
        deck <- sample(2:10) #our random set of 9 cards
        first <- deck[1] #the first card
        deck <- deck[-which(deck %in% first)] #take the first card out of the deck
      while (length(deck) > 0){ #repeat until no cards remain
        nxt <- deck[1] #make p the next card
      if ((length(deck[deck < first]) > length(deck[deck > first]) & nxt < first) ||
        (length(deck[deck < first]) < length(deck[deck > first]) & nxt > first) ||
        (length(deck[deck < first]) == length(deck[deck > first]) & nxt > first)){ #prediction logic
          deck <- deck[-which(deck %in% nxt)] #if prediction is right, "turn over" second card
          first = nxt #treat next card as first, and repeat until no cards left
        }
      else {break} #leave loop if the prediction is wrong
      }
   length(deck) == 0 #if we get through all of the cards, call it a win!
    })
  mean(success) #average the successes
})
mean(hits) #find the probability
hist(hits)
