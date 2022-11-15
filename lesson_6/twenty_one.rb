
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
  ['C', 'Ace'], ['D', 'Ace'], ['H', 'Ace'], ['S', 'Ace'],
  ['C', '2'], ['D', '2'], ['H', '2'], ['S', '2'],
  ['C', '3'], ['D', '3'], ['H', '3'], ['S', '3'], 
  ['C', '4'], ['D', '4'], ['H', '4'], ['S', '4'],
  ['C', '5'], ['D', '5'], ['H', '5'], ['S', '5'],
  ['C', '6'], ['D', '6'], ['H', '6'], ['S', '6'],
  ['C', '7'], ['D', '7'], ['H', '7'], ['S', '7'],
  ['C', '8'], ['D', '8'], ['H', '8'], ['S', '8'],
  ['C', '9'], ['D', '9'], ['H', '9'], ['S', '9'],
  ['C', '10'], ['D', '10'], ['H', '10'], ['S', '10'],
  ['C', 'Jack'], ['D', 'Jack'], ['H', 'Jack'], ['S', 'Jack'],
  ['C', 'Queen'], ['D', 'Queen'], ['H', 'Queen'], ['S', 'Queen'],
  ['C', 'King'], ['D', 'King'], ['H', 'King'], ['S', 'King']
]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_arr.shuffle.map do |value|
    value[1]
  end
end

def player_turn
  player_cards = []
  2.times { |arr| player_cards << initialize_deck[1]}
  player_cards
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}"
end

player_turn