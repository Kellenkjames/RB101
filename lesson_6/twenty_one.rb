require "pry"

#* Assignment: Twenty-One

=begin

High Level Pseudocode: 

1. Initialize Deck [DONE]
2. Deal cards to `player` and `dealer` 
3. Player turn: hit or stay
  1. repeat until bust or "stay"
4. If player bust, dealer wins. 
5. Dealer turn: hit or stay
  1. repeat until total >= 17
6. If dealer bust, player wins. 
7. Compare cards and declare winner. 

=end

PLAYER_MAX = 21
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

def initialize_deck
  CARDS.shuffle
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

def handle_join(cards, delimeter=',', word="and")
  if cards.size == 2
    cards.insert(-2, word).join(' ')
  elsif cards.size > 2
    values = cards.insert(-2, word).join(', ')
    values.slice((values.index(word) + 3)) # removes trailing delimeter after "third" string, i.e., "2, 10, and Ace"
    values
  end
end

def play_again?(cards)
  answer = nil
  loop do
    prompt "Do you want to play again? y (yes) or n (no)."
    answer = gets.chomp.upcase
    
    if answer == 'Y'
      player_turn(initialize_deck)
      break
    else
      prompt "Thanks for Playing Twenty-One. Goodbye!"
      break
    end
  end
end

def busted?(cards, values)
  cards << values.sample(1).join(' ')
  p cards
  prompt "You have: #{handle_join(cards)}"
  prompt "Player Busts! Dealer Wins." if total(cards) > PLAYER_MAX 
end

def player_turn(cards)
  player_cards = []
  values = cards.map { |card| card[1] }
  
  player_cards = values.sample(2)
  prompt "You have: #{handle_join(player_cards)}"

  answer = nil
  loop do
    prompt "hit or stay? Enter h (hit) or s (stay)"
    answer = gets.chomp.downcase
    break if answer == 's' || busted?(player_cards, values)
  end

end

def dealer_turn(cards)
  dealer_cards = []
  values = cards.map { |card| card[1] }

  dealer_cards = values.sample(2)
  prompt "Dealer has: #{handle_join(deck_modifier(dealer_cards))}"
  # prompt "Dealer has: #{handle_join(deck_modifier(dealer_cards))[0]} and unknown card"

  loop do
    # We don't want to ask the question at least "once", therefore we put the break condition at the top. 
    break if total(dealer_cards) >= DEALER_MAX
    dealer_cards << values.sample(1).join(' ')
  end

  # prompt "Dealer has: #{handle_join(deck_modifier(dealer_cards))}"
end

player_turn(initialize_deck)
# dealer_turn(initialize_deck)