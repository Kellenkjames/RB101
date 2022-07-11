# Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

# Returns a boolean if the number is "valid" ando not equal to 0
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

int_one = nil 
int_two = nil 
loop do 
  
  loop do 
    puts ">> Please enter a positive or negative integer:"
    int_one = gets.chomp
    
    break if valid_number?(int_one)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end 
  
  loop do 
    puts ">> Please enter a positive or negative integer:"
    int_two = gets.chomp
    
    break if valid_number?(int_two)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end 
  
  # Convert strings to integers
  int_one = int_one.to_i
  int_two = int_two.to_i
  
  # Check to make sure at least one is positive or negative 
  break if int_one.negative? || int_two.negative?
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
  
end 

# Result 
sum = int_one + int_two
puts "#{int_one} + #{int_two} = #{sum}"



