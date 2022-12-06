# frozen_string_literal: true

CARDS = [
  %w[C A], %w[D A], %w[H A], %w[S A],
  %w[C 2], %w[D 2], %w[H 2], %w[S 2],
  %w[C 3], %w[D 3], %w[H 3], %w[S 3],
  %w[C 4], %w[D 4], %w[H 4], %w[S 4],
  %w[C 5], %w[D 5], %w[H 5], %w[S 5],
  %w[C 6], %w[D 6], %w[H 6], %w[S 6],
  %w[C 7], %w[D 7], %w[H 7], %w[S 7],
  %w[C 8], %w[D 8], %w[H 8], %w[S 8],
  %w[C 9], %w[D 9], %w[H 9], %w[S 9],
  %w[C 10], %w[D 10], %w[H 10], %w[S 10],
  %w[C J], %w[D J], %w[H J], %w[S J],
  %w[C Q], %w[D Q], %w[H Q], %w[S Q],
  %w[C K], %w[D K], %w[H K], %w[S K]
].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def calc_sum(value)
  sum = 0
  if value == 'A'
    sum += 11
  elsif value == 'and'
    sum += 0
  elsif value.to_i.zero? # J, Q, K
    sum += 10
  else
    sum += value.to_i
  end
end

# Calculating Aces
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card }
  
  sum = 0
  values.each do |value|
    sum += calc_sum(value)
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

# Keep track when player decides to hold position
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

def player_21?(cards)
  true if total(cards) > 21
end

def dealer_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  values = CARDS.map { |card| card[1] }
  
  loop do
    break if total(dealer_cards) >= 17
    dealer_cards << values.sample(1).join(' ')
    dealer_cards.delete('and')
  end
  
  dealer_21?(player_cards, dealer_cards, player_hold, dealer_hold)
end

def player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  loop do
    prompt 'hit or stay? Enter h (hit) or s (stay)'
    answer = gets.chomp.downcase
    
    hit_me(player_cards) if answer == 'h'
    break if answer == 's' || player_21?(player_cards)
  end

  if player_21?(player_cards)
    prompt 'Player 21 ❌ Dealer Wins.'
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    prompt "You Chose To Stay With: #{total(player_cards)}"
    player_hold += 1
    dealer_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  end
end

def dealer_21?(player_cards, dealer_cards, player_hold, dealer_hold)
  if total(dealer_cards) > 21
    prompt "Dealer has: #{handle_join(dealer_cards)} | Total: #{total(dealer_cards)}"
    prompt 'Dealer 21s! Player Wins 🏆'
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
  if answer == 'y'
    reset_game(player_cards, dealer_cards, player_hold, dealer_hold)
  elsif answer == 'n'
    prompt 'Thanks for Playing Twenty-One. Goodbye!'
  else
    prompt 'Please choose y (yes) or n (no)'
  end
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

