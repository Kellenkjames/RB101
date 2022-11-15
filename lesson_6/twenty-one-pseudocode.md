
Assignment: **Twenty-One**

In this assignment, we'll build a made up game called Twenty-One. It's very similar to blackjack, but stripped down quite a bit. We won't be doing splits, double down, etc. Those features are beyond the scope of what we want to cover. 

If you've never played blackjack before, don't worry, our Twenty-One game is very easy to understand.

#-----------------------------------------------------------------------------------------------

**Rules of Twenty-One**

* You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

* The `goal` of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.

* `Setup`: the game consists of a "dealer" and a "player". `Both participants are initially dealt 2 cards.` The player can see their 2 cards, but can only see one of the dealer's cards.

* `Card Values`: all of the card values are pretty straightforward, except for the ace. The numbers 2 through 10 are worth their face value. The jack, queen, and king are each worth 10, and `the ace can be worth 1 or 11`. 

* An Ace will have a value of `11` **unless** that would give a player or the dealer a score in excess of `21`; in which case, it has a value of `1`.

* The ace's value is determined *each time* a new card is drawn from the deck. For example, if the hand contains a 2, an ace, and a 5, then the total value of the hand is 18. In this case, the ace is worth 11 because the sum of the hand (2 + 11 + 5) doesn't exceed 21.

* Now, say another card is drawn and it happens to be an ace. Your program will have to determine the value of both aces. `If the sum of the hand (2 + 11 + 5 + 11) exceeds 21 then one of the aces must be worth 1, resulting in the hand's total value being 19`. What happens if another card is drawn and it also happens to be an ace? It can get tricky if there are multiple aces in a hand, so your program must account for that.

#-----------------------------------------------------------------------------------------------

**Methods**

* `Player Turn:` 
  * The player goes first, and can decide to either "hit" or "stay". 
  * A hit means the player will ask for another card--remember that if the total exceeds `21`, then the player "busts" and loses.
  * The decision to hit or stay will depend on what the player's cards are and what the player `thinks` the dealer has.
  * For example, if the dealer is showing a "10" (the other card is hidden), and the player has a "2" and a "4", then the obvious choice is for the player to "hit".
  * The player can continue to hit as many times as they want. The turn is over when the player either busts or stays. If the player busts, the game is over and the dealer won.

* `Dealer turn:`
  * when the player stays, it's the dealer's turn.
  * The dealer must follow a strict rule for determining whether to hit or stay: `hit until the total is at least 17.`
  * If the dealer busts, then the player wins.

* `Comparing cards`: when both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.

#-----------------------------------------------------------------------------------------------

Examples of Game play: To give you an idea of how to play, try to decide what to do in each scenario:

Example 1):

Dealer has: Ace and unknown card
You have: 2 and 8

`You should "hit" in this scenario. You see the dealer has an "Ace", which means the dealer has a high probability of having a 21, the optimal number. On top of that, your total of 10 can only benefit from an extra card, as there's no way you can bust.`

On the first hand, we can assume the Ace is worth `11` and the unknown card could be anything from 2-10. 

You have: 2 and 8 (therefore, it would be wise to "hit").

#-----------------------------------------------------------------------------------------------

Example 2):

Dealer has: 7 and unknown card
You have: 10 and 7

`You should "stay" here, because chances are good that the unknown card is not an Ace, which is the only situation where you can lose. Most likely, you're going to win with 17, or tie. There's a very small chance you will lose.`

You typically want to stop hitting around `16` or `17`

#-----------------------------------------------------------------------------------------------

Example 3)

Dealer has: 5 and unknown card
You have: Jack and 6

`This one is a little tricky, and at first glance, you may think that either a "hit" or "stay" would be appropriate. You have 16 and you could maybe try to get lucky and land a card less than 6. That would be ok reasoning, except for the fact that the dealer has a 5. `

`You're anticipating that the unknown card is worth 10, thereby making the dealer's cards worth 15. This means the dealer must hit, and there's a good chance the dealer will bust. The best move here is to "stay", and hope the dealer busts.`

Hopefully that gives you an idea of how fun and tricky this game can be, despite the simple rules!

#-----------------------------------------------------------------------------------------------

**Implementation Steps:**

**The very high level steps of implementing Twenty-One appear to be pretty straightforward. Here's a stab at some high level pseudo code:

1. Initialize Deck
2. Deal cards to `player` and `dealer`
3. Player turn: hit or stay
   1. repeat until bust or "stay"
4. If player bust, dealer wins. 
5. Dealer turn: hit or stay
   1. repeat until total >= 17
6. If dealer bust, player wins. 
7. Compare cards and declare winner. **

There are some tricky parts in coming up with the looping constructs, but that seems to be a decent high level flow.

#-----------------------------------------------------------------------------------------------

**Tips on Getting Started**

Tip One:

Figure out a data structure to contain the `deck` and the `player's cards` and `dealer's cards`. Maybe a hash? An array? A nested array?

Your decision will have consequences throughout your code, but don't be afraid of choosing the wrong one. Play around with an idea, and see how far you can push it. If it doesn't work, back out of it. 
 
**Possible Data Structure**

We'll be using a nested array, where each array element is itself a 2-element array that represents the card's suit and the card's value, respectively. 

`For example, a hand that contains 2 of Hearts, Jack of Spades, and Ace of Diamonds could be represented as a nested array like this:`

`Each sub array is a separate hand`

[['H', '2'], ['S', 'J'], ['D', 'A']]

Suites: Clubs, Diamonds, Hearts, and Spades

```ruby

# Ace
[ ['C', 'A'], ['D', 'A'], ['H', 'A'], ['S', 'A'] ]

# 2
[ ['C', '2'], ['D', '2'], ['H', '2'], ['S', '2'] ]

# 3
[ ['C', '3'], ['D', '3'], ['H', '3'], ['S', '3'] ]

# 4
[ ['C', '4'], ['D', '4'], ['H', '4'], ['S', '4'] ]

# 5
[ ['C', '5'], ['D', '5'], ['H', '5'], ['S', '5'] ]

# 6
[ ['C', '6'], ['D', '6'], ['H', '6'], ['S', '6'] ]

# 7
[ ['C', '7'], ['D', '7'], ['H', '7'], ['S', '7'] ]

# 8
[ ['C', '8'], ['D', '8'], ['H', '8'], ['S', '8'] ]

# 9
[ ['C', '9'], ['D', '9'], ['H', '9'], ['S', '9'] ]

# 10
[ ['C', '10'], ['D', '10'], ['H', '10'], ['S', '10'] ]

# Jack 
[ ['C', 'J'], ['D', 'J'], ['H', 'J'], ['S', 'J'] ]

# Queen 
[ ['C', 'Q'], ['D', 'Q'], ['H', 'Q'], ['S', 'Q'] ]

# King 
[ ['C', 'K'], ['D', 'K'], ['H', 'K'], ['S', 'K'] ]

```

#-----------------------------------------------------------------------------------------------

Tip Two:

`Calculating Aces:` Remember that aces can be worth either 1 or 11, depending on the context. You should not ask the user what the value of the ace is; your program should be able to figure this out automatically.

```ruby: 
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end
```

#-----------------------------------------------------------------------------------------------

Tip Three:

`Player Turn`: When thinking about how to code up the player's turn, think about a loop that keeps asking the player to either "hit" or "stay". Now, think about the breaking condition for that loop. When do we stop asking that question to the user? Some pseudo-code may help.

1. ask "hit" or "stay"
2. if "stay", stop asking 
3. otherwise, go to #1

That seems pretty straight forward. Let's code it up:

```ruby: 

loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay'
end

```

Notice that because we want to ask the user the question at least once, the break happens at the bottom of the loop. If the user chose anything other than "stay", then the loop continues. Can you think of another condition that can cause the loop to break?

`What about if the user keeps hitting, and the player busts? We'd have to adjust our break condition:`

```ruby 

loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer = 'stay' || busted? # the busted? method is not shown
end

```

`This means that the user can only exit the loop if one of those two things happen: either the player stays or the player busts. This means that after the loop, we can then handle those two conditions:`

```ruby 

answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? # the busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!" # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn 

```

#-----------------------------------------------------------------------------------------------

Tip Four: 

`Dealer Turn`: The dealer turn will follow a very similar pattern as the player turn. Except: the dealer's break condition will occur at the top of the "hit or stay" loop. See if you can figure out why that is.

#-----------------------------------------------------------------------------------------------

Tip Five: 

When you display the results, you also need to perform the calculation of who won. Having one method that does both the calculation and the display to the output makes it hard to reason about. 

The trick is to create a method that only returns the result of the game, and another that only handles displaying the result. `You want to write methods that only do one thing.`





