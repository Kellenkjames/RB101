# Rock Paper Scissors

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

$player_score = 0
$computer_score = 0  

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
    word = 'rock'
  elsif word.start_with?('p') 
    word = 'paper'
  elsif word.start_with?('sc')
    word = 'scissors'
  elsif word.start_with?('sp')
    word = 'spock'
  elsif word.start_with?('l')
    word = 'lizard'
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

# Each time the function is called (score is reset back to "zero") --> How do we fix this?
def score_counter(player, computer) 
  if win?(player, computer) || more_options?(player, computer)
    $player_score += 1
  elsif win?(computer, player) || more_options?(computer, player) 
    $computer_score += 1
  end
  prompt("Your score: #{$player_score} points")
  prompt("Computer score: #{$computer_score} points")
end

def game_reset(player_score, computer_score) 
  if player_score == 3 
    puts("Match is over. You win!")
    $player_score = 0 
    $computer_score = 0
  elsif computer_score == 3 
    puts("Match is over. Computer wins!")
    $player_score = 0
    $computer_score = 0
  end 
end

loop do
  choice = nil
  word = nil 
  loop do
    prompt('Welcome to Rock Paper Scissors Spock Lizard!')
    prompt('You can type: "r" for "rock", "p" for "paper", "sc" for "scissors", "sp" for "spock", and "l" for "lizard"')
    
    choice = gets.chomp.downcase
    word = word_shorten(choice)
    
    break if VALID_CHOICES.include?(word)
    prompt("That's not a valid choice")
  end
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose: #{word} | Computer chose: #{computer_choice}")
  display_results(word, computer_choice)
  score_counter(word, computer_choice)
  
  game_reset($player_score, $computer_score)
  
  prompt('Do you want to play again? y for another round')
  answer = gets.chomp.downcase
  
  break unless answer.include?('y')
end

prompt('Thanks for playing RPS. Good bye!')
