#* Practice Problems: Methods and More Methods 

# 1: What is the return value of the select method below? Why? 

[1, 2, 3].select do |num| 
  num > 5
  'hi'
end 

# => [1, 2, 3]

# Reason: select performs selection based on the truthniess of the block's return value. In this case the return value will always be 'hi' which is a "truthy" value. Therefore, select will return a new array containing all of the elements in the original array. 

#* Select returns an array containing all elements of enum for which the given block returns a true value. 

# --------------------------------------