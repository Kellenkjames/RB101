#* Practice Problems: Hard 1

# Question 1: What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

p greeting  # nil 

# Solution: greeting is 'nil' here, and no "undefined method or local variable" exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it's undefined. 

# However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil.

puts # ----------------------------------------------------------------

# Question 2: What is the result of the last line in the code below? 

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # { :a=> "hi there" }

# Solution: The output is { :a=>"hi there" }. The reason is because informal_greeting is a reference to the original object. The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. 

# This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

# 1. informal_greeting = greetings[:a].clone => reference to a new object 

#2. informal_greeting = informal_greeting + ' there'  => returns a new string object 

puts # ----------------------------------------------------------------

# Question 3: In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A) 
def mess_with_vars(one, two, three)
  one = two 
  two = three 
  three = one 
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one"
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

puts # ----------------------------------------------------------------

# B) 
def mess_with_vars_v2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars_v2(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two 
puts "three is: #{three}" # three 

puts # ----------------------------------------------------------------

# C)
def mess_with_vars_v3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars_v3(one, two, three)

puts "one is: #{one}" # two
puts "two is: #{two}" # three
puts "three is: #{three}" # one 

puts # ----------------------------------------------------------------

# Question 4: Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. 

# Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

#* Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things: 

# 1. You're not returning a false condition, 

# 2. You're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code. 

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) 
  end
  
  true 
end