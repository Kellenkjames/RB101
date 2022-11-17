
require "pry"

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

def deck_modifier(cards)
  values = []
  cards.map do |card|
    case card
    when 'A'
      values << 'Ace'
    when 'Q'
      values << 'Queen'
    when 'K'
      values << 'King'
    when 'J'
      values << 'Jack'
    else
      values << card 
    end 
  end 
  values
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARDS.shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card }

  sum = 0
  values.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def handle_join(cards, delimeter=',', word="and")
  if cards.size == 2
    cards.insert(-2, word).join(' ')
  elsif cards.size > 2
    cards.insert(-2, word).map do |value|
      value << delimeter unless value == word || value == cards.last
    end
    cards.join(' ')
  end
end

p handle_join(['6', '2'])
p handle_join(['6', '2', '4'])
p handle_join(['6', '2', 'Ace', '3', '4'])

# def player_turn(cards)
#   player_cards = []
#   values = cards.map { |card| card[1] }
  
#   player_cards = values.sample(2)
#   prompt "You have: #{handle_join(deck_modifier(player_cards))}"
  
#   loop do
#     prompt "hit or stay? Enter h (hit) or s (stay)."
#     answer = gets.chomp.upcase
    
#     # If player "hits" -- draw another card from the deck and adds to player_cards array.
#     player_cards << values.sample(1).join(',')
#     prompt "You have: #{handle_join(deck_modifier(player_cards))}"

#     # Calculate Total
#     if total(player_cards) > 21
#       prompt "You busted!"
#       break
#     end
    
#     break if answer == 'S'
#   end
  
# end

# player_turn(initialize_deck)

=begin

How the total method works:

1. We are going to map over the values and return a new arr (values only), i.e., 'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K' .

2. Create a local sum variable and set equal to zero.

3. If value is an "Ace", add 11 to the sum.

4. Elsif value is the other letters, i.e., 'J', 'Q', or 'K', we add 10 to the sum.

5. Else, just convert the string values to integer and add the sum.

#* If the sum is > 21 while we have "aces" in our deck -- we want to subtract "10" for each ace (this will make the value of the ace "1" instead of "11")

#* If we don't have aces in our deck, then the player or dealer can bust if they exceed the value of 21. 

Example) [10, 8, A].sum 
(10 + 8 + 11) - 10 = 19

=end

