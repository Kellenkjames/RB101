# Mortgage Calculator

# Handle prompts
def prompt(msg)
  puts ">> #{msg}"
end 

# Handle integer validation
def integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

# Handle number validation
def number?(input)
  integer?(input) || input.to_f.to_s == input && input.to_f > 0
end

name = nil 
loop do 
  prompt("Welcome to Mortgage Calculator. What's your name?")
  name = gets.chomp
  name.empty? ? prompt("Please enter a valid name") : break 
end 

prompt("Welcome in #{name}. Let's calculate your mortgage.")

loan_amount = nil 
loop do 
  prompt("What is the loan amount?")
  loan_amount = gets.chomp
  
  break if integer?(loan_amount)
  prompt("Please enter a valid number")
end 

prompt("The loan amount is $#{loan_amount}")

annual_interest_rate = nil 
loop do 
  prompt("What is the Annual Percentage Rate (APR)? i.e. enter 5 for 5%") 
  annual_interest_rate = gets.chomp 
  
  break if number?(annual_interest_rate)
  prompt("Please enter a valid number")
end 

# Conversion str to float
annual_interest_rate = annual_interest_rate.to_f / 100

prompt("The annual interest rate is #{annual_interest_rate}%")


