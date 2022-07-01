# Coding Tips 2

#* Using new lines to organize code 

# bad

name = ''
puts "Enter your name: "
loop do
  name = gets.chomp
  break unless name.empty?
  puts "That's an invalid name. Try again:"
end
puts "Welcome #{name}!"
puts "What would you like to do?"

# better

name = '' # => variable initialization

puts "Enter your name: "
loop do
  name = gets.chomp # => user input and validation
  break unless name.empty?
  puts "That's an invalid name. Try again:"
end

puts "Welcome #{name}!" # => using the variable
puts "What would you like to do?"

#------------------------------------------------

#* Should a method return or display? 

# Side effects: There is either displaying something to the output or mutating an object. For example:

# side effect: displays something to the output
# return nil 

def total(num1, num2)
  puts num1 + num2
end 

# side effect: mutates the passed-in array 
# returns: updated array

def append(target_array, value_to_append)
  target_array << value_to_append
end

# side effect: none
# returns: new integer

def total(num1, num2)
  num1 + num2
end 

#------------------------------------------------

#* In general, if a method has both side effects and a meaningful return value, it's a red flag. 

# Try to avoid writing methods that do this, as it will be very difficult to use these methods in the future. 

#* Methods
# If you find yourself constantly looking at a method's implementation every time you use it, it's a sign that the method needs to be improved. 

#* A method should do one thing, and be named appropriately. If you can treat a method as a "black box", then it's a well designed method. 

#------------------------------------------------

# Don't mutate the caller during iteration 

words = %w(scooby doo on channel two)
words.each {|str| words.delete(str)}
puts words.inspect        # => ["doo", "channel"]

#* Don't mutate a collection while iterating through it. 

# You can, however, mutate the individual elements within that collection, just not the collection itself. Otherwise, you'll get unexpected behavior. 

#------------------------------------------------

#* Variable Shadowing 

# Variable shadowing occurs when you choose a local variable in an inner scope that shares the same name as an outer scope. It's incredibly easy to make this mistake, and essentially prevents you from accessing the outer scope variable from an inner scope.  

name = 'johnson'

['kim', 'joe', 'sam'].each do |name|
  # uh-oh, we cannot access the outer scoped "name"!
  puts "#{name} #{name}"
end

#------------------------------------------------

#* Don't use assignment in a conditional

# bad

if some_variable = get_a_value_from_somewhere
  puts some_variable
end

# good

some_variable = get_a_value_from_somewhere
if some_variable
  puts some_variable
end

#------------------------------------------------

# Bad practice 

numbers = [1, 2, 3, 4, 5]

while num = numbers.shift
  puts num
end

# Better (wrap the conditional statement in parentheses)
numbers = [1, 2, 3, 4, 5]

while (num = numbers.shift)
  puts num
end

#------------------------------------------------

#* Use underscore for unused parameters
names = ['kim', 'joe', 'sam']
names.each { |_| puts "got a name!" }