require "pry"

#* Assignment: Twenty-One

BUST = 21
DEALER_MAX = 17

player_hold = 0
dealer_hold = 0

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

def handle_join(cards, word="and")
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

player_cards = shuffle(CARDS)
dealer_cards = shuffle(CARDS)

def initialize_game(player_cards, dealer_cards, player_hold, dealer_hold)
  show_dealer(dealer_cards)
  show_player(player_cards)
  player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
end

def show_dealer(cards)
  prompt "Dealer has: #{cards[0]} and unknown card"
end

def show_player(cards)
  prompt "You have: #{cards[0]} and #{cards[1]}"
end

def hit_me(cards)
  values = CARDS.map { |card| card[1] }
  cards << values.sample(1).join(' ')
  cards.delete('and')
  prompt "You have: #{handle_join(cards)}"
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
    prompt "Hit or Stay? Enter H (Hit) or S (Stay)"
    answer = gets.chomp.upcase
    
    hit_me(player_cards) if answer == 'H'
    break if answer == 'S' || player_bust?(player_cards)
  end

  if player_bust?(player_cards)
    prompt "Player Bust! Dealer Wins."
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    prompt "You Chose To Stay"
    player_hold += 1
    dealer_turn(player_cards, dealer_cards, player_hold, dealer_hold)
  end
end

def dealer_bust?(player_cards, dealer_cards, player_hold, dealer_hold)
  if total(dealer_cards) > BUST
    prompt "Dealer has: #{handle_join(dealer_cards)}"
    prompt "Dealer Busts! Player Wins."
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    prompt "Dealer Chose To Stay."
    dealer_hold += 1
    if player_hold == 1 && dealer_hold == 1
      compare_cards(player_cards, dealer_cards)
      display_results(player_cards, dealer_cards, player_hold, dealer_hold)
    else
      player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
    end
  end
end

def reset_game(player_cards, dealer_cards, player_hold, dealer_hold)
  player_cards = shuffle(CARDS)
  dealer_cards = shuffle(CARDS)
  show_dealer(dealer_cards)
  show_player(player_cards)
  player_turn(player_cards, dealer_cards, player_hold, dealer_hold)
end

def play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  answer = nil
  loop do
    prompt "Do you want to play again? Y (Yes) or n (No)."
    answer = gets.chomp.upcase
    break if answer == 'Y' || answer == 'N'
  end
  if answer == 'Y'
    reset_game(player_cards, dealer_cards, player_hold, dealer_hold)
  elsif answer == 'N'
    prompt "Thanks for Playing Twenty-One. Goodbye!"
  end
end

def compare_cards(player_cards, dealer_cards)
  scores = { 'Player': total(player_cards), 'Dealer': total(dealer_cards) }
end

def display_results(player_cards, dealer_cards, player_hold, dealer_hold)
  if compare_cards(player_cards, dealer_cards)[:Player] > compare_cards(player_cards, dealer_cards)[:Dealer]
    prompt "Player Wins! Dealer Loses."
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  else
    promt "Player Loses! Dealer Wins."
    play_again?(player_cards, dealer_cards, player_hold, dealer_hold)
  end
end

initialize_game(player_cards, dealer_cards, player_hold, dealer_hold)

