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

#* Technically, strings are not true collections, though we will often talk of strings as though they were. Collections contain multiple objects, while strings contain only a 'single' object. The individual characters are not objects, but are just part of the object that contains the string value. 

# --------------------------------------

# Strings act like collections in that you can access and assign each character individually.  However, when you access a single character of the string with something like str[2], the return value is a brand new string - each time you call str[2], it returns a new string:

char1 = str[2]      # => "c"
char2 = str[2]     # => "c"
char1.object_id == char2.object_id # => false 

#* If str were a real collection, the char1 and char2 objects would have the same object_id

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

# When calling methods such as this on a collection object like an array it is important to be aware of exactly what is returned, as this will affect how you can subsequently interact with that return value. 

# --------------------------------------

#* Hash Element Reference 

# Hashes are another very common collection data structure that, instead of using an integer-based index, uses key-value pairs, where the key or the value can be any type of Ruby object. This allows for a more expansive and descriptive collection of elements. 

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"

# When initializing a hash, the keys must be unique. Try the following code out in irb: 
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

#* warning: key "fruit" is duplicated and overwritten on line 1

# --------------------------------------

# We can access just the keys or just the values from a hash with the #keys and #values methods of Hash. These methods return an array: 

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys                 # => [:uk, :france, :germany]
country_capitals.values             # => ["London", "Paris", "Berlin"]
country_capitals.values[0]        # => "London"

# The above example uses symbols as keys. Although both hash keys and values can be any object in Ruby, it is common practice to use symbols as the keys. Symbols in Ruby can be thought of as immutable strings. There's a number of advantages to using symbols for hash keys, which we won't go into here, but it is important to be aware of this convention. 

# --------------------------------------

#* Element Reference Gotchas 

# There are a few things that can catch you off guard when referencing elements in a collection and you need to be aware of these in order to avoid unintended behavior in your code.

#* Out of Bounds Indices

# Both arrays and strings can be thought of as indexed collections. That is, we can reference individual elements within the object via their index.

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[2] # => "c"
arr[2] # => "c"

# What happens if we try to reference using an index greater than 4? 

str[5] # => nil 
arr[5] # => nil 

#* Referencing an out-of-bounds index in this way returns nil. This is not necessarily a problem for a string, since we know that nil is an invalid return value; with an array, nil could be a valid return value since arrays can contain any other type of object, including nil.

arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil

# --------------------------------------

# How can we tell the difference between the valid return and the out-of-bounds reference? 

# Array has a method called #fetch

#* Fetch tries to return the element at position index, but throws and IndexError exception if the referenced index lies outside of the array bounds. 

arr.fetch(2)      # => nil 
arr.fetch(2)      # => IndexError: index 3 outside of array bounds: -3...3

# fetch throws an IndexError exception if the index is out of bounds. This is very helpful for catching indices that are out of bounds. It's better to use #fetch since it enforces the array boundaries. If you really want to be safe, use #fetch in your own code. However, be aware that most existing Ruby code doesn't use #fetch, including much of the code you'll see here in Launch School. 

#* Always try to think about whether nil is the real element in the array or if it's Ruby's way of telling us we've gone beyond the array boundary. 

# If you really want to be safe, use #fetch in your own code. 

# --------------------------------------

#* Negative Indices 

# We've seen what happens if you try to reference an element using an index greater than the last index of the string or array. What if we use an index less than 0? 

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[-2] # => "d"
arr[-2] # => "d"

# Elements in String and Array objects can be referenced using negative indices, starting from the last index in the collection -1 and working backwards. 

# --------------------------------------

# What do you think would be returned by the following calls? 

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

# str.fetch[-6] # => nil 
# arr.fetch[-6] # => nil 

# --------------------------------------

#* Invalid Hash Keys

# Hash also has a #fetch method which can be useful when trying to disambiguate valid hash keys with a nil value from invalid hash keys. 

hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
# hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
# hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'

# In the above example both the string 'c' and the symbol :d are invalid keys; the string 'b' and the symbol :c are valid keys. Remember that both keys and values can be of any object. When referencing an item by its key you must use the correct object type. 

# --------------------------------------

#* Conversion 

# The fact that strings and arrays share similarities, such as both being zero-indexed collections, lends itself to being able to convert from one to the other, and this is quite common practice in Ruby code. There are a number of Ruby methods that facilitate this type of conversion including String#chars and Array#join.  

str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]

# Array#join returns a string with the elements of the array joined together. 

arr.join # => "Practice"

# --------------------------------------

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

# Can you think of a couple of ways in which the items in the array could be joined together so that result resembles the original string? 

arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' + arr[5] + ' ' + arr[6]
# => "How do you get to Carnegie Hall?"

# or 

arr.join(', ') # => 'How do you get to Carnegie Hall?'

# --------------------------------------

hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [ [:sky, "blue"], [:grass, "green"] ]

#* Notice the array that is returned from #to_a contains two other arrays, each sub-array containing a symbol and a string. Each sub-array is equivalent to a key-value pair from the initial hash. 

# Just like Hash has a #to_a method, Array has a #to_h method. What do you think would happen if #to_h was called on the following array? 

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]

arr.to_h # => { :name => "Joe", :age => 10, :favorite_color => "blue" }

# --------------------------------------

# Element Assignment

#* String Element Assignment 

# We can use the element assignment notation of String in order to change the value of a specific character within a string by referring to its index. Say for example that we wanted to change the first letter of the first word in a sentence to its uppercase equivalent, we could do this in the following way.

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

#* You may have noticed that the string in the above example uses double quotation marks "...". You might remember from the Strings section of the Introduction to Programming with Ruby book that the reason is because the string itself includes a single quote mark (in the word "joe's") and surrounding the whole string in double quotations is one way to allow this.

# Using the same element assignment method, how would you change the first letter of the remaining words in the sentence to their uppercase versions? Try it out in a code file or in irb. 

# puts str.index('f')
# puts str.index('c')
# puts str.index('i')
# puts str.index('b')

str[6] = 'F'
str[15] = 'C'
str[11] = 'I'
str[24] = 'B' 

puts str # => "Joe's Favorite Color is Blue"

# Note that this way of modifying a string is a destructive action; that is, the "str" string is changed permanently. 

# --------------------------------------

#* Array Element Assignment 

# Similar to how we can assign individual characters in a string using their index, we can assign elements of an array in the same way.

arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

# Increase the value of the rest of the integers in the array by 1. 

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1

# or 

#arr.each { |num| p num += 1 }

#* Note that, once again, this is a destructive action that permanently modified arr. 

# -------------------------------------- 

#* Hash Element Assignment 

# Hash element assignment is not too dissimilar. The hash key is used instead of assigning a value using an index.

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

# In irb or a code file use the same method to set a value of either 'Fruit' or 'Vegetable' to each element in the hash.

hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'

p hsh # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }