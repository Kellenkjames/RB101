# Question 1

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

=begin

Explanation:

* `greeting` is `nil`. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it's undefined. 

* However, when you initialize a local variable within an `if` clause, even if that `if` clause doesn't get executed, the local variable is initialized to `nil`.

=end
