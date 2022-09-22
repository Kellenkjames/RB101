require 'pry'

# *Tic Tac Toe
=begin

#* High Level Pseudo-Code:
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

=end 

# ----------------------------------------

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end 

# Step 1: Set up and display the board 
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER} Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}" 
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end 

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end 

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }  
end 

# Step 2: Player Turn
def player_turn!(brd)
  square = ''
  loop do 
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):" 
    square = gets.chomp.to_i
    
    break if empty_squares(brd).include?(square)  
    prompt "Sorry, that's not a valid choice."
  end 
  
  brd[square] = PLAYER_MARKER
end 

# Step 3: Computer Turn 
def computer_turn!(brd)
  square = empty_squares(brd).sample  
  brd[square] = COMPUTER_MARKER
end 

# Step 5: Determine if the board is full 
def board_full?(brd)
  empty_squares(brd).empty?
end 

# Step 6: Determine if someone won
def someone_won?(brd)
  !!detect_winner(brd) # => If there is a winner, return true, otherwise return nil 
end 

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +    # rows
                              [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols  
                              [[1, 5, 9], [3, 5, 7]]                      # diagonals 
  
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER && 
      brd[line[1]] == PLAYER_MARKER && 
      brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER && 
      brd[line[1]] == COMPUTER_MARKER && 
      brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end 
  end 
  nil
end 

# Step 4: Main Game Loop
loop do 
  board = initialize_board  

  loop do 
    display_board(board)
    
    player_turn!(board)
    break if someone_won?(board) || board_full?(board) 
    
    computer_turn!(board)
    break if someone_won?(board) || board_full?(board) 
  end 

  # Final Result 
  someone_won?(board) ? prompt("#{detect_winner(board)} won!") : prompt("It's a tie!")

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt "Thanks for playing Tic Tac Toe! Good bye!"