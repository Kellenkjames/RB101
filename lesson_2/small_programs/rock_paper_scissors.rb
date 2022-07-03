# Rock Paper Scissors

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

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

# Method to handle user input (user types in "r" for rock) need regex pattern? 
def str_convert(str) 
  if str.match(/r/) 
    str = 'rock'
  elsif str.match(/p/)
    str = 'paper'
  elsif str.match(/s/)
    str = 'scissors'
  elsif str.match(/l/)
    str = 'lizard'
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

loop do
  choice = nil
  loop do
    prompt('Welcome to RPS! Please choose rock, paper, scissors, spock, or lizard')
    prompt('You can type "r" for "rock", "p" for "paper", etc.')
    choice = gets.chomp.downcase
    
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice} | Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)

  prompt('Do you want to play again? y for another round')
  answer = gets.chomp.downcase

  break unless answer.include?('y')
end

prompt('Thanks for playing RPS. Good bye!')
