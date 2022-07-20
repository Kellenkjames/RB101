#* Practice Problems: Methods and More Methods 

# 1: What is the return value of the select method below? Why? 

[1, 2, 3].select do |num| 
  num > 5
  'hi'
end 

# => [1, 2, 3]

# Reason: select performs selection based on the truthniess of the block's return value. In this case the return value will always be 'hi' which is a "truthy" value. Therefore, select will return a new array containing all of the elements in the original array. 

#* Select returns an array containing ALL elements of enum for which the given block returns a true value. 

# --------------------------------------

# 2: How does count treat the block's return value? How can we find out? 

['ant', 'bat', 'caterpillar'].count do |str| 
  str.length < 4 
end 

# => 2 

# Reason: Within the count method, if a block is given, it counts the number of elements yielding a true value 

# --------------------------------------

# 3: What is the return value of reject in the following code? Why? 

[1, 2, 3].reject do |num| 
  puts num 
end 

# => [1, 2, 3]

# Reason: reject returns a new array containing items where the block's return value is "falsey". In other words, if the return value was false or nil the element would be selected. puts always returns nil. 