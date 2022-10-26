require "pry"

# frozen_string_literal: true

WINNING_LINES =
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
  [[1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def str_join(arr, delimeter="", word="")
  string = arr.insert(arr[-2], word).join(" ")
    new_arr = []
    counter = 1 
    loop do 
      new_arr << counter
      string.insert(counter, delimeter)
      counter += 3
      break if new_arr.size == arr.size - 2
    end
  string
end 

def joinor(arr, delimeter="", word="")
  if arr.size == 1 && delimeter == "" && word == ""
    arr.join("")
  elsif arr.size == 2 && delimeter == "" && word == ""
    arr.insert(arr[-2], 'or').join(" ") 
  elsif arr.size > 2 && delimeter == "" && word == ""
    str_join(arr, delimeter=",", word="or")
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER} Computer is #{COMPUTER_MARKER}"
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_turn!(brd)
  square = ''
  smart_prompt = joinor(empty_squares(brd), delimeter="", word="")
  
  loop do
    prompt "Choose a position to place a piece: #{smart_prompt}"

    square = gets.chomp.to_i

    # On each iteration, remove extra spaces + commas 
    

    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_turn!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
  end
  nil
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_turn!(board)
    break if someone_won?(board) || board_full?(board)

    computer_turn!(board)
    break if someone_won?(board) || board_full?(board)
  end

  someone_won?(board) ? prompt("#{detect_winner(board)} won!") : prompt("It's a tie!")

  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
