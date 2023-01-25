# Question 3

# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"

# My string looks like this now: pumpkins

# Reason: Re-assignment, `String#+=` within the method does not mutate the argument when passed into the method.

#_____________________________________

puts "My array looks like this now: #{my_array}"

# My array looks like this now: ["pumpkins", rutabaga]

# Reason: The `Array#<<` method mutates the calling object when passed into the method -- it changes the original array.

#* Takeaway: In both cases, Ruby passes the arguments "by value", but unlike some other languages, the value that gets passed is a reference to some object; it's not a copy.

#*  Re-assignment creates a new `String` object. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.
