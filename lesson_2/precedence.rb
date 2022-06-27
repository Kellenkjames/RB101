#* Precedence 

# def value(n)
#   puts n 
#   n 
# end 

# puts value(3) + value(5) * value(7)

#---------------------------------
# 3 ? 1 / 0 : 1 + 2 # raises error ZeroDivisionError
# 5 && 1 / 0 # raises error ZeroDivisionError 
# nil || 1 / 0 # raises error ZeroDivisionError

# What happens, though, if we modify things so that 1 / 0 isn't needed? 

# In all 3 cases, 1/0 never gets executed - it will only execute if the first part of the statement is "truthy"
# nil ? 1 / 0 : 1 + 2 # 3
# nil && 1 / 0 # nil 
# 5 || 1 / 0 #5

#---------------------------------
#* Diving Deeper: Strong vs Weak Bindings 

array = [1, 2 , 3]

# Strong binding (array.map is called with the block, then the return value gets passed to p)
p array.map { |num| num + 1 } # => [2, 3, 4]

p array.map # outputs <Enumerator: [1, 2, 3]:map> 

# Weak Binding (array.map gets executed first, then the return value gets passed to p)
p array.map do |num| # outputs <Enumerator: [1, 2, 3]:map> 
  num + 1
end # => <Enumerator: [1, 2 ,3]:map> 

sample_arr = [1, 2, 3]
p(array.map) do |num|
  num + 1 # <Enumerator: [1, 2 ,3]:map> 
end  # => <Enumerator: [1, 2 ,3]:map> 

p(sample_arr.map { |num| num + 1})  # [2, 3, 4] && => [2, 3, 4]

#---------------------------------
#* Tap Method (primary purpose is to "tap into" a method chain, in order to perform operations on intermediate results within the chain.)

mapped_array = array.map { |num| num + 1}

mapped_array.tap { |value| p value} # => [2, 3, 4]

mapped_and_tapped = mapped_array.tap { |value| p 'hello' } # 'hello'
mapped_and_tapped # => [2, 3, 4]

#---------------------------------

(1..10)                                         .tap { |x| p x } # 1..10
  .to_a                                         .tap { |x| p x } # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  .select { |x| x.even? }              .tap { |x| p x } # [2, 4, 6, 8, 10]
  .map { |x| x*x }                        .tap { |x| p x } # [4, 16, 36, 64, 100]







