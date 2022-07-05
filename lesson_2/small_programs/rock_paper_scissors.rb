# Rock Paper Scissors

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

class Score
  class << self
    attr_accessor   :user
    attr_accessor   :computer
  end
end

Score.user = 0
Score.computer = 0

MOVES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['spock', 'paper']
}

def win?(first, second)
  (first == 'rock' && second == MOVES[:rock][0] || MOVES[:rock][1]) ||
    (first == 'paper' && second == MOVES[:paper][0] || MOVES[:paper][1]) ||
    (first == 'scissors' && second == MOVES[:scissors][0] || MOVES[:scissors][1]) ||
    (first == 'spock' && second == MOVES[:spock][0] || MOVES[:spock][1]) ||
    (first == 'lizard' && second == MOVES[:lizard][0] || MOVES[:lizard][1])
end

def prompt(message)
  puts ">> #{message}"
end

def word_shorten(word)
  if word.start_with?('r')
    'rock'
  elsif word.start_with?('p')
    'paper'
  elsif word.start_with?('sc')
    'scissors'
  elsif word.start_with?('sp')
    'spock'
  elsif word.start_with?('l')
    'lizard'
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def score_counter(player, computer)
  if win?(player, computer) 
    Score.user += 1
  elsif win?(computer, player)
    Score.computer += 1
  end
  prompt("Your score: #{Score.user} points")
  prompt("Computer score: #{Score.computer} points")
end

def game_reset(player_score, computer_score)
  if player_score == 3
    puts("Match is over. You win!")
    Score.user = 0
    Score.computer = 0
  elsif computer_score == 3
    puts("Match is over. Computer wins!")
    Score.user = 0
    Score.computer = 0
  end
end

loop do
  choice = nil
  word = nil
  loop do
    prompt('Welcome to Rock Paper Scissors Spock Lizard!')
    prompt('You can type: "r" for "rock", "p" for "paper", "sc" for "scissors",
      "sp" for "spock", and "l" for "lizard"')

    choice = gets.chomp.downcase
    word = word_shorten(choice)

    break if VALID_CHOICES.include?(word)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{word} | Computer chose: #{computer_choice}")
  display_results(word, computer_choice)
  score_counter(word, computer_choice)

  game_reset(Score.user, Score.computer)

  prompt('Do you want to play again? y for another round')
  answer = gets.chomp.downcase

  break unless answer.include?('y')
end

prompt('Thanks for playing RPS. Good bye!')
