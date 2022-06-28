# Calculator [Command Line]

# Load messages
require 'yaml'
MESSAGES = YAML.load_file('config.yml')

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
  case op
  when '1'
    return MESSAGES["en"]["adding"]
  when '2'
    return MESSAGES["en"]["subtracting"]
  when '3'
    return MESSAGES["en"]["multiplying"]
  when '4'
    return MESSAGES["en"]["dividing"]
  end
  puts "Now code can be run safely after case statement"
end

prompt(MESSAGES["en"]["welcome_msg"])

name = nil
loop do
  name = gets.chomp
  name.empty? ? prompt(MESSAGES["en"]["valid_name"]) : break
end

prompt("#{MESSAGES['en']['greeting']} #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(MESSAGES['en']['first_number'])
    number1 = gets.chomp
    break if number?(number1)

    prompt(MESSAGES['en']['invalid_number'])
  end

  number2 = nil
  loop do
    prompt(MESSAGES["en"]["second_number"])
    number2 = gets.chomp
    break if number?(number2)

    prompt(MESSAGES["en"]["invalid_number"])
  end

  operator_prompt = "#{MESSAGES["en"]['operation']}
    #{MESSAGES["en"]['add']}
    #{MESSAGES["en"]['subtract']}
    #{MESSAGES["en"]['multiply']}
    #{MESSAGES["en"]['divide']}"

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)

    prompt(MESSAGES["en"]["must_choose"])
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES["en"]['two_numbers']}")

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

  prompt("#{MESSAGES["en"]['result']} #{result}")

  prompt(MESSAGES["en"]['another_calc?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES["en"]['thank_you'])
