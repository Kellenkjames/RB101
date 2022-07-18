#* Selection and Transformation

# Selection and transformation both utilize the basics of looping: a loop, a counter, a way to retreive the current value, and a way to exit the loop. 

# In addition, selection and transformation require some criteria; selection uses this criteria to determine which elements are selected, while transformation uses this criteria to determine how to perform the transformation. 

#----------------------------------------------

#* Looping to Select and Transform 

alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do 
  current_char = alphabet[counter]
  
  if current_char == 'g'
    selected_chars << current_char # appends current_char into the selected_chars string 
  end 
  
  counter += 1
  break if counter == alphabet.size
end 

selected_chars # => "g"

# The if condition is what determines which values are selected and which ones are ignored; this is the selection criteria. The rest of the code is just your basic loop iterating code. 

#----------------------------------------------

#* Transformations 

fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do 
  current_element = fruits[counter]
  
  transformed_elements << current_element + 's' # appends transformed string into array 
  
  counter += 1
  break if counter == fruits.size 
  
end 

transformed_elements # => ['apples', 'bananas', 'pears']

# Since we're applying the transformation to every element in the array, we don't need an if condition, but the entire line is the transformation criteria.

# Note that, in this example, we perform the transformation on a new array and leave the original array unchanged. 

#* When performing transformations, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.

#----------------------------------------------

#* Extracting Methods 

# Most of the time, selecting or transforming a collection is a very specific action -- select all the odd numbers, turn all elements into strings, etc -- which naturally lends the specific action being extracted into convenience methods.

# Ex) Let's say we wanted to extract all the vowels in a given string. We're going to use the helpful String#include? method here to assist us in determining whether a character is a vowel. 

=begin

* if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end

=end 

# Let's now put it all together into a select_vowels method so we can call this method on any string.

def select_vowels(str)
  selected_chars = ''
  counter = 0
  
  loop do
    current_char = str[counter]
    
    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end
    
    counter += 1
    break if counter == str.size
  end
  
  selected_chars
end

#* An important thing to note here is that when our method is done iterating over the collection it returns a new collection containing the selected values. In this case, our select_vowels method returns a new string.

p select_vowels('the quick brown fox') # => "euioo"

sentence = 'I wandered lonely as a cloud'
p select_vowels(sentence)   # => "Iaeeoeaaou"

# We can therefore call other methods on that return value. 

number_of_vowels = select_vowels('hello world').size
p number_of_vowels # => 3

#----------------------------------------------

#* Hashes 

# In this example we want to select the key-value pairs where the value is 'Fruit'. 

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# Implement a method (from scratch)
def select_fruit(product_list)
  produce_keys = product_list.keys 
  counter = 0
  selected_fruits = {}
  
  loop do 
    # This needs to be at the top in case the hash is "empty" 
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = product_list[current_key]
    
    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end 
    
    counter += 1
  end 
  
  selected_fruits
end 

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

#----------------------------------------------


