# Calculator + Refactor

=begin

  * Requirements:

  TODO => Build a command line calculator program that does the following:
    - asks for two numbers
    - asks for the type of operation to perform
      - add, subtract, multiply, or divide
    - displays the result

=end

def prompt(message)
  puts("=> #{message}")
end

# *  Bonus feature: Better integer validation
def valid_number?(num_string)
  # validate integers
  num_string.to_i.to_s == num_string && num_string.to_i >= 0
end

# * Bonus feature: Number validation
def number?(num_string)
  # integers or floats
  valid_number?(num_string) || num_string.to_f.to_s ==
    num_string && num_string.to_f >= 0
end

def operation_to_message(op)
  # * Bonus feature: Adding explicit returns in case statement
  case op
  when '1'
    return 'Adding'
  when '2'
    return 'Subtracting'
  when '3'
    return 'Multiplying'
  when '4'
    return 'Dividing'
  end
  puts "Now code can be run safely after case statement"
end

prompt("Welcome to Calculator! Enter your name:")

name = nil
loop do
  name = gets.chomp
  name.empty? ? prompt("Make sure to use a valid name.") : break
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    break if number?(number1)

    prompt("Hmm... that doesn't look like a valid number")
  end

  number2 = nil
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp
    break if number?(number2)

    prompt("Hmm... that doesn't look like a valid number")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add
    2) subtract
    3) multiply
    4) divide 
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)

    prompt("Must choose 1, 2, 3, or 4")
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =
    case operator
    when '1'
      number1.to_i + number2.to_i
    when '2'
      number1.to_i - number2.to_i
    when '3'
      number1.to_i * number2.to_i
    when '4'
      number1.to_f / number2.to_f
    end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
