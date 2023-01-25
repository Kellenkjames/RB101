# Question 1

# Every object in Ruby has access to a method called `object_id`, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

a = "forty two"
b = "forty two"
c = a

puts a.object_id  # 60
puts b.object_id  # 80
puts c.object_id  # 60

=begin

Explanation: 

`a` and `b` reference different objects. Although the two objects look the same, i.e, they both have the value of "forty two"; they are still different objects. 

Meanwhile, the object ids show that `a` and `c` reference the same object. This is because `c` was initialized to the object referenced by `a`.

* Takeway: When a variable is initialized, it will always have a different object_id -- even if it has the SAME value as another object. 

=end 