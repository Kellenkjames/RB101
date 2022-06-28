# Calculator + Refactor

# Load messages 
require 'yaml'
msgs = YAML.load_file('config.yml')

=begin

  TODO => Build a command line calculator program that does the following:
    - asks for two numbers
    - asks for the type of operation to perform
      - add, subtract, multiply, or divide
    - displays the result

=end

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num_string)
  # validate integers
  num_string.to_i.to_s == num_string && num_string.to_i >= 0
end

def number?(num_string)
  # integers or floats
  valid_number?(num_string) || num_string.to_f.to_s ==
    num_string && num_string.to_f >= 0
end

def operation_to_message(op)
  msgs = YAML.load_file('config.yml')
  case op
  when '1'
    return msgs["adding"]
  when '2'
    return msgs["subtracting"]
  when '3'
    return msgs["multiplying"]
  when '4'
    return msgs["dividing"]
  end
  puts "Now code can be run safely after case statement"
end

prompt(msgs["welcome_msg"])

name = nil
loop do
  name = gets.chomp
  name.empty? ? prompt(msgs["valid_name"]) : break
end

prompt("#{msgs["greeting"]} #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(msgs["first_number"])
    number1 = gets.chomp
    break if number?(number1)

    prompt(msgs["invalid_number"])
  end

  number2 = nil
  loop do
    prompt(msgs["second_number"])
    number2 = gets.chomp
    break if number?(number2)

    prompt(msgs["invalid_number"])
  end

  operator_prompt = "#{msgs["operation"]}
    #{msgs["add"]}
    #{msgs["subtract"]}
    #{msgs["multiply"]}
    #{msgs["divide"]}"
  
  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)

    prompt(msgs["must_choose"])
  end

  prompt("#{operation_to_message(operator)} #{msgs["two_numbers"]}")

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

  prompt("#{msgs["result"]} #{result}")

  prompt("#{msgs["another_calc?"]}")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("#{msgs["thank_you"]}")
