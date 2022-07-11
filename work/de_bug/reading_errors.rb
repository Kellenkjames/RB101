# You come across the following code. What errors does it raise for the given examples and what exactly do the error messages mean?

def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

=begin

Ex 1) Wrong number of arguments. The method defintion only has 1 paramter but the invocation of the method has "6" arguments - ArgumentError

Ex 2) Undefined method 'each' - this we cannot use the method each on a integer (1) which is being used as an argument. Integers do not have an "each" method - NoMethodError

=end 