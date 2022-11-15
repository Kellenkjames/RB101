
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
  CARDS.shuffle
end

p initialize_deck

# def player_turn(cards)
#   player_cards = []
  
#   2.times { |arr| player_cards << initialize_deck[1]}
#   player_cards
#   prompt "You have: #{player_cards[0]} and #{player_cards[1]}"
  
#   loop do
#     prompt "hit or stay?"
#     answer = gets.chomp.upcase
#     # call hit method
    
#     break if answer == 'S'
#   end 
  
# end

# player_turn(CARDS)

# def total(cards)
#   # cards = [['H', '3'],  ['S', 'Q'], ... ]
#   values = cards.map { |card| card[1 ] }

#   sum = 0
#   values.each do |value|
#     if value == "A"
#       sum += 11
#     elsif value.to_i == 0 # J, Q, K
#       sum += 10
#     else
#       sum += value.to_i
#     end
#   end

# end

