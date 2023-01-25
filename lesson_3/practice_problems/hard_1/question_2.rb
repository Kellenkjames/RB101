# Question 2

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a] # => 'hi'
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings                #  => { a: 'hi there' }

=begin

Explanation:

* The output is {:a=>"hi there"}. The reason is because `informal_greeting` is a reference to the original object. 

* The line `informal_greeting` << ` there` was using the `String#<<` method, which modifies the object that called it. 

This means that the original object was changed, thereby impacting the value in `greetings`.

=end