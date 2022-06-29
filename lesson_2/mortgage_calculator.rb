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

# Str conversions
loan_amount = loan_amount.to_i
annual_interest_rate = annual_interest_rate.to_f

prompt("The annual interest rate is #{annual_interest_rate}%")

loan_duration = nil
loop do
  prompt("How long is the duration of the loan (in years)?")
  loan_duration = gets.chomp

  break if integer?(loan_duration)
  prompt("Please enter a valid number")
end

prompt("The duration of the loan is #{loan_duration} years")

# Str conversion
loan_duration = loan_duration.to_i

# Monthly interest rate (convert from APR)
monthly_interest_rate = (annual_interest_rate / 100) / 12
prompt("The monthly interest rate is #{monthly_interest_rate}%")

# Loan duration (convert to months)
loan_duration_months = loan_duration * 12
prompt("The loan duration is #{loan_duration_months} months")

# Monthly payment
monthly_payment = loan_amount * (monthly_interest_rate / (1 -
(1 + monthly_interest_rate)**(-loan_duration_months)))

prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")
puts ""
prompt("Thank you for using Mortgage Calculator.")
prompt("Good bye!")
