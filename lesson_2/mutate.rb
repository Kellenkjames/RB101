# mutate
a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently 
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}" # -> [1, 2, 3]
mutate(a)
p "After mutate method: #{a}" # -> [1, 2]

#---------------------------------------
b = [1, 2, 3]

# Example of a method definition that does not mutate the caller 
def no_mutuate(array)
  array.last 
end 

p "Before no_mutate method: #{b}"
no_mutuate(b)
p "After no_mutate method: #{b}"

#* This is the major point of this section: some operations mutate the address space, while others simply make the variable point to a different address space. 

# This also applies to variables that point to arrays, hashes, or any data structure that has methods that mutate the caller. 

#* If you call a method that mutates the caller, it will change the value in that object's address space, and any other variables that also point to that object will be affected. 

#* Therefore, always pay attention to whether your variables are pointing to the same object (address space) or if they are dealing with copies that occupy different address space. 

# Pass by value = "copying the original objects"
# Pass by reference = "changing the original objects i.e. mutating"

# Setter methods for class instance variables and indexed assignment are **not** the same as assignment. 

# Concatenation is Mutating 
# Setters are Mutating 

# In Ruby, almost everything is an object. When you call a method with some expression as an argument, that expression is evaluated by ruby and reduced, ultimately, to an object. 

#* When Ruby makes an object available inside of a method - this is called passing the object to the method, or, more simply, object passing. 

# Ruby uses strict evaluation exclusively which means every expression is evaluated and converted to an object before it is passed along to a method. 

#* Why is the Object Passing Strategy Important? 

# A pass by value strategy creates a copy of an object before passing it to a method. 

# A pass by reference strategy mutates the original object (does not create a copy)


def print_id number
  puts "In method object id = #{number.object_id}"
end
value = 33
puts "Outside method object id = #{value.object_id}"
print_id value