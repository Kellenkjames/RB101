
#* Assignment: TTT Bonus Features (Keep Score)

# Keep score how how many times the player and computer each win. Don't use global or instance variables. Make it so that the first player to 5 wins the game. 

# ----------------------------------------------------------------------

=begin

* P - [Understanding the Problem]

Inputs:
- Integer 

Outputs:
- Integer 

Explicit Requirements: 
- Keep score of how many times the player and computer each win. 
- First player to 5 wins the game. 

Implicit Requirements:
- Don't use global or instance variables.
- Display the score of each player after each round.   

Clarifying Questions: 
- N / A

# ----------------------------------------------------------------------

* E - Examples / Test Cases

=> Player score: 5
=> Computer score: 3

=> Player wins

# ----------------------------------------------------------------------

*D - Data Structure 

Array []

# ----------------------------------------------------------------------

* A - Algorithm:

def keep_score(detect_winner, brd)
  player_score = 0
  computer_score = 0
  
  if detect_winner(brd) == 'Player' 
    player_score += 1
  elsif detect_winner(brd) == 'Computer'
    computer_score += 1
  end

  if player_score == 5
    prompt "Player Wins"
  elsif computer_score == 5
    prompt "Computer Wins"
  end 
  
end 

=end 