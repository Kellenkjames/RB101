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

p ages.min








