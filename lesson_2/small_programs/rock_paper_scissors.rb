# Rock Paper Scissors

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts ">> #{message}"
end

def display_results(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif   (player == 'rock' && computer == 'paper') ||
          (player == 'paper' && computer == 'scissors') ||
          (player == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = nil
  loop do
    prompt('Welcome to RPS! Please choose rock, paper, or scissors')
    choice = gets.chomp.downcase

    break if VALID_CHOICES.join(', ').include?(choice)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, computer chose #{computer_choice}")
  display_results(choice, computer_choice)

  prompt('Would you like to play again? y for yes')
  answer = gets.chomp.downcase

  break unless answer.include?('y')
end

prompt('Thanks for playing RPS. Good bye!')
