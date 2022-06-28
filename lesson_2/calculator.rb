# Calculator [Command Line]

# Load messages from YAML file
require 'yaml'
MESSAGES = YAML.load_file('config.yml')

# Handle prompts
def prompt(message)
  puts("=> #{message}")
end

# Validate Integers
def valid_number?(num_string)
  num_string.to_i.to_s == num_string && num_string.to_i >= 0
end

# Integers or Floats
def number?(num_string)
  valid_number?(num_string) || num_string.to_f.to_s ==
    num_string && num_string.to_f >= 0
end

# Language translation
def translation(lang)
  lang == 'en' ? 'en' : 'es'
end

def operation_to_message(op, lang)
  word =
    case op
    when '1'
      MESSAGES[translation(lang)]['adding']
    when '2'
      MESSAGES[translation(lang)]['subtracting']
    when '3'
      MESSAGES[translation(lang)]['multiplying']
    when '4'
      MESSAGES[translation(lang)]['dividing']
    end
    # If we wante to add code here, it's now possible
  word
end

lang = nil
loop do
  puts "Do you want to run calculator in english or spanish?
  (en for english, es for spanish)"
  lang = gets.chomp

  break if lang == 'en' || lang == 'es'
  puts "Please type en for english or es for spanish"
end

prompt(MESSAGES[translation(lang)]['welcome'])

name = nil
loop do
  name = gets.chomp
  name.empty? ? prompt(MESSAGES[translation(lang)]['valid_name']) : break
end

prompt("#{MESSAGES[translation(lang)]['greeting']} #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(MESSAGES[translation(lang)]['first_number'])
    number1 = gets.chomp
    break if number?(number1)

    prompt(MESSAGES[translation(lang)]['invalid_number'])
  end

  number2 = nil
  loop do
    prompt(MESSAGES[translation(lang)]['second_number'])
    number2 = gets.chomp
    break if number?(number2)

    prompt(MESSAGES[translation(lang)]['invalid_number'])
  end

  operator_prompt = "#{MESSAGES[translation(lang)]['operation']}
    #{MESSAGES[translation(lang)]['add']}
    #{MESSAGES[translation(lang)]['subtract']}
    #{MESSAGES[translation(lang)]['multiply']}
    #{MESSAGES[translation(lang)]['divide']}"

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)

    prompt(MESSAGES[translation(lang)]['must_choose'])
  end

  prompt("#{operation_to_message(operator, lang)}
    #{MESSAGES[translation(lang)]['two_numbers']}")

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

  prompt("#{MESSAGES[translation(lang)]['result']} #{result}")

  prompt(MESSAGES[translation(lang)]['another_calc?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES[translation(lang)]['thank_you'])
