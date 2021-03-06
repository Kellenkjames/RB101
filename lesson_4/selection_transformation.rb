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

puts selected_chars # => "g"

# The 'if' condition is what determines which values are selected and which ones are ignored; this is the 'selection criteria'. The rest of the code is just your basic loop iterating code.

#----------------------------------------------

# We can apply these same concepts to transformation.

fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do 
  current_element = fruits[counter]
  
  transformed_elements << current_element + 's' # appends trasformed string into array 
  
  counter += 1
  break if counter == fruits.size
end 

# Since we're applying the transformation to every element in the array, we don't need an if condition, but the entire line is the transformation criteria. Note that, in this example, we perform the transformation on a new array and leave the original array unchanged. 

#* When performing transformations, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned. 

#----------------------------------------------

#* Extracting to Methods 

# Most of the time, selecting or transforming a collection is a very specific action -- select all the odd numbers, turn all elements into strings, etc -- which naturally lends the specific action being extracted into convenience methods.

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

# An important thing to note here is that when our method is done iterating over the collection - it returns a new collection containing the selected values. In this case, our 'select_vowels' method returns a new string. 

select_vowels('the quick brown fox')      # => "euioo"

sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)                   # => "Iaeeoeaaou"

# We can therefore call other methods on that return value 
number_of_vowels = select_vowels('hello world').size 
number_of_vowels # => 3

#----------------------------------------------

#* Hashes

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  produce_keys = produce_list.keys 
  counter = 0
  selected_fruits = {}
  
  loop do 
    # This has to be at the top in case produce_list is empty hash 
    break if counter == produce_list.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    #* Selection Criteria 
    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end
    
    counter += 1
  end
  
  selected_fruits
end 

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# Notice that

# the original argument, produce_list, it not mutated 
# a new hash is returned by the method (as opposed to an array or string)

#----------------------------------------------

#* Transformation Examples: 

def double_numbers(numbers)
  double_numbers = []
  counter = 0
  
  loop do 
    break if counter == numbers.size 
    
    current_number = numbers[counter]
    double_numbers << current_number * 2
    
    counter += 1
  end 
  
  double_numbers
end 

# We can invoke the method like this: 
my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

#----------------------------------------------

#* Implement a double_numbers! method that mutates its argument

def double_numbers!(numbers)
  counter = 0
  
  loop do 
    break if counter == numbers.size
    
    numbers[counter] *= 2
    
    counter += 1
  end
  
  numbers
end 

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

p my_numbers # arg has now been permanently modified => [2, 8, 6, 14, 4, 12]

# rather than returning a new array, this method returns a reference to the (mutated) original array

#----------------------------------------------

#* Method that only transforms a subset of elements in the collection. 

def double_odd_numbers(numbers)
  double_numbers = []
  counter = 0
  
  loop do 
    break if counter == numbers.size
    
    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    double_numbers << current_number
    
    counter += 1
  end 
  
  double_numbers
end 

# Note: This method does not mutate its argument and instead returns a new array. We can call it like so:

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers) # => [2, 4, 6, 14, 2, 6]

#----------------------------------------------

#* Create method that transforms the numbers based on their position in the array rather than their value

def double_odd_numbers(numbers)
  double_numbers = []
  counter = 0
  
  loop do 
    break if counter == numbers.size 
    
    current_number = numbers[counter]
    current_number *= 2 if counter.odd? 
    double_numbers << current_number
    
    counter += 1
  end 
  
  double_numbers
end 

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers) # => [1, 8, 3, 14, 2, 12]

#----------------------------------------------

#* More Flexible Methods 

def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}
  
  loop do 
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end 
    
    counter += 1
  end 
  
  selected_produce
end 

# To use the above general_select method, we have to pass in a collection and some selection criteria. In this specific case, the criteria is hardcoded to match with a value: if there's a match between the criteria and value, then the current key-value pair is selected into the selected_produce hash. Here's how we can use this method:

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}

#----------------------------------------------

#* Update our double_numbers method

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0
  
  loop do 
    break if counter == numbers.size
    
    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end 
  
  multiplied_numbers
end 

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

#* Note that the original argument is not mutated and that we're returning a new array here. 

#----------------------------------------------

# Write a method called select_letter, that takes a string and returns a new string containing only the letter that we specified:

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0
  
  # same as for loop 
  loop do 
    break if counter == sentence.size 
    current_char = sentence[counter]
    
    if current_char == character
        selected_chars << current_char
    end 
    
    counter += 1
  end 
  
  selected_chars 
end 

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

#----------------------------------------------

#* The for loop 

alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char 
end 

#----------------------------------------------

=begin

* Summary 

We often want to perform iteration, selection or transformation operations on a collection. Using these 3 actions, we can manipulate a collection nearly any way we need to.

Typically, these are generic actions that we can move into a method, so that we can perform these generic operations repeatedly on different collections.

* Pay attention to when the original collection is mutated vs when the method returns a new collection. This might seem trivial right now, but it's a source of a lot of misunderstanding. Make certain to study this.

Understand how these methods can be made more generic by allowing for additional parameters to specify some criteria for selection or transformation.

Finally, it's common to chain actions on collections; but pay special mind to the return value, especially if the return value is an empty collection or nil. Trying to chain methods on empty collections or nil is dangerous and results in a lot of broken programs.

=end 
