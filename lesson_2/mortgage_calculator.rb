# Mortgage Calculator

def prompt(msg)
  puts ">> #{msg}"
end 

name = nil 
loop do 
  prompt("Welcome to Mortgage Calculator. What's your name?")
  name = gets.chomp
  name.empty? ? prompt("Please enter a valid name") : break 
end 

prompt("Welcome in #{name}. Let's calculate your mortgage.")


