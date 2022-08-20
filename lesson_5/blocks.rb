#* Working with Blocks 

# Example 1) 

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# ------------------------------------------------------------------

=begin

* Explain what's happening here (in detail):

1. Each method is being called on a multi-dimensional array

2. Each will iterate over each sub-array and in turn wil be passed to the block

3. arr will be assigned as the local variable within the block 

4. arr#first will return the first object at index 0 (of the current array)...1, 3

5. puts method then outputs a string representation of the integer

6. puts returns nil, and since this is the last evaluated statement within the block, return value is nil. 

7. #* Each doesn't do anything with the returned value from the block (nil) 

8. The calling object is the final return value [[1, 2], [3, 4]]

=end 

# Example 2)

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end 
# 1
# 3
# => [nil, nil]

=begin

* Explain what's happening here (in detail):

1. Map method is being called on a multi-dimensional array 

2. Map will iterate over each sub-array and in turn will be passed to the block

3. arr will be assigned as the local variable within the block  

4. puts method then outputs a string representation of the integer 

5. arr#first will return the first object at index 0 (for each sub-array)

5. puts returns nil, since this is the last evaluated statement within the block, return value is nil

6. #* Map performs transformation based on the return value of the block (nil)

7. Since map returns a new array, the final output will be [nil, nil]

=end 

# ------------------------------------------------------------------

#) Example 3:

# Let's mix it up a little bit and have you try taking apart an example of your own. 

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]

=begin

* Explain what's happening here (in detail):

1. Map is being called on a multi-dimensional array 

2. Map will iterate over each sub-array and in turn will be passed to the block 

3. arr will be the local variable for the block 

4. arr#first will return the first object at index 0 for each sub-array 

5. puts will print the string representation of the integer which is 1 and 3 respectively

6. arr.first will return the integer objects of puts => 1, 3

7. Since map returns a new array, the final output will be [1, 3]

=end 

# ------------------------------------------------------------------

#) Example 4:  

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end 
end 
# 18
# 7
# 12
# => [[18, 7], [3, 12]]

=begin 

* Explain what's happening here (in detail):

1. Multi-dimensional array is being stored in the my_arr variable 

2. Each method is called on object and passed to block were arr is set as the local variable 

3. Each method is called on arr (local variable) and passed to block were num is set as the local variable. 

4. Num variable will represent each sub-array 

5. If sub-array contains number > 5, print string integer output 

6. puts will print the string representation of an nteger which is 18, 7, 12

7. since puts is the last evaluated statement, the method will return nil 

8. The final output of the method will be the calling object => [[18, 7], [3, 12]]

=end 

# ------------------------------------------------------------------

# Example 5: 

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]

=begin 

* Explain what's happening here (in detail):

1. Map method is being called on a multi-dimensional array and passed to the block 

2. arr is set to the local variable and represents the calling object 

3. Map method is called on the arr variable and passed to the block 

4. num is set to the local variable of the block and represents each integer of each sub-array 

5. num * 2 will return 2, 4, 6, and 8 respectively 

6. The final output will be a new_ary that returns => [[2, 4], [6, 8]]

=end 

# ------------------------------------------------------------------

# Example 6:

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

=begin 

* Explain what's happening here (in detail):

1. Select method is being called on array of hashes and passed to the block 

2. hash is the local variable assigned to the block and will represent each collection in the arr

3. all? method is called on the hash variable and passes each element of the collection to the given block

4. key, value represent local variables for each key-value pair of the hash collection 

5. value[0] == key.to_s will check for "truthiness". 

6. hash.all? returns false on the first collection since it never evaluates to true. 

7. Therefore, the final output will be #=> [{:c=> "cat"}] since this is the only collection that evaluates to true. 

=end 

