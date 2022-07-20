#* Practice Problems: Methods and More Methods 

# 1: What is the return value of the select method below? Why? 

[1, 2, 3].select do |num| 
  num > 5
  'hi'
end 

# => [1, 2, 3]

# Solution: select performs selection based on the truthniess of the block's return value. In this case the return value will always be 'hi' which is a "truthy" value. Therefore, select will return a new array containing all of the elements in the original array. 

#* Select returns an array containing ALL elements of enum for which the given block returns a true value. 

# --------------------------------------

# 2: How does count treat the block's return value? How can we find out? 

['ant', 'bat', 'caterpillar'].count do |str| 
  str.length < 4 
end 

# => 2 

# Solution: Within the count method, if a block is given, it counts the number of elements yielding a true value 

# --------------------------------------

# 3: What is the return value of reject in the following code? Why? 

[1, 2, 3].reject do |num| 
  puts num 
end 

# => [1, 2, 3]

# Solution: reject returns a new array containing items where the block's return value is "falsey". In other words, if the return value was false or nil the element would be selected. puts always returns nil. 

# --------------------------------------

# 4: What is the return value of each_with_object in the following code? Why? 

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

#* => { "a" => "ant", "b" => "bear", "c" => "cat" }

# Solution: When we invoke each_wth_object, we pass in an object ({} here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. 

# Once each_with_object has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.

#*  => returns the initially given object {}

# In this code, we start with the hash object, {}. On the first iteration, we add "a" => "ant" to the hash. On the second, we add "b" => "bear", and on the last iteration, we add "c" => "cat"

# --------------------------------------

# 5: What does shift do in the following code? How can we find out? 

hash = { a: 'ant', b: 'bear'}
hash.shift

# removes a key-value pair from hash => [a, 'ant']

# Solution: We can find this information by checking Hash#shift in the Ruby docs

#* shift removes a key-value pair from hash (destructively) and returns it as the two-item array [key, value], or the hash's default value if the hash is empty. 

# --------------------------------------

# 6: What is the return value of the following statement? Why? 

['ant', 'bear', 'caterpillar'].pop.size 

# => 11

# Solution: There are a couple things going on here. First, pop is being called on the array. pop destructively removes the last element from the calling array and returns it. 

# Second, size is being called on the return value by pop. Once we realize that size is evaluating the return value of pop (which is "caterpillar") then the final return value of 11 should make sense. 

# --------------------------------------

# 7: 
