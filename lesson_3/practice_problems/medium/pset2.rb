#* Practice Problems: Medium 2

# Question 1: Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

a = "forty two"
b = "forty two"
c = a

puts a.object_id # 240
puts b.object_id # 260
puts c.object_id # 240

puts # ----------------------------------------------------------------

# Question 2: Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id # 85
puts b.object_id # 85
puts c.object_id # 85

#* Gothca: 'b' wasn't explicity initalized to the object referenced by 'a', but they have the same object id. What's going on? 

# It turns out that this has to do with how integers are "immutable"; that is, the value of an integer object cannot be mutated. 

#* In Ruby, each integer is a single immutable object (eg, there can only ever be one integer 1 object, one integer 2 object, and so on). 

# As a result, 'a', 'b', and 'c' all reference the same immutable integer 42 object. Any operation on an integer simply returns a new integer object. 

# Note that for performance reasons, true, false, and nil are also handled specially (i.e. every instance of 'true' will all have the same object ID). This also has to do with immutability of 'true', 'false', and 'nil'. 

puts # ----------------------------------------------------------------

# Question 3: Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkins 
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabaga"]

# Study the following code and state what will be displayed...and why:

# The String#+= operation is re-assignment and creates a new String object. The reference to this new object is assigned to a_string_param. The local variable a_string_param now points to "pumpkinsrutabaga", not "pumpkins". It has been re-assigned by the String#+= operation. This means that a_string_param and my_string no longer point to the same object.

#* This means that a_string_param and my_string no longer point to the same object. 

# With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it. 

# So, because the local variable an_array_param still points to the original object, the local variables my_array and an_array_param are still pointing at the same object, and we see the results of what happened to the array "outside" of the method. 

puts # ----------------------------------------------------------------

# Question 4: To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

puts # ----------------------------------------------------------------

#* Question 5: Depending on a method to modify its arguments can be tricky: 

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain? 

# That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']

def no_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  #* Since the above has reassignment (points to a new object) we can return the values 
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = no_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts # ----------------------------------------------------------------

#* Question 6: How could the following method be simplified without changing its return value? 

def color_valid_complex(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Both of these methods so exactly the same thing - but one is much more complex to read. 
def color_valid_simple(color)
  color == "blue" || color == "green"  
end 

puts color_valid_simple("blue")
puts color_valid_simple("green")
puts color_valid_simple("orange")