# In Ruby, booleans are represented by the true and false objects. Like everything else in Ruby, boolean objects also have real classes behind them, and you can call methods on true and false.

true.class              # => TrueClass
true.nil?                 # => false
true.to_s                # => "true"
true.methods        # => list of methods you can call on the true object

false.class             # => FalseClass
false.nil?                # => false
false.to_s               # => "false"
false.methods       # => list of methods you can call on the false object

#                                                                                                 

# Example 1 - The below will always output "hi"
if true
  puts "hi"
else
  puts 'goodbye'
end 