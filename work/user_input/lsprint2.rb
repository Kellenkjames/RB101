# Modify this program so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters q or Q

# Note: Whenever we have a program that is soliciting 2x different data types i.e. string and integer (we need to use 2x variables and convert one of them)

loop do 
  input_string = nil
  number_of_lines = nil 
  
  loop do 
    puts ">> How many output lines do you want? Enter a number >= 3 (Q to Quit):"
    
    input_string = gets.chomp.downcase
    break if input_string == "q"
    
    number_of_lines = input_string.to_i
    break if number_of_lines >= 3
  end
  
  # Still need this since original break statement was inside of a nested loop
  break if input_string == "q"

  while number_of_lines > 0
    puts "Launch School is the best!"
    number_of_lines -= 1
  end 
  
end 


















