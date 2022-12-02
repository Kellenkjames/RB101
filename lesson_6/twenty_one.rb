require "pry"

#* Assignment: Twenty-One

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

def play_again?(cards)
  loop do
    prompt "Do you want to play again? y (yes) or n (no)."
    answer = gets.chomp.downcase

    if answer == 'y'
      player_turn(cards)
      break
    elsif answer == 'n'
      prompt "Thanks for Playing Twenty-One. Goodbye!"
      break
    end
  end
end

def hit_me(cards)
  values = CARDS.map { |card| card[1] }
  cards << values.sample(1).join(' ')
  cards.delete("and")
  prompt "You have: #{handle_join(cards)}"
end

def player_bust?(cards)
  prompt "Player Busts! Dealer Wins." if total(cards) > PLAYER_MAX
end

def shuffle(cards)
  cards_arr = []
  values = cards.map { |card| card[1] }
  cards_arr = values.sample(2)
end

player_cards = shuffle(CARDS)

def show_player(cards)
  prompt "You have: #{cards[0]} and #{cards[1]}"
end

def player_turn(cards)
  loop do
    prompt "Hit or Stay? Enter H (Hit) or S (Stay)"
    answer = gets.chomp.upcase
    
    hit_me(cards) if answer == 'H'
    break if answer == 'S' || player_bust?(cards)

  end

  if player_bust?(cards)
    play_again?(player_cards)
  else
    prompt "You Chose To Stay"
  end
end

dealer_cards = shuffle(CARDS)

def show_dealer(cards)
  prompt "Dealer has: #{cards[0]} and unknown card"
end

def dealer_turn(cards)
  values = CARDS.map { |card| card[1] }
  
  loop do
    break if total(cards) >= DEALER_MAX
    cards << values.sample(1).join(' ')
    cards.delete("and")
  end

  if total(cards) > PLAYER_MAX
    prompt "Dealer has: #{handle_join(cards)}"
    prompt "Dealer Busts! Player Wins."
  else
    prompt "Dealer Chose To Stay"
  end

end

# Show dealer cards
# show_dealer(dealer_cards)

# Show player cards
show_player(player_cards)

# Player Turn: the player goes first, and can decide to either "hit" or "stay".
player_turn(player_cards)

# Dealer Turn: when the player stays, it's the dealer's turn. The dealer must follow a strict rule for determining whether to hit or stay: hit until the total is at least 17. If the dealer busts, then the player wins.
# dealer_turn(dealer_cards)

# Comparing cards: when both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.