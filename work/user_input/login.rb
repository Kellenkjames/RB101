# In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

USERNAME = "admin"
PASSWORD = "SecreT"

loop do 
  puts ">> Please enter user name:"
  username_try = gets.chomp 
  
  puts ">> Please enter your password:"
  password_try = gets.chomp
  
  break if username_try == USERNAME && password_try == PASSWORD
  
  puts ">> Authorization failed!"
end

puts "Welcome!"

