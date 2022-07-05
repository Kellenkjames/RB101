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

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def more_options?(first, second)
  (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
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
  if win?(player, computer) || more_options?(player, computer)
    prompt('You won!')
  elsif win?(computer, player) || more_options?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def score_counter(player, computer)
  if win?(player, computer) || more_options?(player, computer)
    Score.user += 1
  elsif win?(computer, player) || more_options?(computer, player)
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
