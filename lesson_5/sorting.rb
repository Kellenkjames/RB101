#* Sorting 

[2, 5, 3, 4, 1].sort                # => [1, 2, 3, 4, 5]

# Return value: a new array with the integers ordered sequentially according to their value. 

#* Comparison 

# Sorting is essentially carried out by comparing the items in a collection with each other, and ordering them based on the result of that comparison. 

#* Comparison is at the heart of how sorting works. 

# Let's look at another example: 

['c', 'a', 'e', 'b', 'd'].sort         # => ['a', 'b', 'c', 'd', 'e']

# When we call sort on an array, it doesn't know whether the array contains integers, strings, or some other type of object; so how does it know how to order the elements in the array? 

#* The answer is that it uses a method to determine this; the <=> method (sometimes referred to as the "spaceship" operator).

# -------------------------------------------------------------------------------------------------

# The <=> Method 

# Any object in a collection that we want to sort must implement a <=> method. 

# This method performs comparison between two objects of the same type and returns a -1, 0, or 1, depending on whether the first object is less than, equal to, or greater than the second object.

# If the two objects cannot be compared then nil is returned.

#* Less than: - 1
#* Equal to: 0
#* Greater than: 1

2 <=> 1              # => 1
1 <=> 2              # => -1
2 <=> 2              # => 0
'b' <=> 'a'          # => 1
'a' <=> 'b'          # => -1 
'b' <=> 'b'          # => 0
1 <=> 'a'             # => nil 

# -------------------------------------------------------------------------------------------------

# The return value of the <=> method is used by sort to determine the order in which to place the items. If <=> returns nil to sort then it throws an argument error. 

['a', 1].sort          # => ArgumentError: comparison of String with 1 failed

# If you want to sort a collection that contains particular types of objects (e.g. strings or integers) you need to know two things:

#* 1. Does that object type implement a <=> comparison method? 

#* 2. If yes, what is the specific implementation of that method for that object type (e.g. String#<=> will be implemented differently to Integer#<=>) 

# -------------------------------------------------------------------------------------------------

#* The ASCII Table (Examples)

# Comparing uppercase 'A' with lowercase 'a' returns -1 because 'A' preceded 'a' in ASCIIbetical order. 

'A' <=> 'a'            # => - 1

# Similarly '!' precedes 'A': 

'!' <=> 'A'             # => -1 

# You can determine a string's ASCII position by calling ord on the string. 

'b'.ord                   # => 98
'}'.ord                    # => 125

# Based on the above example we know that 'b' should come before '}'.

'b' <=> '}'              # => -1 

# -------------------------------------------------------------------------------------------------

# Useful rules to remember when working with sorting (ASCII):

#* 1. Uppercase letters come before lowercase letters

#* 2. Digits and (most) punctuation come before letters 

#* 3. There is an extended ASCII table containing accented and other characters - this comes after the main ASCII table 

# -------------------------------------------------------------------------------------------------

# The sort method: 

# In addition to calling sort on an array, we can call sort with a block; this gives us more control over how the items are sorted. 

# The block needs two arguments passed to it (the two items to be compared) and the return value of the block has to be -1, 0, 1, or nil. 

[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end 
# => [1, 2, 3, 4, 5]

# Switching order 
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end 
# => [5, 4, 3, 2, 1]

# -------------------------------------------------------------------------------------------------

[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end 
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]

# -------------------------------------------------------------------------------------------------

# Without running the code, try to figure out what would be returned here: 

['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ['ants', 'arc', 'bat', 'cap', 'cape']

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]

# -------------------------------------------------------------------------------------------------

# The sort_by method 

# sort_by is similar to sort but is usually called with a block. The code in the block determines how the items are compared.

['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end 
# => ["mat", "bed", "cot"]

# Here we are sorting using the character at index 1 of each string, so only the characters 'a', 'e' and 'o' are compared and the strings ordered according to the comparison of those characters. The other characters in the strings are ignored entirely.

# -------------------------------------------------------------------------------------------------

# sort_by hash: 

people = { Kate: 27, john: 25, Mike: 18 }

people.sort_by do |_, age| 
  age
end 
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

#* sort_by always returns an array, even when called on a hash, so the result here is a new array with the key-value pairs as objects in nested arrays. 

# What if we want to order the hash by name rather than age?  

# By using Symbol# <=> we are effectively comparing strings. We therefore know that we can sort our hash by name. 

# There is a problem though - you may have noticed one of the names. :john is not capitalized. 

#* Since strings are compared in 'ASCIIbetical' order, :john will come after :Kate and :Mike, which may not be what we want. 

# -------------------------------------------------------------------------------------------------

# How to solve: 
people.sort_by do |name, _|
  name.capitalize
end 
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]

# -------------------------------------------------------------------------------------------------

#* Other methods which use comparison:

# - min
# - max
# - minmax
# - min_by
# - max_by
# - minmax_by

#* Descriptions and examples of these methods can be found in the Enumerable module - these methods are available to Array and Hash. 

# -------------------------------------------------------------------------------------------------

# Summary: 

# Sorting is complex to carry out algorithmically on your own, but we can use the built-in sort and sort_by methods to do the complex work for us.

# Comparison is at the heart of sorting. When sorting collections, you need to know if the objects you want to sort on implement a <=> method and how that method is defined.

# Methods other than sort and sort_by also use comparison as the basis for how they work.





























