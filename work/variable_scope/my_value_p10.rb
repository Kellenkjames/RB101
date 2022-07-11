a = 7
array = [1, 2, 3]

def my_value(ary, a)
  ary.each do |b|
    a += b # This will reassign and point to a new obj --> will not point to the same obj as the "outer" a
  end
end

my_value(array, a)
puts a

# Answer: Undefined method in block "+"

# Explanation: "a" at the top level is not visible inside the invocation of the "each" method with a block because the invocation of "each" is inside "my_value", and method definitions are self-contained with respect to local variables.

# Since the outer "a" is not visible inside the my_value method definition, it isn't visible inside the method invocation with a block. 