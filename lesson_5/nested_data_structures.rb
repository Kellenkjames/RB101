#* Nested Data Structures 

# It's not uncommon for collections to contain other collections. 

arr = [[1, 3], [2]]

# Retrieve the first inner array like we typically reference array elements 

arr[0]    # => [1, 3]

# Retrieve the second element from the first array -- the integer 3. 

arr[0][1] # => 3

# ----------------------------------------------------------------

#* Updating collection elements 

arr = [[1, 3], [2]]
arr[1] = "hi there"
arr                              # => [[1, 3], "hi there"]

# The arr[1] = "hi there" is a destructive action that permanently changed the second element in the arr array; it replaced the entire [2] inner array with the string "hi there".

# Likewise, we can modify a value in a nested array in a similar way. 

arr = [[1, 3], [2]]
arr[0][1] = 5
arr                              # => [[1, 5], [2]]

# ----------------------------------------------------------------

#* How to insert an additional element into an inner array: 

arr =[[1], [2]]
arr[0] << 3
arr # => [[1, 3], [2]]

# The line arr[0] << 3 is again a two part chain: the first part, arr[0] is element reference and returns [1]; and the second part can be thought of as [1] << 3, which destructively appends 3 into the inner array.

# Or we can also add another array instead of an integer:

arr = [[1], [2]]

arr[0] << [3]
arr # => [[1, [3]], [2]]

# This leaves us with a three-layer nested data structure.

# ----------------------------------------------------------------

# * Other nested structures 

# Arrays aren't the only data structure that can be nested. Hashes can be nested within an array as well. Let's study a simple example of that.

[{ a: 'ant'}, {b: 'bear'}]

# Let's suppose we want to add a new key/value pair into the first inner hash. Once again, there has to be a two step process: first, reference the first element in the array; next, update the hash.

arr = [{ a: 'ant'}, { b: 'bear'}]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]

# ----------------------------------------------------------------

#* Arrays can contain any type of Ruby object:

arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]                    # => ["a", ["b"]]
arr[0][1][0]           # => "b"
arr[1]                     # => { :b => "bear", :c => "cat" }
arr[1][:b]               # => "bear"
arr[1][:b][0]          # => "b"
arr[2][2]               # => "b"

# ----------------------------------------------------------------

#* Variable reference for nested collections 

# One common confusing aspect when working with nested collections is when variables are referencing inner collections directly. 

a = [1, 3]
b = [2]
arr = [a, b]
arr                 # => [[1, 3], [2]]

#* The local variables a and b are pointing to Array objects. When we place the local variables as elements in an array, it looks like the same as adding the actual Array objects that they're pointing to into the array.

# ----------------------------------------------------------------

# Example: What happens if we modify "a" after placing it in arr? 

a = [1, 3]
b = [2]
arr = [a, b]
arr                 # => [[1, 3], [2]]

a[1] = 5
arr                  # => [[1, 5], [2]]

#* The value of arr changed because "a" still points to the same Array object that's in arr. When we modified it by replacing 3 with 5, we were modifying the Array object. 

# What is we modify the first array in arr? Is it different than modifying a directly? 

arr[0][1] = 8 
arr         # =>      [[1, 8], [2]]
a            # =>     [1, 8]

#* It produces the same result as modifying a directly. Why is that? In both cases, we're modifying the object that a and arr[0] point to; we now have two ways to reference the same object. 

# ----------------------------------------------------------------

# Shallow Copy 

# Ruby provides two methods that let us copy an object, including collections: dup and clone

# Both of these methods create a shallow copy of an object. This means that only the object that the method is called on is copied. If the object contains other objects - like a nested array - then those objecs will be shared, not copied. 

# This has major impact to nested collections. 

#* dup allows objects within the copied object to be modified. 

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!             # => "B"

arr2           # => ["a", "B", "c"]
arr1           # => ["a", "B", "c"]

# ----------------------------------------------------------------

#* clone works the same way. 

arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse! 

arr2             # => ["cba", "def"]
arr1             # => ["cba", "def"]

#* Even if you mutate that object by referencing it from within a particular array or other collection it is the object you are affecting rather than the collection.

# ----------------------------------------------------------------


# Example 1: 

arr1 = ["a", "b", "c", "d"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end 

arr1              # => ["a", "b", "c"]
arr2             # => ["A", "B", "C"]

# Calling the destructive method Array#map! on arr2; this method modifies the array, replacing each element of arr2 with a new value. 

# Since we are changing the Array, not the elements within it, arr1 is left unchanged. 

# ----------------------------------------------------------------

# Example 2

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end 

arr1         # => ["A", "B", "C"]
arr2         # => ["A", "B", "C"]

# Both arr1 and arr2 are changed. Here, we call the destructive String#upcase! method on each element of arr2. 

# However, every element of arr2 is a reference to the object referenced by the corresponding element in arr1.

# Thus, when #upcase! mutates the element in arr2, arr1 is also affected; we change the Array elements, not the Array. 

# ----------------------------------------------------------------

#* Freezing Objects

# The main difference between dup and clone is that clone preserves the frozen state of the object.

arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array 

# dup doesn't preserve the frozen state of the object. 

arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2       # => ["a", "b", "c", "d"]
arr1        # => ["a", "b", "c"]

# ----------------------------------------------------------------

#* What is freezing? In Ruby, objects can be frozen in order to prevent them from being modified.

str = "abc".freeze
str << "d"
# => RuntimeError: can't modify frozen String 

#* Any attempt to modify an object that has called the freeze method will result in the program throwing a runtime error. 

# Only mutable objects can be frozen because immutable objects, like integers, are already frozen. We can check if an object is frozen with the fozen? method. 

5.frozen? #        => true 

# ----------------------------------------------------------------

# What does freeze actually freeze? 

#* freeze only freezes the object it's called on. 

#* If the object it's called on contains other objects, those objects won't be frozen. 

# For example, if we have a nested array the nested objects can still be modified after calling freeze.

arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]

# This also applies to strings within an array: 

arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]

# ----------------------------------------------------------------











