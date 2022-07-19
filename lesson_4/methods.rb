#* Methods 

# Using loops, such as loop or for, to iterate over a collection can become very repetitive. Ruby provides an easier way to work with collections through the use of built-in methods. In this assignment we'll specifically look at the methods each, select, and map.

# --------------------------------------

#* each 

# So far, we've learned that the most effective option for iterating over a collection is to use a loop, like this: 

numbers = [1, 2, 3]
counter = 0

loop do 
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end 

# Iterating over a collection is such a common task that Ruby provides a method to do just that. The each method is functionally equivalent to using loop and represents a simpler way of accomplishing the same task. Here's an example that produces the same result as the implementation above:

# --------------------------------------

[1, 2, 3].each do |num| 
  p num
end

# For each iteration, each sends the value of the current element to the block in the form of an argument. In this block, the argument to the block is num and it represents the value of the current element in the array. 

# --------------------------------------

hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value| 
  puts "The key is #{key} and the value is #{value}"
end 

# Hashes need two arguments in order to represent both the key and the value per iteration. Calling 'each' on a hash looks a little different, since the block has two arguments. 

# --------------------------------------

# We can iterate over an array or hash in a manual way by using loop, or we can iterate more idiomatically using each -- they're equivalent, for the most part. One of the main differences between them, however, is the return value.

#* Once each is done iterating, it returns the original collection:

# --------------------------------------

def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end

a_method # => [1, 2, 3]

# The return value is [1, 2, 3]. This is because the last expression in the method is [1, 2, 3].each 

# --------------------------------------

def a_method_two
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end

p a_method_two # => nil 

# The last expression within the method has changed from each to puts 'hi'. Since puts always returns nil, the return value of a_method is nil. 

# --------------------------------------

#* select 

# Arrays and hashes have a built-in way to iterate over a collection and perform selection: through a 'select' method that makes doing this significantly easier. For example, instead of managing a loop manually with a counter and break condition, we can just do this: 

[1, 2, 3].select do |num| 
  num.odd? 
end 

# To perform selection, select evaluates the return value of the block. The block returns a value on each iteration, which then gets evaluated by select. Similar to a real method, the return value of the block is the return value of the last expression within the block.

#* When evaluating the block's return value, select only cares about its truthiness. Everything in Ruby is considered "truthy" except for nil and false. 

# If the return value of the block is "truthy", then the element during that iteration will be selected. If the return value of the block is "falsey" then the element will not be selected. 

# --------------------------------------

[1, 2, 3].select do |num|
  num + 1
end 

#* In the above example, once select is done iterating, it returns a 'new collection' containing all of the selected elements, because the selection criteria -- the block's return value -- is truthy for every element in the array.

# --------------------------------------

# When working with 'select', it's important to always be aware of the return value of the block. For example, if we place the statement 'puts num' on the last line within the block, how will that affect the return value of 'select' ? 

[1, 2, 3].select do |num|
  num + 1
  puts num
end

# select will now return an empty array []. Since puts num is now the last evaluated expression in the block, it is the return value of this expression which determines the return value of the block. 

#* We know that puts always returns nil, therefore the return value of the block will now be nil, which is considered a "falsey" value. 

# --------------------------------------

#* map

# Similar to select, map also considers the return value of the block. The main difference between those two methods is that 'map' uses the return value of the block to perform transformation instead of selection. 

[1, 2, 3].map do |num|
  num * 2
end

# Similar to select, map also considers the return value of the block. The main difference between these two methods is that map uses the return value of the block to perform transformation instead of selection. 

# --------------------------------------

# What happens if we write some code in the block that's not a transformation instruction? 

[1, 2, 3].map do |num|
  num.odd? # => [true, false, true]
end

#* The key to remember here is that map always performs transformation based on the return value of the block. In this case, the return value of the block will be a boolean. 

# --------------------------------------

# What will the return value of map be in the following example? 

[1, 2, 3].map do |num|
  num.odd?
  puts num # => [nil, nil, nil]
end

#* map doesn't care about truthiness, and takes this return value as the transformation criteria

# --------------------------------------

# What is the only statement within the block is a string? What will the return value of map be? 

[1, 2, 3].map do |num|
  'hi' # => ["hi", "hi", "hi"]
end 

# Since 'hi' is the only statement within the block, the return value of the block is 'hi', which map will use as the transformation criteria. Therefore, the above code will return an array where each element is 'hi'. 





