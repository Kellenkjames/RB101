#* Practice Problems: Additional Practice

# 1: Turn this array into a hash where the names are the keys and the values are the positions in the array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Solution 1
hash = flintstones.each_with_index.to_h
puts hash

# Solution 2 
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
puts flintstones_hash

# Differences: 

#* 1. each_with_index.to_h returns the result of interpreting enum as a list of [key, value] pairs.

#* 2. each_with_index calls block with two arguments, the item and its index, for each item in enum. 

# --------------------------------------

# 2: Add up all of the ages from the Munster family hash

# Solution
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_arr = []
ages.each_value { |value| ages_arr << value }

p ages_arr.sum # => 6174

# --------------------------------------

# 3: In the age hash: remove people with age 100 and greater. 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |key, value| value >= 100 }
p ages

# --------------------------------------

# 4: Pick out the minimum age from our current Munster family hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# --------------------------------------

# 5: Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = flintstones.index { |name| name.start_with?("Be") }
puts be_index

# or 

p flintstones.index { |name| name[0, 2] == "Be" }

# --------------------------------------

# 6: Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3) }

# --------------------------------------

#* 7: Create a hash that expresses the frequency with which each letter occurs in this string: 

statement = "The Flintstones Rock"

# Remove all whitespace 
statement.gsub!(/\s+/, '')

# Split chars and count occurences 
statement_arr = statement.split('').tally
p statement_arr

# --------------------------------------

# 8: What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number| 
  p number
  numbers.shift(1)
end

# => [3, 4]

=begin

[1, 2, 3, 4]
Iteration 1: Starts from index 0 | removes first single element [1]

[2, 3, 4]
Iteration 2: Starts from index 1 | removes first single element [3]

[3, 4]
Iteration 3: Starts from index 2 
* loop ends here and returns because it has no element at index 2

=end 

numbers = [1, 2, 3, 4]
numbers.each do |number| 
  p number
  numbers.pop(1)
end 

# => [1, 2]

=begin

[1, 2, 3, 4]
Iteration 1: Starts from index 0 | removes last element of self [1]

[1, 2, 3]
Iteration 2: Starts from index 1 | removes last element of self [2]

# => [1, 2]
Iteration 3: Starts from index 2
* loop ends here and returns because it has no element at index 2

=end 


