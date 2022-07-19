#* More Methods

# There are many useful methods that come out of the box with Ruby, but they're only useful if we thoroughly understand how they work. 

# --------------------------------------

#* Enumerable#any?  https://docs.ruby-lang.org/en/2.7.0/Enumerable.html#method-i-any-3F 

[1, 2, 3].any? do |num| 
  num > 2
end
# => true 

#There are two return values that we need to be aware of here: the return value of the method and the return value of the block. 

# any? looks at the truthiness of the block's return value in order to determine what the method's return value will be. 

#* If the block returns a "truthy" value for any element in the collection, then the method will return true. 

# any? can also be used with a hash. The only difference is that the block requires two parameters in order to access the key and the value.

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
# => false 

# The above code returns a boolean, signifying whether any value in the hash is greater than 4. 

# --------------------------------------

#* Enumerable#all? 

# all? functions in a similar way to any?. It also looks at the truthiness of the block's return value, but the method only returns true if the block's return value in every iteration is truthy (that is, not false or nil).

[1, 2, 3].all? do |num| 
  num > 2
end
# => false 

# all? can also be called on a hash. 

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true

# --------------------------------------

#* Enumerable#each_with_index

# each_with_index is nearly identical to each. While both methods take a block and execute the code within the block, the block's return value is ignored. Unlike each, each_with_index takes a second argument which represents the index of each element.

[1, 2, 3].each_with_index do |num, index| 
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0. 
# The index of 2 is 1. 
# The index of 3 is 2. 
# => [1, 2, 3]

# --------------------------------------

# When calling each_with_index on a hash, the first argument now represents an array containing both the key and the value.

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end 

# The index of [:a, "ant"] is 0. 
# The index of [:b, "bear"] is 1. 
# The index of [:c, "cat"] is 2. 
# => { :a => "ant", :b => "bear", :c => "cat" }

#* Note: Just like each, each_with_index always returns the original calling collection. 

# --------------------------------------

#* Enumerable#each_with_object

[1, 2, 3].each_with_object([]) do |num, array| 
  array << num if num.odd? 
end

# => [1, 3]

#* In the above example, array is initialized to an empty array, []. Inside the block, we can now manipulate array. In this case, we're just appending the current num into it if it's odd. 

# --------------------------------------

# Similar to each_with_index, the first block argument turns into an array when we invoke each_with_object on a hash. 

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end

# => ["ant", "bear", "cat"]

# --------------------------------------

# As an additional quirk, it's possible to use parentheses to capture the key and value in the first block argument. 

{ a: "ant", b: "bear", c: "cat"}.each_with_object({}) do |(key, value), hash| 
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }

# --------------------------------------

#* Enumerable#first

# first doesn't take a block, but it does take an optional argument which represents the number of elements to return. When no argument is given, it returns only the first element in the collection. 

[1, 2, 3].first
# => 1

#* When an argument is provided, first will return the specified number of elements.

# Let's now try to call first on a hash. 

{ a: "ant", b: "bear", c: "cat"}.first(2) # return 2 elements 
# => [[:a, "ant"], [:b, "bear"]]

=begin

There are a couple of interesting things of note here.

1. First, hashes are typically thought of as unordered and values are retrieved by keys. In some programming languages, the order is not preserved at all. This used to be true for Ruby too, but since Ruby 1.9, order is preserved according to the order of insertion. Calling first on a hash doesn't quite make sense, but Ruby lets you do it.

2. Second, notice that the return value of calling first on a hash with a numeric argument is a nested array. This is unexpected. Fortunately, turning this nested array back to a hash is easy enough: [[:a, "ant"], [:b, "bear"]].to_h.

In practice, first is rarely called on a hash, and most often used with arrays.

=end 

# --------------------------------------

#* Enumerable#include? 






