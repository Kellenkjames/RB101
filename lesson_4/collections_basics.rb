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