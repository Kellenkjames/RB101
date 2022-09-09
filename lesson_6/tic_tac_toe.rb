
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

# Board that is passed into display_board is a "hash" and the keys correlate with the space number. 
# Keys:     Represent the squares in the board, i.e., 1, 2, 3
# Values: Represent "what" we display => "X", "O", or " "

def display_board(brd)
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
  (1..9).each { |num| new_board[num] = 'X' } 
  new_board
end

board = initialize_board
display_board(initialize_board)