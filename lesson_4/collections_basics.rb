#* Collections Basics 

# Collections are made up of individual elements. In order to work with collections we need to understand how they are structured and how to reference and assign the individual elements within them. 

# --------------------------------------

#* String Element Reference 

# You can reference a specific character using this index. 
str = 'abcdefghi'
str[2] # => "c"

# This is  a call to the #slice method of String and is alternative syntax for str.slice(2, 3)
str[2, 3] # => "cde"

# Chaining Methods 
str[2, 3][0] # => "c"

# Str Methods 
str = 'The grass is green' # str[4, 5] # => "grass"

#* Technically, strings are not true collections, though we will often talk of strings as though they were. Collections contain multiple objects, while strings contain only a single object. The individual characters are not objects, but are just part of the object that contains the string value. 

# --------------------------------------

# Strings act like collections in that you can access and assign each character individually.  However, when you access a single character of the string with something like str[2], the return value is a brand new string - each time you call str[2], it returns a new string:

char1 = str[2]      # => "c"
char2 = str[2]     # => "c"
char1.object_id == char2.object_id # => false 

# --------------------------------------

#* Array Element Reference 

# Arrays are lists of elements that are ordered by index, where each element can be any object. Arrays use an integer-based index to maintain the order of its elements. A specific element can be referenced using its index. 

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2] # => "c"
arr[2, 3] # => ["c", "d", "e"] Array#Slice method (start, length)
arr[2, 3][0] # =>["c"]

# --------------------------------------

#* One situation where Array#slice does not return a new array is when we only pass the method a single index, rather than a start and length or a range; in this case the element at that index is returned rather than a new array. 

arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"] 
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"

# When calling methods such as this on a collection object like an array it is important to be aware of exactly what is returned, as this will affect how you can subsequently interact with that return 

# --------------------------------------

#* Hash Element Reference 

# Hashes are another very common collection data structure that, instead of using an integer-based index, uses key-value pairs, where the key or the value can be any type of Ruby object. This allows for a more expansive and descriptive collection of elements. 

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"

#* When initializing a hash, the keys must be unique. Try the following code out in irb: 
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# warning: key "fruit" is duplicated and overwritten on line 1

# --------------------------------------

# We can access just the keys or just the values from a hash with the #keys and #values methods of Hash. These methods return an array: 

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys                 # => [:uk, :france, :germany]
country_capitals.values             # => ["London", "Paris", "Berlin"]
country_capitals.values[0]        # "London"

# The above example uses symbols as keys. Although both hash keys and values can be any object in Ruby, it is common practice to use symbols as the keys. Symbols in Ruby can be thought of as immutable strings. There's a number of advantages to using symbols for hash keys, which we won't go into here, but it is important to be aware of this convention. 




