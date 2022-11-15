
#* Assignment: Twenty-One

=begin

High Level Pseudocode: 

1. Initialize Deck
2. Deal cards to `player` and `dealer`
3. Player turn: hit or stay
  1. repeat until bust or "stay"
4. If player bust, dealer wins. 
5. Dealer turn: hit or stay
  1. repeat until total >= 17
6. If dealer bust, player wins. 
7. Compare cards and declare winner. 

=end

TARGET = 21

CARDS = [
  ['C', 'A'], ['D', 'A'], ['H', 'A'], ['S', 'A'],
  ['C', '2'], ['D', '2'], ['H', '2'], ['S', '2'],
  ['C', '3'], ['D', '3'], ['H', '3'], ['S', '3'], 
  ['C', '4'], ['D', '4'], ['H', '4'], ['S', '4'],
  ['C', '5'], ['D', '5'], ['H', '5'], ['S', '5'],
  ['C', '6'], ['D', '6'], ['H', '6'], ['S', '6'],
  ['C', '7'], ['D', '7'], ['H', '7'], ['S', '7'],
  ['C', '8'], ['D', '8'], ['H', '8'], ['S', '8'],
  ['C', '9'], ['D', '9'], ['H', '9'], ['S', '9'],
  ['C', '10'], ['D', '10'], ['H', '10'], ['S', '10'],
  ['C', 'J'], ['D', 'J'], ['H', 'J'], ['S', 'J'],
  ['C', 'Q'], ['D', 'Q'], ['H', 'Q'], ['S', 'Q'],
  ['C', 'K'], ['D', 'K'], ['H', 'K'], ['S', 'K']
]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARDS.shuffle.map do |value|
    value[1]
  end
end

# Player turn: the player goes first, and can decide to either "hit" or "stay". A hit means the player will ask for another card. Remember that if the total exceeds 21, then the player "busts" and loses.
def player_turn
  arr = []
  counter = 0 
  loop do 
    arr << initialize_deck[1]
    counter += 1
    break if counter == 2
  end 
  arr
  prompt "You have: #{arr[0]} and #{arr[1]}"
end 

def hit_me
  
end 