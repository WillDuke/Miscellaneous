# From the August, 17th edition of the Riddler: Step 1: Game Theory. Step 2: ???? Step 3: Profit!
# Take a standard deck of cards,
# and pull out the numbered cards from one suit (the cards 2 through 10).
# Shuffle them, and then lay them face down in a row.
# Flip over the first card. Now guess whether the next card in the row is bigger or smaller.
# If you’re right, keep going.
#
# If you play this game optimally,
# what’s the probability that you can get to the end without making any mistakes?
#
# Extra credit: What if there were more cards — 2 through 20, or 2 through 100?
# How do your chances of getting to the end change?

hits <- replicate(100, {
    success <- replicate(1000, {
        deck <- sample(2:100) #our random set of 9 cards
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
# it's ~ 17%
#change to 2:20 and the probability drops to ~0.9%
#change to 2:100 the probability drops to (near) zero -- no hits from 1000000 tries!
hist(hits)
