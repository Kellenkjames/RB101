#* Practice Problems: Medium 2

# Question 1: Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

a = "forty two"
b = "forty two"
c = a

puts a.object_id # 240
puts b.object_id # 260
puts c.object_id # 240

