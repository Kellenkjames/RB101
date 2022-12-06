require "pry"

#* Assignment: Twenty-One

BUST = 21
DEALER_MAX = 17

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

# Calculating Aces
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value == 'and'
      sum += 0
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def handle_join(cards, word='and')
  if cards.size == 2
    cards.insert(-2, word).join(' ')
  elsif cards.size > 2
    values = cards.insert(-2, word).join(', ')
    values.slice!((values.index(word) + 3)) # removes trailing delimeter after "and", i.e., "2, 10, and Ace"
    values
  end
end

def shuffle(cards)
  cards_arr = []
  values = cards.map { |card| card[1] }
  cards_arr = values.sample(2)
end

# Keep track of the cards for each player 
player_cards = shuffle(CARDS)
dealer_cards = shuffle(CARDS)

# Keep track if player decides to stay
player_hold = 0
dealer_hold = 0

def initialize_game(player_cards, dealer_cards, player_hold, dealer_hold)
  prompt "Welcome to Twenty-One! 🃏 ♣ ♠️ ♦ ♥️"
  show_dealer(dealer_cards)
  show_player(player_cards)
  player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
end

def show_dealer(cards)
  prompt "Dealer has: #{cards[0]} and unknown card"
end

def show_player(cards)
  prompt "You have: #{cards[0]} and #{cards[1]} | Total: #{total(cards)}"
end

def hit_me(cards)
  values = CARDS.map { |card| card[1] }
  cards << values.sample(1).join(' ')
  cards.delete('and')
  prompt "You now have: #{handle_join(cards)} | Total: #{total(cards)}"
end

def player_bust?(cards)
  true if total(cards) > BUST
end

def dealer_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  values = CARDS.map { |card| card[1] }
  
  loop do
    break if total(dealer_cards) >= DEALER_MAX
    dealer_cards << values.sample(1).join(' ')
    dealer_cards.delete('and')
  end
  
  dealer_bust?(player_cards, dealer_cards, player_hold, dealer_hold)
end

def player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  loop do
    prompt 'hit or stay? Enter h (hit) or s (stay)'
    answer = gets.chomp.downcase
    
    hit_me(player_cards) if answer == 'h'
    break if answer == 's' || player_bust?(player_cards)
  end

  if player_bust?(player_cards)
    prompt 'Player Bust ❌ Dealer Wins.'
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    prompt "You Chose To Stay With: #{total(player_cards)}"
    player_hold += 1
    dealer_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  end
end

def dealer_bust?(player_cards, dealer_cards, player_hold, dealer_hold)
  if total(dealer_cards) > BUST
    prompt "Dealer has: #{handle_join(dealer_cards)} | Total: #{total(dealer_cards)}"
    prompt 'Dealer Busts! Player Wins 🏆'
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    prompt "Dealer Chose To Stay With: #{total(dealer_cards)}"
    dealer_hold += 1
    if player_hold == 1 && dealer_hold == 1 # When both player and dealer choose to stay
      compare_cards(player_cards, dealer_cards)
      display_results(player_cards, dealer_cards, player_hold, dealer_hold)
    else
      player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
    end
  end
end

def reset_game(player_cards, dealer_cards, player_hold, dealer_hold)
  system 'clear'
  player_cards = shuffle(CARDS)
  dealer_cards = shuffle(CARDS)
  player_hold = 0
  dealer_hold = 0
  initialize_game(player_cards, dealer_cards, player_hold, dealer_hold)
end

def play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  answer = nil
  loop do
    prompt 'Do you want to play again? y (yes) or n (no)'
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
  end
  prompt answer == 'y' ? reset_game(player_cards, dealer_cards, player_hold, dealer_hold) : 'Thanks for Playing Twenty-One. Goodbye!'
end

# both player and dealer stays - compare cards
def compare_cards(player_cards, dealer_cards)
  scores = { 'Player': total(player_cards), 'Dealer': total(dealer_cards) }
end

def player_won(player_cards, dealer_cards, player_hold, dealer_hold)
  prompt 'Player Wins 🏆 Dealer Loses.'
  prompt "==========================="
  play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
end

def tie_game(player_cards, dealer_cards, player_hold, dealer_hold)
  prompt "It's a tie 👯"
  prompt "==========================="
  play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
end

def player_lost(player_cards, dealer_cards, player_hold, dealer_hold)
  prompt 'Player Loses ❌ Dealer Wins.'
  prompt "==========================="
  play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
end

def display_results(player_cards, dealer_cards, player_hold, dealer_hold)
  if compare_cards(player_cards, dealer_cards)[:Player] > compare_cards(player_cards, dealer_cards)[:Dealer]
    player_won(player_cards, dealer_cards, player_hold, dealer_hold)
  elsif total(player_cards) == total(dealer_cards)
    tie_game(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    player_lost(player_cards, dealer_cards, player_hold, dealer_hold)
  end
end

initialize_game(player_cards, dealer_cards, player_hold, dealer_hold)

